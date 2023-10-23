/*
* AXPY with multiple tasklets
*
*/
#include <stdint.h>
#include <stdio.h>
#include <defs.h>
#include <mram.h>
#include <alloc.h>
#include <perfcounter.h>
#include <barrier.h>

#ifdef EXT_PROFILE
#include <profiling.h>
#endif

#include "../support/common.h"
#include "../support/cyclecount.h"

#include "tinytensor.h"
#include "tinylib.h"

// Input and output argumentsd
__host dpu_params_t DPU_INPUT_ARGUMENTS;
__host dpu_results_t DPU_RESULTS[NR_TASKLETS];

// Shared wram data
u8* thresholds;
u16* order;
mat_u16 hash_params;
mat_u8 filters;

// Barrier
BARRIER_INIT(reset_barrier, NR_TASKLETS);
BARRIER_INIT(initialization_barrier, NR_TASKLETS);

#ifdef EXT_PROFILE 
PROFILING_INIT(p_init);
PROFILING_INIT(p_encode);
PROFILING_INIT(p_reorder);
PROFILING_INIT(p_hash);
PROFILING_INIT(p_reduction);
#endif

inline 
u8 get_bit(u8* data, u32 index) {
    u32 byte = index >> 3;
    u32 bit = index & 0b111;

    return (data[byte] >> bit) & 1;
}

// output is of shape (num_bits, len)
// thresholds is of shape (len, num_bits)
inline
void encode_buffer(u8* input, u8* output, u32 num_bits, u8* thresholds, u32 len) {
    u8* thresholds_chunk = thresholds;
    for(u32 it = 0; it < len; ++it) {
        u8 input_el = input[it];
        u8* output_ptr = output + it;
        for(u32 bit_it = 0; bit_it < num_bits; ++bit_it) {
            *output_ptr = input_el > thresholds_chunk[bit_it];
            output_ptr += len;
        }
        thresholds_chunk += num_bits;
    }
}

inline 
void reorder(u8* input, u8* output, u16* order, u32 len) {
    for(u32 it = 0; it < len; ++it) {
        output[it] = input[order[it]];
    }
}

// input is preprocessed to be 0xff or 0x00 instead of 0b1 or 0b0. See encode_buffer
inline 
void h3_hash(u8* input, u16* output, u16* params, u32 len) {
    u32 result = params[0] & (input[0]);
    // u32 result = params[0];
    for(u32 i = 1; i < len; ++i) {
        // if(input[i]) result ^= params[i];
        result ^= params[i] & (input[i]);
        // result ^= params[i];
        // result ^= params[i] & (- (i16) input[i]);
    }
    *output = result;
}

inline 
u8 and_reduce(u16* input, u8* lookup_table, u32 len) {
    u8 result = get_bit(lookup_table, input[0]);
    for(u32 i = 1; i < len; ++i) {
        result &= get_bit(lookup_table, input[i]);
    }

    return result;
}

extern int fused_kernel(void);
int (*kernels[1])(void) = {fused_kernel};
int main(void) { 
    // Kernel
    return fused_kernel();
    // return kernels[DPU_INPUT_ARGUMENTS.kernel](); 
}

