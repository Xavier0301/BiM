#include "dispatcher.h"
#include "common.h"

#include "math.h"

#define MUL(a, b) ((a) * (b))

u32 dpu_mram_max_inputs(model_params_t* p, u32 filters_per_dpu, u32 bytes_per_filter, u32 bits_per_dpu, u32 blocks_per_dpu) {
    u32 encoding_bytes = MUL(
        blocks_per_dpu * p->dim1_block_size * bits_per_dpu,
        sizeof(u8)
    );

    u32 order_bytes = MUL(
        blocks_per_dpu * p->dim1_block_size * bits_per_dpu,
        sizeof(u16)
    );

    u32 hash_params_bytes = MUL(
        p->filter_hashes * p->filter_inputs,
        sizeof(u16)
    );

    u32 filter_bytes = MUL(
        filters_per_dpu, 
        bytes_per_filter
    );

    u32 leftover_bytes = MRAM_EFFECTIVE_BYTES - encoding_bytes - order_bytes - hash_params_bytes - filter_bytes;

    u32 single_input_bytes = blocks_per_dpu * p->dim1_block_size * bits_per_dpu * sizeof(u8);

    u32 num_inputs = leftover_bytes / single_input_bytes;

#if PRINT
    printf("DPU MRAM layout\n");
    printf("\tEncoding: %d bytes\n", encoding_bytes);
    printf("\tOrder: %d bytes\n", order_bytes);
    printf("\tHash Params: %d bytes\n", hash_params_bytes);
    printf("\tFilters: %d bytes\n", filter_bytes);
    printf("\tInputs: %d bytes (%d * %d)\n", leftover_bytes, single_input_bytes, num_inputs);
#endif

    return num_inputs;
}

u32 dpu_search_min_dpus(model_params_t*p , u32* num_bits, u32* num_blocks, u32* num_filters) {
    u32 max_bits = p->bits_per_input;
    // u32 max_blocks = p->num_inputs / p->dim1_block_size;
    u32 max_blocks = p->num_inputs / p->dim1_block_size;
    u32 max_filters = p->num_filters;

    u32 filters_per_bit_block = p->num_filters / (max_bits * max_blocks);

#if PRINT == 1
    printf("=== Searching for min DPUs [bits %u | blocks %u | filters %u] ===\n\n", max_bits, max_blocks, max_filters);
#endif

    u32 min_dpus = UINT32_MAX;

    for(u32 blocks_per_dpu = 1; blocks_per_dpu <= max_blocks; ++blocks_per_dpu) {
        for(u32 bits_per_dpu = 1; bits_per_dpu <= max_bits; ++bits_per_dpu) {
            if(p->bits_per_input % bits_per_dpu != 0) continue; // cannot have a non-divisor number of bits per input
// #if PRINT == 2
//             u32 num_filters_ = dpu_wram_max_filters(p, bits_per_dpu, blocks_per_dpu, 1);
// #else
//             u32 num_filters_ = dpu_wram_max_filters(p, bits_per_dpu, blocks_per_dpu, 0);
// #endif
            u32 num_filters_ = filters_per_bit_block * bits_per_dpu * blocks_per_dpu;

            if(!fits_in_wram(p, bits_per_dpu, blocks_per_dpu, num_filters_, 0)) continue;

            u32 filters_per_dpu = min(num_filters_, max_filters); // cannot have more filters than there are in a class
            if(filters_per_dpu < p->num_filters) {
                // make the number of filters per dpu a divisor of the number of filters
                filters_per_dpu = p->num_filters / divceil(p->num_filters, filters_per_dpu);
            }
            if(filters_per_dpu > filters_per_bit_block * bits_per_dpu * blocks_per_dpu) {
                // cannot have more filters than needed by the input
                filters_per_dpu = filters_per_bit_block * bits_per_dpu * blocks_per_dpu;
            }

            u32 dpus_per_class = dpu_count_per_class(p, filters_per_dpu);

            u32 dpus_per_model = dpus_per_class * p->num_classes;

            if(dpus_per_model <= min_dpus) { // we do >= and not > because we want to maximize the number of bits
                min_dpus = dpus_per_model;

                *num_bits = bits_per_dpu;
                *num_blocks = blocks_per_dpu;
                *num_filters = filters_per_dpu;
            }

    #if PRINT == 1
            printf("\t%u blocks x %u bits: %u filters => %u dpus [%u]\n", 
                blocks_per_dpu, bits_per_dpu, filters_per_dpu, dpus_per_model, min_dpus == dpus_per_model);
    #endif
        }
    }

#if PRINT == 1
    fits_in_wram(p, *num_bits, *num_blocks, *num_filters, 1);
#endif

    return min_dpus;
}

