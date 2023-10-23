/**
* app.c
* Host Application Source File
*
*/
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <dpu.h>
#include <dpu_log.h>
#include <unistd.h>
#include <getopt.h>
#include <assert.h>

#include "dispatcher.h"

#include "../support/common.h"
#include "../support/timer.h"
#include "../support/params.h"

#include "../cbthowen/model.h"
#include "../cbthowen/data_manager.h"
#include "../cbthowen/data_loader.h"
#include "../cbthowen/batch.h"
#include "../cbthowen/tensor.h"

#ifndef NR_TASKLETS
#define NR_TASKLETS 1
#endif

#ifndef NR_DPUS
#define NR_DPUS 1
#endif

// Define the DPU Binary path as DPU_BINARY here
#ifndef DPU_BINARY
#define DPU_BINARY "./bin/dpu_code"
#endif

// Define the WNN Model path as MODEL_PATH here
#ifndef MODEL_PATH
#define MODEL_PATH "./model.dat"
#endif

#ifndef PMODEL_PATH
// #define PMODEL_PATH "./pmodel.dat"
#define PMODEL_PATH ""
#endif

#ifndef DSET_PATH
#define DSET_PATH "../data/binarized8m.dat"
#endif

#define NUM_SAMPLES(num_dpus, num_samples, dpu_idx) (num_samples / num_dpus + (num_samples % num_dpus > dpu_idx ? 1 : 0))

