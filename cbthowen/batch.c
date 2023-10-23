#include "batch.h"

void batch_hashing(tensor_u16 resulting_hashes, model_t* model, mat_u8 input_batch, size_t batch_size) {
    mat_u16 tmp_hashes = { .stride = model->p.filter_hashes, .data=NULL };
    // init_matrix(&tmp_hashes, model->num_filters, model->filter_hashes);
    for(size_t it = 0; it < batch_size; ++it) {
        tmp_hashes.data = TENSOR3D_AXIS1(resulting_hashes, it);
        perform_hashing(tmp_hashes, &model->p, model->hash_parameters, MATRIX_AXIS1(input_batch, it));
    }
}

void batch_prediction(size_t* results, model_t* model, mat_u8 input_batch, size_t batch_size) {
    for(size_t it = 0; it < batch_size; ++it) {
        results[it] = model_predict2(model, MATRIX_AXIS1(input_batch, it));
    }
}
