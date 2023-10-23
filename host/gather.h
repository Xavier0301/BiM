// #ifndef GATHER_H
// #define GATHER_H

// #include <dpu.h>

// #include "dispatcher.h"

// #include "../cbthowen/types.h"
// #include "../cbthowen/packed_model.h


// typedef struct gather_xfer_ctx {
//     dpu_content_list_t content_list;
//     pmodel_t model;
// } gather_xfer_ctx;

// /* Callback function that returns the block information for a given DPU and
//  * block index. */
// bool get_order_block(
//     struct sg_block_info *out, 
//     uint32_t dpu_index, uint32_t block_index, 
//     void *args
// );

// bool get_filter_block(
//     struct sg_block_info *out, 
//     uint32_t dpu_index, uint32_t block_index, 
//     void *args
// );

// bool get_input_block(
//     struct sg_block_info *out, 
//     uint32_t dpu_index, uint32_t block_index, 
//     void *args
// );

// #endif // GATHER_H