#define RETRIEVE_RESULTS(field) \
    do { \
        dpu_it = 0; \
        DPU_FOREACH(dpu_set, dpu, dpu_it) { \
            results[dpu_it].field = 0; \
            for (unsigned int each_tasklet = 0; each_tasklet < NR_TASKLETS; each_tasklet++) { \
                if (results_retrieve[dpu_it][each_tasklet].field > results[dpu_it].field) \
                    results[dpu_it].field = results_retrieve[dpu_it][each_tasklet].field; \
            } \
        } \
        u64 max_count_##field = 0; \
        u64 min_count_##field = 0xFFFFFFFFFFFFFFFF; \
        dpu_it = 0; \
        DPU_FOREACH(dpu_set, dpu) { \
            if(results[dpu_it].field > max_count_##field) \
                max_count_##field = results[dpu_it].field; \
            if(results[dpu_it].field < min_count_##field) \
                min_count_##field = results[dpu_it].field; \
            dpu_it++; \
        } \
        cc_##field += (double) max_count_##field; \
        cc_##field /= (double) NR_TASKLETS; \
    } while(0)

// Pointer declarations
static mat_u8 dataset; // (#samples, 784)
static u8* labels; // (#samples)
static mat_u8 predictions; // (#models, #samples)
static u8* predictions_host; // (#samples)
static pmodel_t model; // WNN model

void print_values_for_manual_checking() {
#if PRINT == 3
    // printf("Model:\n");
    // for(size_t class_it = 1; class_it < 2; class_it++) {
    //     printf("Discriminator %lu:\n", class_it);
    //     for(size_t filter_it = 50; filter_it < 55; filter_it++) {
    //         printf("Filter %lu:\n", filter_it);
    //         for(size_t entry_it = 0; entry_it < model.filter_entries; entry_it++) {
    //             printf("%u ", *TENSOR3D(model.filters, class_it, filter_it, entry_it));
    //         }
    //         printf("\n");
    //     }
    //     printf("\n");
    // }

    uint32_t sample_idx = 0;

    // printf("Input:\n");
    // for(size_t sample_it = sample_idx; sample_it < sample_idx; sample_it++) {
    //     for(size_t input_it = 0; input_it < model.num_inputs_total; input_it++) {
    //         printf("%u ", *MATRIX(binarized_infimnist, sample_it, input_it));
    //     }
    //     printf("\n");
    // }

    printf("Order:\n");
    for (size_t order_it = 0; order_it < model.num_inputs_total; order_it++) {
        printf("%u ", model.input_order[order_it]);
    }
    printf("\n");

    printf("Reordered:\n");
    unsigned char* reordered = malloc(model.num_inputs_total * sizeof(char));
    reorder_array(reordered, MATRIX_AXIS1(binarized_infimnist, sample_idx), model.input_order, model.num_inputs_total);
    for (size_t order_it = 0; order_it < model.num_inputs_total; order_it++) {
        printf("%u ", reordered[order_it]);
    }
    printf("\n");

    printf("Hash params:\n\t");
    for(size_t hash_it = 0; hash_it < model.filter_hashes; hash_it++) {
        for(size_t input_it = 0; input_it < model.filter_inputs; input_it++) {
            printf("%u ", model.hash_parameters.data[hash_it * model.filter_inputs + input_it]);
        }
        printf("\n\t");
    }
    printf("\n");

    printf("Hashes:\n\t");
    u16_matrix_t hashes;
    matrix_u16_init(&hashes, model.num_filters, model.filter_hashes);
    perform_hashing(hashes, &model, reordered);
    for(size_t filter_it = 0; filter_it < model.num_filters; filter_it++) {
        for(size_t hash_it = 0; hash_it < model.filter_hashes; hash_it++) {
            printf("%u ", *MATRIX(hashes, filter_it, hash_it));
        }
        printf("\n\t");
    }

    printf("\n");
#endif
}

// void transfer_data_to_dpus(struct dpu_set_t dpu_set, dpu_content_list_t content_list) {
//     DPU_ASSERT(dpu_push_sg_xfer(struct dpu_set_t set,
//                              dpu_xfer_t xfer,
//                              const char *symbol_name,
//                              uint32_t symbol_offset,
//                              size_t length,
//                              get_block_t *get_block_info,
//                              dpu_sg_xfer_flags_t flags))

//     // Order
//     DPU_ASSERT(dpu_push_sg_xfer(
//         dpu_set, // set
//         DPU_XFER_TO_DPU, // xfer type
//         DPU_MRAM_HEAP_POINTER_NAME, // symbol_name
//         0, // offset from symbol
//         model.p.block_size, // length
//         NULL, // get_block_info
//         DPU_SG_XFER_DEFAULT // xfer flag (can also be DPU_SG_XFER_ASYNC)
//     ));
// }

// void transfer_data_to_dpus(struct dpu_set_t dpu_set,
//     dpu_params_t* input_params, 
//     unsigned int dpu_model_transfer_size_bytes,
//     unsigned int dpu_order_transfer_size_bytes,
//     unsigned int dpu_hash_params_transfer_size_bytes,
//     unsigned int dpu_input_transfer_size_bytes) {

//     unsigned int each_dpu = 0;
//     struct dpu_set_t dpu;

//     broadcast_buffer(dpu_set, 0, dpu_model_transfer_size_bytes, model.filters.data, "model");
//     broadcast_buffer(dpu_set, dpu_model_transfer_size_bytes, dpu_order_transfer_size_bytes, model.input_order, "order");
//     broadcast_buffer(dpu_set, dpu_model_transfer_size_bytes + dpu_order_transfer_size_bytes, dpu_hash_params_transfer_size_bytes, model.hash_parameters.data, "hash params");

//     const unsigned int input_offset = dpu_model_transfer_size_bytes + dpu_order_transfer_size_bytes + dpu_hash_params_transfer_size_bytes;

// // #if PRINT
//     printf("Parallel input push (offset %u size %u)\n", input_offset, dpu_input_transfer_size_bytes);
// // #endif

//     unsigned int sample_it = 0;
//     DPU_FOREACH(dpu_set, dpu, each_dpu) {
//         DPU_ASSERT(dpu_prepare_xfer(dpu, MATRIX_AXIS1(binarized_infimnist, sample_it)));
//         sample_it += input_params[each_dpu].nr_inputs;
//     }
//     DPU_ASSERT(
//         dpu_push_xfer(dpu_set, 
//             DPU_XFER_TO_DPU, 
//             DPU_MRAM_HEAP_POINTER_NAME, 
//             input_offset,
//             dpu_input_transfer_size_bytes, 
//             DPU_XFER_DEFAULT)
//     );
// }

// void retrieve_data_from_dpus(struct dpu_set_t dpu_set, 
//     dpu_params_t* input_params, 
//     unsigned int dpu_model_transfer_size_bytes,
//     unsigned int dpu_order_transfer_size_bytes,
//     unsigned int dpu_hash_params_transfer_size_bytes,
//     unsigned int dpu_input_transfer_size_bytes,
//     unsigned int dpu_output_transfer_size_bytes) {

//     unsigned int each_dpu = 0;
//     struct dpu_set_t dpu;

//     printf("Prediction pull \n");

//     const unsigned int pred_offset = dpu_model_transfer_size_bytes + dpu_order_transfer_size_bytes
//         + dpu_hash_params_transfer_size_bytes + dpu_input_transfer_size_bytes;

//     unsigned int pred_it = 0;
//     DPU_FOREACH(dpu_set, dpu, each_dpu) {
//         DPU_ASSERT(dpu_prepare_xfer(dpu, &predictions[pred_it]));
//         pred_it += input_params[each_dpu].nr_inputs;
//     }
//     DPU_ASSERT(
//         dpu_push_xfer(dpu_set, 
//             DPU_XFER_FROM_DPU, 
//             DPU_MRAM_HEAP_POINTER_NAME, 
//             pred_offset, 
//             dpu_output_transfer_size_bytes, 
//             DPU_XFER_DEFAULT)
//     );
// }

// Main of the Host Application
int main(int argc, char **argv) {

    // Input parameters
    struct Params p = input_params(argc, argv);

    // Timer declaration
    Timer timer;
#if defined(CYCLES) || defined(INSTRUCTIONS)
    double cc_count = 0;
#endif

    printf("Loading model\n");
    if(PMODEL_PATH[0] == '\0') {
        // model_init_params_t m_p = {
        //     .num_classes = 10, 
        //     .num_inputs = MNIST_IM_SIZE, .bits_per_input = 6, 
        //     .dim1_block_size = 392, .dim2_block_size = 1,
        //     .filter_hashes = 4, .filter_inputs = 49, .filter_entries = 8192};
        
        // model_init_params_t m_p = {
        //     .num_classes = 10, 
        //     .num_inputs = MNIST_IM_SIZE, .bits_per_input = 3, 
        //     .dim1_block_size = 392, .dim2_block_size = 1,
        //     .filter_hashes = 2, .filter_inputs = 28, .filter_entries = 2048
        // };

        model_init_params_t m_p = {
            .num_classes = 10, 
            .num_inputs = MNIST_IM_SIZE, .bits_per_input = 2, 
            .dim1_block_size = 392, .dim2_block_size = 1,
            .filter_hashes = 2, .filter_inputs = 28, .filter_entries = 1024
        };

        model_t m;
        model_init(&m, &m_p);

        pmodel_init_buffers(&model);
        model_pack(&m, &model);
    } else {
        read_pmodel(PMODEL_PATH, &model);
    }

    printf("Loading dataset\n");


    printf("Loading dataset\n");
    const u32 num_samples = p.num_samples;

    matrix_u8_init(&dataset, num_samples, MNIST_IM_SIZE);
    labels = calloc(num_samples, sizeof(*labels));

    load_infimnist(dataset, labels, num_samples);


#if PRINT
    // print_binarized_image_raw(binarized_infimnist, NULL, 0, 2);
#endif

    u32 bits_per_dpu = 0, block_per_dpu = 0, filters_per_dpu = 0;
    u32 dpus_per_model = dpu_search_min_dpus(&model.p, &bits_per_dpu, &block_per_dpu, &filters_per_dpu);

    u32 max_inputs_per_dpu = dpu_mram_max_inputs(
        &model.p, 
        filters_per_dpu, PMODEL_FILTER_SIZE(&model), bits_per_dpu, block_per_dpu
    );
    u32 samples_per_dpu = min(max_inputs_per_dpu, num_samples);

    printf("Load DPU arguments\n");
    u32 kernel = 0;
    dpu_model_params_t model_params = (dpu_model_params_t) {
        .block_size = model.p.dim1_block_size * block_per_dpu,
        .num_bits = bits_per_dpu,

        .num_filters = filters_per_dpu,
        .filter_inputs = model.p.filter_inputs,
        .filter_entries = model.p.filter_entries,
        .filter_hashes = model.p.filter_hashes,
    };
    components_t size_bytes = (components_t) {
        .model = filters_per_dpu * PMODEL_FILTER_SIZE(&model) * sizeof(u8),
        .order = model.p.dim1_block_size * block_per_dpu * bits_per_dpu * sizeof(u16),
        .thresholds = model.p.dim1_block_size * block_per_dpu * bits_per_dpu * sizeof(u8),
        .hash_params = model.p.filter_hashes * model.p.filter_inputs * sizeof(u16),
        .inputs = samples_per_dpu * model.p.dim1_block_size * block_per_dpu * bits_per_dpu * sizeof(u8),
        .outputs = samples_per_dpu * filters_per_dpu * sizeof(u8),
    };

    printf("All DPUs: %d samples\n", samples_per_dpu);
    PRINT_MODEL_PARAMS(model_params);
    PRINT_COMPONENTS(size_bytes);

    dpu_params_t input_arguments = (dpu_params_t) {
        .size_bytes = size_bytes,
        .model_params = model_params,
        .num_inputs = samples_per_dpu,
        .kernel = kernel,
    };

    // Allocate DPUs depending on model size
    // u32 num_models = NR_DPUS / dpus_per_model;
    u32 num_models = p.n_models;
    u32 num_dpus_total;
    if(num_models == 0) {
        printf("WARNING: Not enough DPUs to fit model. Running in 1 DPU test mode.\n");
        num_dpus_total = 1;
        num_models = 1;
    } else {
        num_dpus_total = num_models * dpus_per_model;
    }

    printf("DISPATCHING\n");
    printf("\tFilters per DPU: %u\n", filters_per_dpu);
    printf("\tDPUs per model: %u\n", dpus_per_model);
    printf("\tSamples per DPU: %u\n", samples_per_dpu);
    printf("\tModels: %u\n", num_models);
    printf("\tTotal DPUs: %u\n", num_dpus_total);

    printf("Prediction buffers allocation in host main memory\n");
    matrix_u8_init(&predictions, num_models, samples_per_dpu);
    predictions_host = (u8*) calloc(samples_per_dpu, sizeof(*predictions_host));

    struct dpu_set_t dpu_set, dpu;
    u32 effective_num_dpus_total;
    DPU_ASSERT(dpu_alloc(num_dpus_total, "sgXferEnable=true, regionMode=safe, enableProfiling=sections", &dpu_set));
    DPU_ASSERT(dpu_get_nr_dpus(dpu_set, &effective_num_dpus_total)); // Number of DPUs in the DPU set
    if(effective_num_dpus_total != num_dpus_total) {
        printf("ERROR: Allocated %d DPU(s) (Requested %d)\t", effective_num_dpus_total, num_dpus_total);
        return 0;
    } else {
        printf("Allocated %d DPU(s), Each Running %d Tasklets\n", num_dpus_total, NR_TASKLETS);
    }

    // Load binary
    DPU_ASSERT(dpu_load(dpu_set, DPU_BINARY, NULL));

    start(&timer, 0, 0); // Start timer (CPU-DPU transfers)

    // Copy arguments to DPUs
    u32 dpu_it = 0;
    DPU_FOREACH(dpu_set, dpu, dpu_it) {
        DPU_ASSERT(dpu_prepare_xfer(dpu, &input_arguments));
    }
    DPU_ASSERT(dpu_push_xfer(dpu_set, DPU_XFER_TO_DPU, "DPU_INPUT_ARGUMENTS", 0, sizeof(input_arguments), DPU_XFER_DEFAULT));

//         transfer_data_to_dpus(
//             dpu_set, 
//             input_arguments, 
//             model_bytes, 
//             order_bytes,
//             hash_params_bytes,
//             dpu_input_bytes);

    stop(&timer, 0); // Stop timer (CPU-DPU transfers)

    // Run on DPUs
    printf("Run on DPUs\n");
    start(&timer, 1, 0); // Start timer (DPU kernel)
    DPU_ASSERT(dpu_launch(dpu_set, DPU_SYNCHRONOUS));
    stop(&timer, 1); // Stop timer (DPU kernel)

#if PRINT == 2
    {
        u32 each_dpu = 0;
        printf("Display DPU Logs\n");
        DPU_FOREACH (dpu_set, dpu) {
            printf("DPU#%d:\n", each_dpu);
            DPU_ASSERT(dpulog_read_for_dpu(dpu.dpu, stdout));
            each_dpu++;
        }
    }
#endif

    // Retrieve results
    printf("Retrieve results\n");
    start(&timer, 2, 0); // Start timer (DPU-CPU transfers)
//         retrieve_data_from_dpus(
//             dpu_set, 
//             input_arguments, 
//             model_bytes, 
//             order_bytes,
//             hash_params_bytes,
//             dpu_input_bytes, 
//             dpu_prediction_bytes);
    stop(&timer, 2); // Stop timer (DPU-CPU transfers)

    // Benchmark the host
    printf("Run on host\n");
    start(&timer, 3, 0);
    for(u32 model_it = 0; model_it < num_models; ++model_it) {
        for(u32 sample_it = 0; sample_it < samples_per_dpu; ++sample_it) {
            predictions_host[sample_it] = (u8) pmodel_predict(&model, MATRIX_AXIS1(dataset, sample_it));
        }
    }
    stop(&timer, 3);


#ifdef CSV
    printf("results_and_timings(cycles), %d, %d, %d, %d", num_dpus_total, num_models, NR_TASKLETS, max_inputs_per_dpu);
#else
    printf("results_and_timings(cycles), %d, %d, %d, %d\n", num_dpus_total, num_models, NR_TASKLETS, max_inputs_per_dpu);
#endif

#ifdef CSV
    printf(", ");
    print2(&timer, 0, p.n_reps);
    printf(", ");
    print2(&timer, 1, p.n_reps);
    printf(", ");
    print2(&timer, 2, p.n_reps);
    printf(", ");
    print2(&timer, 3, p.n_reps);
    printf(", ");
    print2(&timer, 4, p.n_reps);
#else 
    printf("CPU-DPU transfers ");
    print(&timer, 0, p.n_reps);
    printf("\nDPU kernel ");
    print(&timer, 1, p.n_reps);
    printf("\nDPU-CPU transfers ");
    print(&timer, 2, p.n_reps);
    printf("\nCPU prediction ");
    print(&timer, 3, p.n_reps);
#endif 
printf("\n");

#if defined(CYCLES) || defined(INSTRUCTIONS)
    dpu_results_t results[num_dpus_total];
    // Parallel transfers
    dpu_results_t* results_retrieve[num_dpus_total];

    dpu_it = 0;
    DPU_FOREACH(dpu_set, dpu, dpu_it) {
        results_retrieve[dpu_it] = (dpu_results_t*)malloc(NR_TASKLETS * sizeof(dpu_results_t));
        DPU_ASSERT(dpu_prepare_xfer(dpu, results_retrieve[dpu_it]));
    }
    DPU_ASSERT(dpu_push_xfer(dpu_set, DPU_XFER_FROM_DPU, "DPU_RESULTS", 0, NR_TASKLETS * sizeof(dpu_results_t), DPU_XFER_DEFAULT));

    RETRIEVE_RESULTS(count);

    dpu_it = 0;
    DPU_FOREACH(dpu_set, dpu, dpu_it) { 
        free(results_retrieve[dpu_it]);
    }
#endif

#ifdef CYCLES
// #ifdef CSV
//     printf("results_and_timings(cycles), %d, %d, %d, %g", nr_of_dpus, NR_TASKLETS, num_samples, cc_count);
// #else
    // 500 MHz
    double freq = 500000000;
    double time = cc_count / freq;
    double time_ms = time * 1000;

    printf("DPU cycles = %.0f => %.2f ms (@500 Mhz)\n", cc_count, time_ms);
#endif
// #elif INSTRUCTIONS
// #ifdef CSV
//     printf("results_and_timings(instructions), %d, %d, %d, %.0f", nr_of_dpus, NR_TASKLETS, num_samples, cc_count);
// #else 

// #endif
// #endif
	
// #ifdef CSV
//     printf(", ");
//     print2(&timer, 2, p.n_reps);
//     printf(", ");
//     print2(&timer, 3, p.n_reps);
//     printf(", ");
//     print2(&timer, 4, p.n_reps);
//     printf(", ");
//     print2(&timer, 5, p.n_reps);
// #else 
//     printf("CPU-DPU transfers ");
//     print(&timer, 2, p.n_reps);
//     printf("\nDPU kernel ");
//     print(&timer, 3, p.n_reps);
//     printf("\nDPU-CPU transfers ");
//     print(&timer, 4, p.n_reps);
//     printf("\nCPU prediction ");
//     print(&timer, 5, p.n_reps);
// #endif 

//     puts("");
// #if CHECK_RES

//     batch_prediction(predictions_host, &model, binarized_infimnist, num_samples);
//     // Check output
//     bool status = true;
//     for (size_t i = 0; i < num_samples; i++) {
//         if(predictions_host[i] != predictions[i]) {
//             status = false;
//             if(num_samples < 50)
//                 printf("Sample %ld> %lu -- %lu_ \n", i, predictions[i], predictions_host[i]);
//         }
//         // printf("Sample %d> %lu -- %lu_ \n", i, predictions[i], predictions_host[i]);
//     }
//     if (status) {
//         printf("\n[" ANSI_COLOR_GREEN "OK" ANSI_COLOR_RESET "] Outputs are equal\n");
//     } else {
//         printf("\n[" ANSI_COLOR_RED "ERROR" ANSI_COLOR_RESET "] Outputs differ!\n");
//     }
// #endif

//     // Deallocation
//     // free(X);
//     // free(Y);
//     // free(Y_host);
//     DPU_ASSERT(dpu_free(dpu_set)); // Deallocate DPUs
	
//     return 0;
}