int fused_kernel() {
    unsigned int tasklet_id = me();
    if (tasklet_id == 0) { 
        mem_reset(); // Reset the heap
#ifdef CYCLES
        perfcounter_config(COUNT_CYCLES, true); // Initialize once the cycle counter
#elif INSTRUCTIONS
        perfcounter_config(COUNT_INSTRUCTIONS, true); // Initialize once the instruction counter
#endif
    }

    // Barrier
    barrier_wait(&reset_barrier);
#if defined(CYCLES) || defined(INSTRUCTIONS)
    dpu_results_t *result = &DPU_RESULTS[tasklet_id];

    perfcounter_count count;
    result->count = 0;

    counter_start(&count); // START TIMER
#endif

    // Load model + input
    dpu_model_params_t p = DPU_INPUT_ARGUMENTS.model_params;
    u32 block_size2 = p.block_size * p.num_bits;

    components_t size_bytes = DPU_INPUT_ARGUMENTS.size_bytes;

    u32 num_inputs = DPU_INPUT_ARGUMENTS.num_inputs; // Number of inputs per DPU

    components_t addresses;
    addresses.model = (u32) DPU_MRAM_HEAP_POINTER;
    addresses.thresholds = (u32) (addresses.model + size_bytes.model);
    addresses.order = (u32) (addresses.thresholds + size_bytes.thresholds);
    addresses.hash_params = (u32) (addresses.order + size_bytes.order);
    addresses.inputs = (u32) (addresses.hash_params + size_bytes.hash_params);
    addresses.outputs = (u32) (addresses.inputs + size_bytes.inputs);

#if PRINT == 2
    if (tasklet_id == 0) {      
        printf("\tNum Inputs: %u\n", num_inputs);

        printf("Address (Size)\n");
        printf("\tmodel: %u (%u B)\n", addresses.model, size_bytes.model);
        printf("\tthresholds: %u (%u B)\n", addresses.thresholds, size_bytes.thresholds);
        printf("\torder: %u (%u B)\n", addresses.order, size_bytes.order);
        printf("\thash params: %u (%u B)\n", addresses.hash_params, size_bytes.hash_params);
        printf("\tinputs: %u (%u B)\n", addresses.inputs, size_bytes.inputs);
        printf("\toutputs: %u (%u B)\n", addresses.outputs, size_bytes.outputs);

        printf("Model params:\n");
        printf("\t%u %u %u %u %u %u\n", p.block_size, p.num_bits, p.num_filters, p.filter_inputs, p.filter_entries, p.filter_hashes);

        printf("DPU WRAM Buffer Sizes:\n");
        printf("\tShared:\n");
        printf("\t\torder: %u B\n", p.block_size * sizeof(u16));
        printf("\t\thash params: %u B\n", p.filter_hashes * p.filter_inputs * sizeof(u16));
        printf("\t\tfilters: %u B\n", p.num_filters * (p.filter_entries >> 3) * sizeof(u8)); // PACKED REPRESENTATION!
        
        printf("\tPrivate:\n");
        printf("\t\tbuffer1: %u B\n", block_size2 * sizeof(u8));
        printf("\t\tbuffer2: %u B\n", block_size2 * sizeof(u8));
    }
#endif 

#ifdef EXT_PROFILE
    profiling_start(&p_init);
#endif
    // Put model in WRAM
    if (tasklet_id == 0) {
        // 0. Encoding
        thresholds = wram_alloc_u8(block_size2);
        // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!FAKE THRESHOLDS FOR TESTING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        u8* thresholds_chunk = thresholds;
        u8 thresh_per_skew = 255/(p.num_bits+1);
        for(u32 i = 0; i < p.block_size; ++i) {
            for(u32 j = 0; j < p.num_bits; ++j) {
                thresholds_chunk[j] = (j + 1) * thresh_per_skew;
            }
            thresholds_chunk += p.num_bits;
        }

        // 1. Order 
        order = wram_alloc_u16(block_size2);
        mram_read_u16(addresses.order, order, block_size2);

        // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!FAKE ORDER FOR TESTING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        for(u32 i = 0; i < block_size2; ++i) {
            order[i] = i; 
        }

        // 2. Hash params of shape (filter_hashes, filter_inputs)
        mat_u16_init(&hash_params, p.filter_hashes, p.filter_inputs);
        mram_read_u16(addresses.hash_params, hash_params.data, p.filter_hashes * p.filter_inputs);

        // 3. Filters of shape (num_classes, num_filters, filter_entries >> 3) PACKED REPRESENTATION!
        mat_u8_init(&filters, p.num_filters, (p.filter_entries >> 3)); // PACKED REPRESENTATION!
        mram_read_u8(addresses.model, filters.data, p.num_filters * (p.filter_entries >> 3));
        // tensor_u8_init(&filters, p.num_classes, p.num_filters, p.filter_entries);;
        // mram_read_u8(addresses.model, filters.data, p.num_classes * p.num_filters * p.filter_entries);
    }

    /*
             threshs     order    hash_params  filters
                |         |          |           |
                V         V          V           V
       input   -> encoded -> reorder -> hash    -> filter reduction
       buffer2 -> buffer1 -> buffer2 -> buffer1 -> buffer2
    */

    u8* pbuffer1 = wram_alloc_u8(block_size2);
    u8* pbuffer2 = wram_alloc_u8(block_size2);

    u8* input = pbuffer2;

    u8* encoded = pbuffer1;
    u8* reordered = pbuffer2;

    // Reuse the input buffer (400 B) to store the hashes (56B for MNIST-Small, 24B for MNIST-Big)
    mat_u16 hashes = {
        .stride = p.filter_hashes,
        .data = (u16*) (void*) pbuffer1 // Reuse the input buffer
    };
    u8* filter_reductions = pbuffer2; // Reuse the reordered buffer