u32 dpu_wram_max_filters(model_params_t* p, u32 bits_per_dpu, u32 blocks_per_dpu, int print) {
    u32 encoding_bytes = blocks_per_dpu * p->dim1_block_size * bits_per_dpu * sizeof(u8);
    u32 order_bytes = blocks_per_dpu * p->dim1_block_size * bits_per_dpu * sizeof(u16);
    u32 hash_params_bytes = p->filter_hashes * p->filter_inputs * sizeof(u16);
    u32 shared_buffers = encoding_bytes + order_bytes + hash_params_bytes;

    if(print) {
        printf("DPU WRAM layout\n");
        printf("\tEncoding: %u bytes\n", encoding_bytes);
        printf("\tOrder: %u bytes\n", order_bytes);
        printf("\tHash Params: %u bytes\n", hash_params_bytes);
    }

    u32 private_buffer1_bytes = blocks_per_dpu * p->dim1_block_size * bits_per_dpu * sizeof(u8);
    u32 private_buffer2_bytes = blocks_per_dpu * p->dim1_block_size * bits_per_dpu * sizeof(u8);
    u32 private_buffers_bytes = (private_buffer1_bytes + private_buffer2_bytes) * NR_TASKLETS;

    if(print) {
        printf("\tPrivate Buffers: %u bytes ((%u * 2) * %u)\n", private_buffers_bytes, private_buffer1_bytes, NR_TASKLETS);
    }

    i32 leftover_bytes = WRAM_EFFECTIVE_BYTES - shared_buffers - private_buffers_bytes;
    if(leftover_bytes < 0) {
        leftover_bytes = 0;
    }

    u32 single_filter_bytes = p->filter_entries * sizeof(u8) >> 3;
    u32 indivisible_filter_bytes = single_filter_bytes * bits_per_dpu * blocks_per_dpu;

    u32 num_filter_groups = leftover_bytes / indivisible_filter_bytes;
    u32 num_filters = num_filter_groups * blocks_per_dpu * bits_per_dpu;

    if(print) {
        printf("\tFilter Entries: %u bytes (%u x %u bytes)\n", num_filters * single_filter_bytes, num_filters, single_filter_bytes);
    }

    return num_filters;
}

int fits_in_wram(model_params_t* p, u32 bits_per_dpu, u32 blocks_per_dpu, u32 filters_per_dpu, int print) {
    u32 encoding_bytes = blocks_per_dpu * p->dim1_block_size * bits_per_dpu * sizeof(u8);
    u32 order_bytes = blocks_per_dpu * p->dim1_block_size * bits_per_dpu * sizeof(u16);
    u32 hash_params_bytes = p->filter_hashes * p->filter_inputs * sizeof(u16);
    u32 single_filter_bytes = p->filter_entries * sizeof(u8) >> 3;
    u32 filter_bytes = filters_per_dpu * single_filter_bytes;
    u32 shared_buffers = encoding_bytes + order_bytes + hash_params_bytes + filter_bytes;

    u32 private_buffer1_bytes = blocks_per_dpu * p->dim1_block_size * bits_per_dpu * sizeof(u8);
    u32 private_buffer2_bytes = blocks_per_dpu * p->dim1_block_size * bits_per_dpu * sizeof(u8);
    u32 private_buffers_bytes = (private_buffer1_bytes + private_buffer2_bytes) * NR_TASKLETS;

    u32 total_bytes = shared_buffers + private_buffers_bytes;
    i32 leftover = WRAM_EFFECTIVE_BYTES - total_bytes;
    int fits = leftover >= 0;

    if(print) {
        if(!fits) printf("[OVERFLOW]");
        else printf("[OK]");
        printf("DPU WRAM layout\n");
        printf("\tEncoding        %5u bytes                   [%2.2f %%]\n", encoding_bytes, encoding_bytes * 100 / (f32) WRAM_EFFECTIVE_BYTES);
        printf("\tOrder           %5u bytes                   [%2.2f %%]\n", order_bytes, order_bytes * 100 / (f32) WRAM_EFFECTIVE_BYTES);
        printf("\tHash Params     %5u bytes                   [%2.2f %%]\n", hash_params_bytes, hash_params_bytes * 100 / (f32) WRAM_EFFECTIVE_BYTES);
        printf("\tFilters         %5u bytes (%2u x %4u bytes) [%2.2f %%]\n", filter_bytes, filters_per_dpu, single_filter_bytes, filter_bytes * 100 / (f32) WRAM_EFFECTIVE_BYTES);
        printf("\tPrivate Buffers %5u bytes (%2u x %4u bytes) [%2.2f %%]\n", private_buffers_bytes, NR_TASKLETS, private_buffer1_bytes + private_buffer2_bytes, private_buffers_bytes * 100 / (f32) WRAM_EFFECTIVE_BYTES);
        printf("\tTotal           %5u bytes                   [%2.2f %%]\n", total_bytes, total_bytes * 100 / (f32) WRAM_EFFECTIVE_BYTES);
        printf("\tLeftover        %5u bytes                   [%2.2f %%]\n", leftover, leftover * 100 / (f32) WRAM_EFFECTIVE_BYTES);
    }

    return fits;
}

