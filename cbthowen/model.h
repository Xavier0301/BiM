#ifndef MODEL_H
#define MODEL_H

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

#include "types.h"

#include "tensor.h"
#include "distributions.h"

extern u8* encoding_buffer; // of shape (#Inputs * #Bits)
extern u8* reorder_buffer; // of shape if REORDER_FIRST: (#Inputs), else: (#Inputs * #Bits)
extern mat_u16 hashes_buffer; // of shape (#Filters, #Hashes)

typedef struct model_init_params_t_ {
    // General dims
    u32 num_classes;

    // Input
    u32 num_inputs;
    u32 bits_per_input;

    // Reorder
    u32 dim1_block_size;
    u32 dim2_block_size; // 1 if 1d, otherwise > 1

    // Filter
    u32 filter_hashes;
    u32 filter_inputs;
    u32 filter_entries;
} model_init_params_t;

typedef struct model_params_t_ {
    // General dims
    u32 num_classes;
    u32 num_filters;

    // Input
    u32 num_inputs;
    u32 bits_per_input;
    u32 pad_zeros;
    u32 num_inputs_encoded;

    // Reorder
    u32 dim1_block_size;
    u32 dim2_block_size; // 1 if 1d, otherwise > 1

    // Filter
    u32 filter_hashes;
    u32 filter_inputs;
    u32 filter_entries;
    
    // Other
    u32 bleach;
} model_params_t;

typedef struct model_t_ {
    model_params_t p;

    mat_u8 encoding_thresholds; // of shape if STRIDED_ENCODING: (#Bits, #Inputs), else: (#Inputs, #Bits)
    u16* input_order; // of shape if REORDER_FIRST: (#Inputs) else: (#InputsEncoded), with elements in [0; len)
    mat_u16 hash_parameters; // of shape (#Hashes, #InputsEncoded)
    tensor_u16 filters; // of shape (#Discriminators, #Filters, #Entries)
} model_t;

void encode(u8* result, u8* input, mat_u8 thresholds, u32 num_bits, u32 num_inputs, u32 stride);

void generate_h3_values(mat_u16 values, u32 num_hashes, u32 num_inputs, u32 num_entries);

void reorder_thresholds(mat_u8 result, mat_u8 input, u16* order, u32 num_bits, u32 num_inputs);
void reorder_array(u8* buffer, u8* input, u16* order, u32 len);

void randomize_input_order(u16* input_order, u32 len, u32 dim1_block_size, u32 dim2_block_size, u32 aspect_ratio);

/**
 * @brief Initialize a model.
 * 
 * @param model An empty model, assumed to be not NULL.
 * @param num_inputs The total number of inputs to the model
 * @param num_classes The number of distinct possible outputs of the model; the number of classes in the dataset
 * @param filter_inputs The number of boolean inputs to each LUT/filter in the model
 * @param filter_entries The size of the underlying storage arrays for the filters. Must be a power of two.
 * @param filter_hashes The number of hash functions for each filter.
 */
void model_init(model_t* model, model_init_params_t* params);

/**
 * @brief Initializes all the buffers in the model. Assumes that the right field values are already attributed (in num_inputs, num_classes, ...)
 * 
 */
void model_init_buffers(model_t* model);

void model_alloc_runtime_buffers(model_params_t* p);

/**
 * @brief Performs an inference with the provided input. Hashing is delegated to filters.
 * 
 * @param model A initialized model
 * @param input A vector of boolean values representing the input sample
 * @return u64 
 */
u64 model_predict(model_t* model, u8* input); 

/**
 * @brief Performs an inference with the provided input. This uses a two stage prediction model 
 * with (1) Reorder (2) Hashes the whole reordered input (3) Performs filter reductions
 * 
 * @param model A initialized model
 * @param input A vector of boolean values representing the input sample
 * @return u64 
 */
u64 model_predict2(model_t* model, u8* input);

void model_frontend(model_t* model, u8* input);

/**
 * @brief Performs an inference with the provided HASHED input. 
 * Used by  model_predict2 as the third stage after reordering and hashing
 * 
 * @param model 
 * @param hashes_buffer 
 * @return u64 
 */
u64 model_predict_backend(model_t* model, mat_u16 hashes_buffer);

/**
 * @brief Performs a training step (updating filter values) for all discriminators
 * @param model An initialized model
 * @param input A vector of boolean values representing the input sample
 * @param target The class of the input
 */
void model_train(model_t* model, u8* input, u64 target);

/**
 * @brief Performs an inference to generate a response (number of filters which return True)
 * 
 * @param model An initialized model
 * @param discriminator_index The index of the discriminator to perform prediction on
 * @param input A vector of boolean values representing the input sample
 * @return u64 
 */
u64 discriminator_predict(model_t* model, u32 discriminator_index, u8* input);

/**
 * @brief Performs a training step (updating filter values)
 * 
 * @param model The model to train
 * @param discriminator_index The index of the discriminator in the model passed
 * @param input A vector of boolean values representing the input sample
 */
void discriminator_train(model_t* model, u32 discriminator_index, u8* input);

/**
 * @brief Check whether a value is a member of this filter (i.e. possibly seen at least b times)
 * 
 * @param model A initialized model, assumed to be not NULL.
 * @param discriminator_index The index of the discriminator
 * @param filter_index The index of the filter
 * @param input The bitvector to check the membership of
 * 
 * @return 1 if input is maybe a member of filter and 0 if input is definitely not a member of filter
 */
int filter_check_membership(model_t* model, u32 discriminator_index, u32 filter_index, u8* input);

/**
 * @brief Performs MIN reduction of the given filter for the given number of hashes
 * 
 * @param filter 
 * @param hashes 
 * @param filter_hashes 
 * @return entry_t 
 */
u16 filter_reduction(u16* filter, u16* hashes, u32 filter_hashes);

/**
 * @brief Make the filter learn the input
 * 
 * @param model The model to train
 * @param discriminator_index The index of the discriminator in the model passed (the class of input)
 * @param filter_index The filter index to add a member to
 * @param input A bitvector
 */
void filter_add_member(model_t* model, u32 discriminator_index, u32 filter_index, u8* input);

/**
 * @brief Hashes the whole input by (1) dividing the input into chunks that go into each filter
 * (2) hashing each chunk a specified number of times
 * 
 * @param hashes A malloc-e
 * d hash buffer of shape (#filter, #filter_hashes)
 * @param hash_params Hash params of shape (#filter_hashes, #filter_inputs)
 * @param num_filters
 * @param filter_hashes 
 * @param filter_inputs 
 * @param input 
 */
void perform_hashing(mat_u16 resulting_hashes, model_params_t* model_params, mat_u16 hash_parameters, u8* input);

void model_bleach(model_t* model);

void print_model_params(model_params_t* model_params);

#endif