#ifdef EXT_PROFILE
    profiling_stop(&p_init);
#endif

    barrier_wait(&initialization_barrier);

    // Obvious parallelization on the inputs
    for(u32 sample_it = tasklet_id; sample_it < num_inputs; sample_it += NR_TASKLETS) {
        // 0. Encoding
#ifdef EXT_PROFILE
        profiling_start(&p_encode);
#endif
        u32 input_addr = addresses.inputs + sample_it * p.block_size;
        mram_read_u8(input_addr, input, p.block_size);
        encode_buffer(
            input, 
            encoded, 
            p.num_bits, 
            thresholds, 
            p.block_size
        );
#ifdef EXT_PROFILE
        profiling_stop(&p_encode);
#endif

        // 1. Reorder
#ifdef EXT_PROFILE
        profiling_start(&p_reorder);
#endif
        reorder(encoded, reordered, order, block_size2);
#ifdef EXT_PROFILE
        profiling_stop(&p_reorder);
#endif

        // 2. Hash

#ifdef EXT_PROFILE
        profiling_start(&p_hash);
#endif
        u16* hash_ptr = hashes.data;
        u8* input_chunk = reordered;
        for(u32 filter_it = 0; filter_it < p.num_filters; ++filter_it) {
            /* Hashing is done along params' rows 
                output[0] = h3_hash(input, params_row_0)
                output[1] = h3_hash(input, params_row_1)
                ... */
            u16* hash_param_row = hash_params.data;
            for(u32 hash_it = 0; hash_it < p.filter_hashes; ++hash_it) {
                h3_hash(
                    input_chunk, 
                    hash_ptr,
                    hash_param_row,
                    p.filter_inputs
                );
                hash_ptr += 1;
                hash_param_row += hash_params.stride;
            }
            input_chunk += p.filter_inputs;
            hash_ptr += 1;
        }

#ifdef EXT_PROFILE
        profiling_stop(&p_hash);
#endif  

// 3. Filter reduction

#ifdef EXT_PROFILE
        profiling_start(&p_reduction);
#endif

        hash_ptr = hashes.data;
        u8* filter_ptr = filters.data;
        for(u32 filter_it = 0; filter_it < p.num_filters; ++filter_it) {
            filter_reductions[filter_it] = and_reduce(
                hash_ptr, 
                filter_ptr, 
                p.filter_hashes
            );
            hash_ptr += hashes.stride;
            filter_ptr += filters.stride;
        }

        mram_write_u8(
            filter_reductions,
            addresses.outputs + sample_it /* * sizeof(u8)*/,
            p.num_filters
        );
#ifdef EXT_PROFILE 
        profiling_stop(&p_reduction);
#endif
    }

#if defined(CYCLES) || defined(INSTRUCTIONS)
    result->count = counter_stop(&count); // STOP TIMER
#endif
	
    return 0;
}
