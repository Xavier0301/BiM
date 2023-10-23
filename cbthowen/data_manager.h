#pragma once

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include "types.h"

#include "packed_model.h"
#include "model.h"
#include "helper.h"

void read_model(const char* filename, model_t* model);
void read_pmodel(const char* filename, pmodel_t* model);

void read_dataset(const char* filename, mat_u8 dataset, size_t* num_samples, size_t* sample_size);
void read_dataset_partial(const char* filename, mat_u8 dataset, size_t num_samples_to_fetch, size_t* num_samples_total, size_t* sample_size);

#define DECLARE_READ_MATRIX(type) \
    void read_matrix_##type(FILE* f, mat_##type matrix, size_t size);
DECLARE_READ_MATRIX(u8)
DECLARE_READ_MATRIX(u16)

#define DECLARE_READ_TENSOR(type) \
    void read_tensor_##type(FILE* f, tensor_##type tensor, size_t size);
DECLARE_READ_TENSOR(u8)
DECLARE_READ_TENSOR(u16)

void write_model(const char* filename, model_t* model);
void write_pmodel(const char* filename, pmodel_t* model);

void write_dataset(const char* filename, mat_u8 dataset, size_t num_samples, size_t sample_size);

#define DECLARE_WRITE_MATRIX(type) \
    void write_matrix_##type(FILE* f, mat_##type matrix, size_t size);
DECLARE_WRITE_MATRIX(u8)
DECLARE_WRITE_MATRIX(u16)

#define DECLARE_WRITE_TENSOR(type) \
    void write_tensor_##type(FILE* f, tensor_##type tensor, size_t size);
DECLARE_WRITE_TENSOR(u8)
DECLARE_WRITE_TENSOR(u16)
