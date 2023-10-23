#ifndef _COMMON_H_
#define _COMMON_H_

#include "../cbthowen/types.h"

#define ROUND_UP_TO_MULTIPLE_OF_8(x)    ((((x) + 7) / 8) * 8)
#define ROUND_DOWN_TO_MULTIPLE_OF_8(x)  (((x) / 8) * 8)

typedef struct dpu_model_params_t {
    u32 block_size;
    u32 num_bits;

    u32 num_filters;
    u32 filter_inputs;
    u32 filter_entries;
    u32 filter_hashes;
} dpu_model_params_t;

#define PRINT_MODEL_PARAMS(p) \
    printf("Model params:\n"); \
    printf("\tblock_size: %u\n", p.block_size); \
    printf("\tnum_bits: %u\n", p.num_bits); \
    printf("\tnum_filters: %u\n", p.num_filters); \
    printf("\tfilter_inputs: %u\n", p.filter_inputs); \
    printf("\tfilter_entries: %u\n", p.filter_entries); \
    printf("\tfilter_hashes: %u\n", p.filter_hashes);

typedef struct components_t {
    u32 model;
    u32 order;
    u32 thresholds;
    u32 hash_params;
    u32 inputs;
    u32 outputs;
} components_t;

#define PRINT_COMPONENTS(c) \
    printf("Components:\n"); \
    printf("\tmodel: %u\n", c.model); \
    printf("\torder: %u\n", c.order); \
    printf("\tthresholds: %u\n", c.thresholds); \
    printf("\thash_params: %u\n", c.hash_params); \
    printf("\tinputs: %u\n", c.inputs); \
    printf("\toutputs: %u\n", c.outputs);

typedef struct dpu_params_t {
    components_t size_bytes;

    dpu_model_params_t model_params;
    
    u32 num_inputs;

    enum kernels {
	    kernel1 = 0,
	    nr_kernels = 1,
	} kernel;
} dpu_params_t;
 
typedef struct {
    u64 count;
} dpu_results_t;

typedef struct dpu_prediction_t {
    u64 prediction;
} dpu_prediction_t;

#define ANSI_COLOR_RED     "\x1b[31m"
#define ANSI_COLOR_GREEN   "\x1b[32m"
#define ANSI_COLOR_RESET   "\x1b[0m"

#define min(a, b) ((a) < (b) ? (a) : (b))
#define max(a, b) ((b) < (a) ? (a) : (b))

#define divceil(n, m) (((n)-1) / (m) + 1)
#define roundup(n, m) ((n / m) * m + m)
#define aligned_count(count, size_bytes) (((count * size_bytes) % 8) != 0 ? roundup(count, 8) : count)
#define aligned_size_bytes(count, size_bytes) (aligned_count(count, size_bytes) * size_bytes)

#define NUM_ITERATIONS(num_blocks, num_iterations, block_it) (num_iterations / num_blocks + (num_iterations % num_blocks > block_it ? 1 : 0))

#define TO_KB(bytes) ((bytes) / 1024)
#define TO_MB(bytes) ((bytes) / (1024 * 1024))

#endif