u32 dpu_count_per_class(model_params_t* p, u32 filters_per_dpu) {
    assert(p->num_filters % filters_per_dpu == 0);
    u32 dpus_per_class = (p->num_filters) / filters_per_dpu;

    return dpus_per_class;
}

// dpu_content_list_t dispatch_single(model_params_t* p) {
//     u32 filters_per_dpu = dpu_wram_max_filters(p);
//     u32 classes_per_dpu = min(filters_per_dpu / p->num_filters, p->num_classes);

//     u32 dpus_per_block = divceil(p->num_classes * p->num_filters, filters_per_dpu); // total_filters / filters_per_dpu
//     u32 num_blocks = p->num_inputs_total / p->dim1_block_size;
//     u32 dpus_per_model = dpus_per_block * num_blocks;

//     u32 input_blocks_per_dpu = dpu_mram_max_input_blocks(p, classes_per_dpu);

//     dpu_content_t* contents = (dpu_content_t*) malloc(sizeof(dpu_content_t) * dpus_per_model);

// #if PRINT
//     printf("DPU dispatch\n");
//     printf("\tClasses: %d\n", classes_per_dpu);
//     printf("\tFilters: %d\n", filters_per_dpu);
//     printf("\tDPUs per Model: %d\n", dpus_per_model);
// #endif

//     printf("\tDetail:\n");
//     for(u32 block_it; block_it < num_blocks; ++block_it) {
//         printf("\t\tBlock %d: ", block_it);
//         for(u32 dpu_it = 0; dpu_it < dpus_per_block; ++dpu_it) {
//             u32 dpu_id = block_it * dpus_per_block + dpu_it;
//             contents[dpu_id].block = block_it;
//             contents[dpu_id].dpu = dpu_id;
//             // TODO: intra-class dispatch (i.e. if classes_per_dpu < 1)
//             contents[dpu_id].classes = (range_t) { .start = dpu_it * classes_per_dpu, .end = (dpu_it + 1) * classes_per_dpu - 1 };
//             contents[dpu_id].inputs = (range_t) { .start = dpu_it * input_blocks_per_dpu, .end = (dpu_it + 1) * input_blocks_per_dpu - 1 };

//             printf(
//                 "[dpu %d][c %d-%d][i %d-%d] ", 
//                 dpu_id, 
//                 contents[dpu_id].classes.start, contents[dpu_id].classes.end, 
//                 contents[dpu_id].inputs.start, contents[dpu_id].inputs.end
//             );
//         }
//         printf("\n");
//     }

//     return (dpu_content_list_t) { 
//         .contents = contents, 
//         .num_blocks = num_blocks, 
//         .dpus_per_block = dpus_per_block,
//         .total_dpus = dpus_per_model
//     };
// }
