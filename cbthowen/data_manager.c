#include "data_manager.h"

#define READ_PTR(ptr, fp) FREAD_CHECK(ptr, sizeof(*ptr), 1, fp)
#define READ_FIELD(structure, name, fp) FREAD_CHECK(&(structure)->name, sizeof((structure)->name), 1, fp)
#define READ_BUFFER(structure, name, num, fp) FREAD_CHECK((structure)->name, sizeof(*(structure)->name), num, fp)

void read_model_params(FILE* f, model_params_t* params) {
    READ_FIELD(params, num_classes, f);
    READ_FIELD(params, num_filters, f);

    READ_FIELD(params, num_inputs, f);
    READ_FIELD(params, bits_per_input, f);
    READ_FIELD(params, pad_zeros, f);
    READ_FIELD(params, num_inputs_encoded, f);

    READ_FIELD(params, dim1_block_size, f);
    READ_FIELD(params, dim2_block_size, f);

    READ_FIELD(params, filter_hashes, f);
    READ_FIELD(params, filter_inputs, f);
    READ_FIELD(params, filter_entries, f);

    READ_FIELD(params, bleach, f);
}

void read_model(const char* filename, model_t* model) {
    FILE* f = fopen(filename, "r");

    read_model_params(f, &model->p);

    model_init_buffers(model);

    READ_BUFFER(model, input_order, model->p.num_inputs_encoded, f);

    read_matrix_u16(f, model->hash_parameters, model->p.filter_hashes * model->p.filter_inputs);
    read_tensor_u16(f, model->filters, model->p.num_classes * model->p.num_filters * model->p.filter_entries);

    fclose(f);
}

void read_pmodel(const char* filename, pmodel_t* model) {
    FILE* f = fopen(filename, "r");

    read_model_params(f, &model->p);

    pmodel_init_buffers(model);

    READ_BUFFER(model, input_order, model->p.num_inputs_encoded, f);

    read_matrix_u16(f, model->hash_parameters, model->p.filter_hashes * model->p.filter_inputs);
    read_tensor_u8(f, model->filters, model->p.num_classes * model->p.num_filters * PMODEL_FILTER_SIZE(model));

    fclose(f);
}

void read_dataset(const char* filename, mat_u8 dataset, size_t* num_samples, size_t* sample_size) {
    FILE* f = fopen(filename, "r");

    READ_PTR(num_samples, f);
    READ_PTR(sample_size, f);

    read_matrix_u8(f, dataset, *num_samples * *sample_size);

    fclose(f);
}

void read_dataset_partial(const char* filename, mat_u8 dataset, size_t num_samples_to_fetch, size_t* num_samples_total, size_t* sample_size) {
    FILE* f = fopen(filename, "r");

    READ_PTR(num_samples_total, f);
    READ_PTR(sample_size, f);

    assert(num_samples_to_fetch <= *num_samples_total);

    read_matrix_u8(f, dataset, num_samples_to_fetch * *sample_size);

    fclose(f);
}

#define DEFINE_READ_MATRIX(type) \
    void read_matrix_##type(FILE* f, mat_##type matrix, size_t size) { \
        READ_FIELD(&matrix, stride, f); \
        READ_BUFFER(&matrix, data, size, f); \
    }

DEFINE_READ_MATRIX(u8)
DEFINE_READ_MATRIX(u16)

#define DEFINE_READ_TENSOR(type) \
    void read_tensor_##type(FILE* f, tensor_##type tensor, size_t size) { \
        READ_FIELD(&tensor, stride1, f); \
        READ_FIELD(&tensor, stride2, f); \
        READ_BUFFER(&tensor, data, size, f); \
    }

DEFINE_READ_TENSOR(u8)
DEFINE_READ_TENSOR(u16)

#define SAVE_VAR(var, fp) FWRITE_CHECK(&var, sizeof(var), 1, fp)
#define SAVE_FIELD(structure, name, fp) FWRITE_CHECK(&(structure)->name, sizeof((structure)->name), 1, fp)
#define SAVE_BUFFER(structure, name, num, fp) FWRITE_CHECK((structure)->name, sizeof(*(structure)->name), num, fp)

void write_model_params(FILE* f, model_params_t* params) {
    SAVE_FIELD(params, num_classes, f);
    SAVE_FIELD(params, num_filters, f);

    SAVE_FIELD(params, num_inputs, f);
    SAVE_FIELD(params, bits_per_input, f);
    SAVE_FIELD(params, pad_zeros, f);
    SAVE_FIELD(params, num_inputs_encoded, f);

    SAVE_FIELD(params, dim1_block_size, f);
    SAVE_FIELD(params, dim2_block_size, f);

    SAVE_FIELD(params, filter_hashes, f);
    SAVE_FIELD(params, filter_inputs, f);
    SAVE_FIELD(params, filter_entries, f);

    SAVE_FIELD(params, bleach, f);
}

void write_model(const char* filename, model_t* model) {
    FILE* f = fopen(filename, "w");

    write_model_params(f, &model->p);

    SAVE_BUFFER(model, input_order, model->p.num_inputs_encoded, f);

    write_matrix_u16(f, model->hash_parameters, model->p.filter_hashes * model->p.filter_inputs);
    write_tensor_u16(f, model->filters, model->p.num_classes * model->p.num_filters * model->p.filter_entries);

    fclose(f);
}

void write_pmodel(const char* filename, pmodel_t* model) {
    FILE* f = fopen(filename, "w");

    write_model_params(f, &model->p);

    SAVE_BUFFER(model, input_order, model->p.num_inputs_encoded, f);

    write_matrix_u16(f, model->hash_parameters, model->p.filter_hashes * model->p.filter_inputs);
    write_tensor_u8(f, model->filters, model->p.num_classes * model->p.num_filters * PMODEL_FILTER_SIZE(model));

    fclose(f);
}

void write_dataset(const char* filename, mat_u8 dataset, size_t num_samples, size_t sample_size) {
    FILE* f = fopen(filename, "w");

    SAVE_VAR(num_samples, f);
    SAVE_VAR(sample_size, f);

    write_matrix_u8(f, dataset, num_samples * sample_size);

    fclose(f);
}

#define DEFINE_WRITE_MATRIX(type) \
    void write_matrix_##type(FILE* f, mat_##type matrix, size_t size) { \
        SAVE_FIELD(&matrix, stride, f); \
        SAVE_BUFFER(&matrix, data, size, f); \
    }
DEFINE_WRITE_MATRIX(u8)
DEFINE_WRITE_MATRIX(u16)

#define DEFINE_WRITE_TENSOR(type) \
    void write_tensor_##type(FILE* f, tensor_##type tensor, size_t size) { \
        SAVE_FIELD(&tensor, stride1, f); \
        SAVE_FIELD(&tensor, stride2, f); \
        SAVE_BUFFER(&tensor, data, size, f); \
    }
DEFINE_WRITE_TENSOR(u8)
DEFINE_WRITE_TENSOR(u16)
