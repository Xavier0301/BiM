#include "external.h"

model_t global_model;

/* MODEL */

void create_model(size_t input_size, size_t bits_per_input, size_t num_classes, size_t filter_inputs, size_t filter_entries, size_t filter_hashes) {
    size_t num_inputs = input_size * bits_per_input;

    model_init_params_t params = {
        .num_classes = num_classes,

        .num_inputs = num_inputs,
        .bits_per_input = bits_per_input,

        .dim1_block_size = 1,
        .dim2_block_size = 1,

        .filter_hashes = filter_hashes,
        .filter_inputs = filter_inputs,
        .filter_entries = filter_entries,
    };

    model_init(&global_model, &params);
}

void set_hashes(u16* hash_values, size_t size) {
    for(size_t it = 0; it < size; ++it)
        global_model.hash_parameters.data[it] = hash_values[it];
}

void set_ordering(u16* ordering, size_t size) {
    for(size_t it = 0; it < size; ++it)
        global_model.input_order[it] = ordering[it];
}

void fill_model(u16* data, size_t size) {
    for(size_t it = 0; it < size; ++it) 
        global_model.filters.data[it] = data[it];
}

size_t predict(u8* input) {
    size_t pred = model_predict2(&global_model, input);
    return pred;
}

/* BINARIZATION */

/* File I/O */

void test_write_read() {
    char* model_path = "/Users/xavier/Desktop/Cours/Ici/WNN/Cbthowen/model.dat";
    write_model(model_path, &global_model);
    read_model(model_path, &global_model);
}

void test_read_model() {
    char* model_path = "/Users/xavier/Desktop/Cours/Ici/WNN/Cbthowen/model.dat";
    read_model(model_path, &global_model);
}
