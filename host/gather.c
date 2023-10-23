// #include "gather.h"

// /* Callback function that returns the block information for a given DPU and
//  * block index. */
// bool get_order_block(
//     struct sg_block_info *out, 
//     uint32_t dpu_index, uint32_t block_index, 
//     void *args
// ) {
//     /* Unpack the arguments */
//     gather_xfer_ctx* xfer_ctx = (gather_xfer_ctx*) args;

//     if (block_index >= xfer_ctx->content_list.num_blocks) {
//         return false;
//     }

//     /* Set the output block */
//     out->length = xfer_ctx->model.p.block_size;
//     out->addr = &(model.input_order[block_index * xfer_ctx->model.p.block_size]);

//     return true;
// }

// bool get_filter_block(
//     struct sg_block_info *out, 
//     uint32_t dpu_index, uint32_t block_index, 
//     void *args
// ) {
//     /* Unpack the arguments */
//     gather_xfer_ctx* xfer_ctx = (gather_xfer_ctx*) args;

//     if (block_index >= xfer_ctx->content_list.num_blocks) {
//         return false;
//     }

//     /* Set the output block */
//     out->length = xfer_ctx->model.p.block_size;
//     out->addr = &(model.input_filter[block_index * xfer_ctx->model.p.block_size]);

//     return true;
// }

// bool get_input_block(
//     struct sg_block_info *out, 
//     uint32_t dpu_index, uint32_t block_index, 
//     void *args
// ) {

// }
