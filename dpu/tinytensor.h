#ifndef DPU_TINYMAT_H
#define DPU_TINYMAT_H

/* Lightweight tensor+matrix class for DPUs 
    1. TODO: Calculate indexes without 32-bit multiplications
        (decompose into shift + 8-bit multiplication)
*/

#include "tinylib.h"

#define TENSOR_TYPE(type) tensor_##type

#define DEFINE_TENSOR_STRUCT(type) \
    typedef struct TENSOR_TYPE(type) { \
        u32 stride1; \
        u32 stride2; \
        type* data; \
    } TENSOR_TYPE(type)

// DEFINE_TENSOR_STRUCT(u8);

#define TENSOR_MAT(tensor, depth) ((tensor).data + (depth) * (tensor).stride1)
#define TENSOR_ROW(tensor, depth, row) (TENSOR_MAT(tensor, depth) + (row) * (tensor).stride2)
#define TENSOR_ELEM(tensor, depth, row, col) (TENSOR_ROW(tensor, depth, row)[col])

#define DEFINE_TENSOR_INIT(type) \
    static inline \
    void tensor_##type##_init(TENSOR_TYPE(type)* tensor, u32 shape1, u32 shape2, u32 shape3) { \
        tensor->stride1 = shape2 * shape3; \
        tensor->stride2 = shape3; \
        tensor->data = wram_alloc_##type(shape1 * shape2 * shape3); \
    }

// DEFINE_TENSOR_INIT(u8);

#define MAT_TYPE(type) mat_##type

#define DEFINE_MATRIX_STRUCT(type) \
    typedef struct MAT_TYPE(type) { \
        u32 stride; \
        type* data; \
    } MAT_TYPE(type)

DEFINE_MATRIX_STRUCT(u16);
DEFINE_MATRIX_STRUCT(u8);

#define MAT_ROW(mat, row) ((mat).data + (row) * (mat).stride)
#define MAT_ELEM(mat, row, col) (MAT_ROW(mat, row)[col])

#define DEFINE_MAT_INIT(type) \
    static inline \
    void mat_##type##_init(MAT_TYPE(type)* mat, u32 rows, u32 cols) { \
        mat->stride = cols; \
        mat->data = wram_alloc_##type(rows * cols); \
    }

DEFINE_MAT_INIT(u16);
DEFINE_MAT_INIT(u8);

#endif // DPU_TINYMAT_H
