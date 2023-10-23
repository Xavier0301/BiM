#ifndef BATCH_H
#define BATCH_H

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

#include "model.h"
#include "types.h"

/**
 * @brief 
 * 
 * @param resulting_hashes of shape (batch_size, #num_filters, #filter_hashes)
 * @param model 
 * @param input_batch of shape (batch_size, #elements_per_sample)
 * @param batch_size 
 */
void batch_hashing(tensor_u16 resulting_hashes, model_t* model, mat_u8 input_batch, size_t batch_size);

void batch_prediction(size_t* results, model_t* model, mat_u8 input_batch, size_t batch_size);


#endif 
