#ifndef DISPATCHER_H
#define DISPATCHER_H

#include "../cbthowen/types.h"
#include "../cbthowen/model.h"

#define MRAM_BYTES (1 << 26) // 64 MB
#define MRAM_UNTOUCHABLE_BYTES (1 << 23) // 8 MB: measure of miscellaneous data (log, etc.)
#define MRAM_EFFECTIVE_BYTES (MRAM_BYTES - MRAM_UNTOUCHABLE_BYTES)

#define WRAM_BYTES (1 << 16) // 64 KB
#define WRAM_UNTOUCHABLE_BYTES (1 << 14) // 8 KB: measure of intermediate results
// #define WRAM_UNTOUCHABLE_BYTES (1 << 15) // 32 KB: to profile
#define WRAM_EFFECTIVE_BYTES (WRAM_BYTES - WRAM_UNTOUCHABLE_BYTES)

#define RECOMMENDED_TASKLETS (11) // recommended nr of tasklets per DPU

u32 dpu_search_min_dpus(model_params_t*p , u32* num_bits, u32* num_blocks, u32* num_filters);
u32 dpu_wram_max_filters(model_params_t* p, u32 bits_per_dpu, u32 blocks_per_dpu, int print);

u32 dpu_mram_max_inputs(model_params_t* p, u32 filters_per_dpu, u32 bytes_per_filter, u32 bits_per_dpu, u32 blocks_per_dpu);
int fits_in_wram(model_params_t* p, u32 bits_per_dpu, u32 blocks_per_dpu, u32 filters_per_dpu, int print);
u32 dpu_count_per_class(model_params_t* p, u32 filters_per_dpu);

#endif // DISPATCHER_H
