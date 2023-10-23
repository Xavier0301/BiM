#ifndef EXTERNAL_H
#define EXTERNAL_H

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include "types.h"

#include "model.h"
#include "data_manager.h"

/* MODEL */

extern model_t global_model;

void create_model(size_t input_size, size_t bits_per_input, size_t num_classes, size_t filter_inputs, size_t filter_entries, size_t filter_hashes);

void set_hashes(u16* hash_values, size_t size);

void set_ordering(u16* ordering, size_t size);

void fill_model(u16* data, size_t size);

size_t predict(u8* input);

/* File I/O */

void test_write_read();

#endif // EXTERNAL_H
