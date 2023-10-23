#include "tensor.h"

#define INSTANTIATE_TENSOR_INIT(symbol) \
    void tensor_##symbol##_init(TENSOR_TYPE(symbol)* t, size_t shape1, size_t shape2, size_t shape3) { \
        TENSOR_INIT(t, shape1, shape2, shape3, DATA_TYPE(symbol)); \
    }

INSTANTIATE_TENSOR_INIT(u16)

INSTANTIATE_TENSOR_INIT(u8)

#define INSTANTIATE_MATRIX_INIT(symbol) \
    void matrix_##symbol##_init(MAT_TYPE(symbol)* m, size_t rows, size_t cols) { \
        MATRIX_INIT(m, rows, cols, DATA_TYPE(symbol)); \
    }

INSTANTIATE_MATRIX_INIT(u32)

INSTANTIATE_MATRIX_INIT(u16)

INSTANTIATE_MATRIX_INIT(u8)

void mat_u8_mean(f64* mean, mat_u8 dataset, size_t sample_size, size_t num_samples) {
    for(size_t offset_it = 0; offset_it < sample_size; ++offset_it) 
        mean[offset_it] = 0;

    for(size_t sample_it = 0; sample_it < num_samples; ++sample_it) {
        for(size_t offset_it = 0; offset_it < sample_size; ++offset_it) {
            mean[offset_it] += *MATRIX(dataset, sample_it, offset_it);
        }
    }

    for(size_t offset_it = 0; offset_it < sample_size; ++offset_it) 
        mean[offset_it] /= num_samples;
}

void mat_u8_variance(f64* variance, mat_u8 dataset, size_t sample_size, size_t num_samples, f64* mean) {
    for(size_t offset_it = 0; offset_it < sample_size; ++offset_it) 
        variance[offset_it] = 0;

    for(size_t sample_it = 0; sample_it < num_samples; ++sample_it) {
        for(size_t offset_it = 0; offset_it < sample_size; ++offset_it) {
            variance[offset_it] += pow(*MATRIX(dataset, sample_it, offset_it) - mean[offset_it], 2);
        }
    }

    for(size_t offset_it = 0; offset_it < sample_size; ++offset_it) 
        variance[offset_it] /= (num_samples - 1);
}
