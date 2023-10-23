#ifndef TENSOR_H
#define TENSOR_H

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

#include "math.h"

#include "types.h"

#define DATA_TYPE(symbol) symbol

#define TENSOR_TYPE_(symbol) tensor_##symbol##_
#define TENSOR_TYPE(symbol) tensor_##symbol

#define DEFINE_TENSOR_STRUCT(symbol) \
    typedef struct TENSOR_TYPE_(symbol) { \
        size_t stride1; \
        size_t stride2; \
        DATA_TYPE(symbol)* data; \
    } TENSOR_TYPE(symbol)

DEFINE_TENSOR_STRUCT(u16);
DEFINE_TENSOR_STRUCT(u8);

#define TENSOR3D_AXIS1(t, i) ((t).data + i * (t).stride1)
#define TENSOR3D_AXIS2(t, i, j) (TENSOR3D_AXIS1(t, i) + j * (t).stride2)
#define TENSOR3D(t, i, j, k) (TENSOR3D_AXIS2(t, i, j) + k)

#define TENSOR_INIT(t, shape1, shape2, shape3, type) \
    do { \
        t->stride1 = shape2 * shape3; \
        t->stride2 = shape3; \
        t->data = (type*) calloc(shape1 * shape2 * shape3, sizeof(*t->data)); \
    } while(0)

#define TENSOR_VIEW(type, buffer, shape1, shape2, shape3) \
    (type) { \
        .data = buffer, \
        .stride1 = shape2 * shape3, \
        .stride2 = shape3, \
    }

#define TENSOR_PRINT(t, shape1, shape2, shape3) \
    do { \
        for(size_t i = 0; i < shape1; ++i) { \
            for(size_t j = 0; j < shape2; ++j) { \
                for(size_t k = 0; k < shape3; ++k) \
                    printf("%u ", *TENSOR3D(t, i, j, k)); \
                printf("\n"); \
            } \
            printf("\n"); \
        } \
    } while(0)

#define DEFINE_TENSOR_INIT(symbol) \
    void tensor_##symbol##_init(TENSOR_TYPE(symbol)* t, size_t shape1, size_t shape2, size_t shape3);

DEFINE_TENSOR_INIT(u16);
DEFINE_TENSOR_INIT(u8);

#define MAT_TYPE_(symbol) mat_##symbol##_
#define MAT_TYPE(symbol) mat_##symbol

#define DEFINE_MATRIX_STRUCT(symbol) \
    typedef struct MAT_TYPE_(symbol) { \
        size_t stride; \
        DATA_TYPE(symbol)* data; \
    } MAT_TYPE(symbol)

DEFINE_MATRIX_STRUCT(u32);
DEFINE_MATRIX_STRUCT(u16);
DEFINE_MATRIX_STRUCT(u8);

#define MATRIX_AXIS1(t, i) ((t).data + i * (t).stride)
#define MATRIX(t, i, j) (MATRIX_AXIS1(t, i) + j)

#define MATRIX_INIT(m, rows, cols, type) \
    do { \
        (m)->stride = cols; \
        (m)->data = (type*) calloc(rows * cols, sizeof(*(m)->data)); \
    } while(0)

#define MATRIX_PRINT(m, rows, cols) \
    do { \
        for(size_t i = 0; i < rows; ++i) { \
            for(size_t j = 0; j < cols; ++j) \
                printf("%u ", *MATRIX(*m, i, j)); \
            printf("\n"); \
        } \
    } while(0)

#define DEFINE_MATRIX_INIT(symbol) \
    void matrix_##symbol##_init(MAT_TYPE(symbol)* m, size_t rows, size_t cols)

DEFINE_MATRIX_INIT(u32);
DEFINE_MATRIX_INIT(u16);
DEFINE_MATRIX_INIT(u8);

void mat_u8_mean(f64* mean, mat_u8 dataset, size_t sample_size, size_t num_samples);
void mat_u8_variance(f64* variance, mat_u8 dataset, size_t sample_size, size_t num_samples, f64* mean);

#endif
