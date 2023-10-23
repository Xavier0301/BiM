#include "model.h"

#include "time.h"

u8* encoding_buffer; // of shape (#Inputs * #Bits), with undefined stride
u8* reorder_buffer; // of shape if reorder_first: (#Inputs), else: (#Inputs * #Bits)
mat_u16 hashes_buffer; // of shape (#Filters, #Hashes)

/**
 * @brief 
 * 
 * @param result 
 * @param input 
 * @param thresholds of shape if STRIDED_ENCODING: (#Bits, #Inputs), else: (#Inputs, #Bits)
 * @param num_bits 
 * @param num_inputs 
 * @param stride 
 */
void encode(u8* result, u8* input, mat_u8 thresholds, u32 num_bits, u32 num_inputs, u32 stride) {
#ifdef STRIDED_ENCODING
    mat_u8 res_mat = (mat_u8) {
        .data = result,
        .stride = num_inputs
    };
    for(u32 bit_it = 0; bit_it < num_bits; ++bit_it) {
        u8* result_chunk = MATRIX_AXIS1(res_mat, bit_it);
        u8* threshold_chunk = MATRIX_AXIS1(thresholds, bit_it);
        for(u32 input_it = 0; input_it < num_inputs; ++input_it) {
            result_chunk[input_it] = (input[input_it] >= threshold_chunk[input_it]);
        }
    }
#elif LOCAL_STRIDED_ENCODING
    tensor_u8 res_tensor = TENSOR_VIEW(
        tensor_u8, result, 
        num_inputs / stride, num_bits, stride
    );
    for(u32 input_it = 0; input_it < num_inputs; ++input_it) {
        u32 group = input_it / stride;
        u32 stride_offset = input_it % stride;

        u8* threshold_chunk = MATRIX_AXIS1(thresholds, input_it);
        for(u32 bit_it = 0; bit_it < num_bits; ++bit_it) {
            *TENSOR3D(res_tensor, group, bit_it, stride_offset)
                = (u8) (input[input_it] >= threshold_chunk[bit_it]);
        }
    }
#else
    mat_u8 res_mat = (mat_u8) {
        .data = result,
        .stride = num_bits
    };
    for(u32 input_it = 0; input_it < num_inputs; ++input_it) {
        u8* result_chunk = MATRIX_AXIS1(res_mat, input_it);
        u8* threshold_chunk = MATRIX_AXIS1(thresholds, input_it);
        for(u32 bit_it = 0; bit_it < num_bits; ++bit_it) {
            result_chunk[bit_it] = (input[input_it] >= threshold_chunk[bit_it]);
        }
    }
#endif
}

/**
 * @brief 
 * 
 * @param result of shape if STRIDED_ENCODING: (#Bits, #Inputs), else: (#Inputs, #Bits)
 * @param input of shape if STRIDED_ENCODING: (#Bits, #Inputs), else: (#Inputs, #Bits)
 * @param order 
 * @param num_bits 
 * @param num_inputs 
 */
void reorder_thresholds(mat_u8 result, mat_u8 input, u16* order, u32 num_bits, u32 num_inputs) {
#ifdef STRIDED_ENCODING
    for(u32 bit_it = 0; bit_it < num_bits; ++bit_it) {
        reorder_array(
            MATRIX_AXIS1(result, bit_it), 
            MATRIX_AXIS1(input, bit_it), 
            order, num_inputs
        );
    }
#else
    for(u32 input_it = 0; input_it < num_inputs; ++input_it) {
        for(u32 bit_it = 0; bit_it < num_bits; ++bit_it) {
            *MATRIX(result, input_it, bit_it) = *MATRIX(input, order[input_it], bit_it);
        }
    }
#endif
}

void reorder_array(u8* result, u8* input, u16* order, u32 len) {
    for(u32 it = 0; it < len; ++it)
        result[it] = input[order[it]];
}

void randomize_1d(u16* input_order, u32 len, u32 block_size) {
    for(u32 it = 0; it < len; ++it) {
        input_order[it] = it;
    }

    assert(len % block_size == 0 && "randomize_1d: Block size must be a divisor of the input size");
    for(u32 it = 0; it < len; it += block_size) {
        u32 dyn_len = (it + block_size > len) ? len - it : block_size;
        shuffle_array(input_order + it, dyn_len);
    }
}

// aspect_ratio: rows / columns of the input
void randomize_2d(u16* input_order, u32 len, u32 col_block_size, u32 row_block_size, u32 aspect_ratio) {
    u32 col_len = (u32) sqrt(len / aspect_ratio);
    u32 row_len = col_len * aspect_ratio;
    printf("lengths: %u (c %u / %u) (r %u / %u)\n", len, col_len, col_block_size, row_len, row_block_size);

    assert(col_len * row_len == len && "randomize_2d: Aspect ratio must be a divisor of the input size");
    assert(col_len % col_block_size == 0 && "randomize_2d: Col block size must be a divisor of the column count");
    assert(row_len % row_block_size == 0 && "randomize_2d: Row block size must be a divisor of the row count");

    u32 block_size = col_block_size * row_block_size;

    u32 num_col_blocks = col_len / col_block_size;
    u32 num_row_blocks = row_len / row_block_size;

    u32 it = 0;
    for(u32 macro_row = 0; macro_row < num_row_blocks; ++macro_row) {
        for(u32 macro_col = 0; macro_col < num_col_blocks; ++macro_col) {
            u32 macro_col_offset = macro_col * col_block_size;
            u32 macro_row_offset = macro_row * row_block_size;

            for(u32 micro_row = 0; micro_row < row_block_size; ++micro_row) {
                for(u32 micro_col = 0; micro_col < col_block_size; ++micro_col) {
                    u32 col = micro_col + macro_col_offset;
                    u32 row = micro_row + macro_row_offset;

                    input_order[it] = col + row * col_len;

                    ++it;
                }
            }
        }
    }

    // for(u32 it = 0; it < len; ++it) {
    //     printf("%u ", input_order[it]);
    //     if((it + 1) % col_len == 0) printf("\n");
    // }
    // printf("\n");

    // exit(0);

    for(u32 block_it = 0; block_it < len; block_it += block_size) {
        shuffle_array(input_order + block_it, block_size);
    }
}

// aspect_ratio: rows / columns of the input
void randomize_input_order(u16* input_order, u32 len, u32 dim1_block_size, u32 dim2_block_size, u32 aspect_ratio) {
    if(dim2_block_size == 1) {
        randomize_1d(input_order, len, dim1_block_size);
    } else {
        randomize_2d(input_order, len, dim1_block_size, dim2_block_size, aspect_ratio);
    }
}

void generate_h3_values(mat_u16 values, u32 num_hashes, u32 num_inputs, u32 num_entries) {
    for(u32 i = 0; i < num_hashes; ++i) {
        for(u32 j = 0; j < num_inputs; ++j) {
            *MATRIX(values, i, j) = unif_rand(num_entries - 1);
        }
    }
}

void model_init(model_t* model, model_init_params_t* params) {
    model->p.num_inputs = params->num_inputs;
    model->p.bits_per_input = params->bits_per_input;
    model->p.pad_zeros = ((((params->num_inputs * params->bits_per_input) / params->filter_inputs) * params->filter_inputs) - (params->num_inputs * params->bits_per_input)) % params->filter_inputs;
    model->p.num_inputs_encoded = (params->num_inputs * params->bits_per_input) + model->p.pad_zeros;

    // Params
    model->p.num_classes = params->num_classes;
    assert(model->p.num_inputs_encoded % params->filter_inputs == 0 && "model_init: num_inputs must be a multiple of filter_inputs");
    model->p.num_filters = model->p.num_inputs_encoded / params->filter_inputs;

#ifdef REORDER_FIRST
    assert(model->p.num_inputs % params->dim1_block_size == 0 && "model_init: num_inputs must be a multiple of dim1_block_size");
    assert(model->p.num_inputs % params->dim2_block_size == 0 && "model_init: num_inputs_encoded must be a multiple of dim2_block_size");
#else
    assert(model->p.num_inputs_encoded % params->dim1_block_size == 0 && "model_init: num_inputs_encoded must be a multiple of dim1_block_size");
    assert(model->p.num_inputs_encoded % params->dim2_block_size == 0 && "model_init: num_inputs_encoded must be a multiple of dim2_block_size");
#endif
    model->p.dim1_block_size = params->dim1_block_size;
    model->p.dim2_block_size = params->dim2_block_size;

    model->p.filter_hashes = params->filter_hashes;
    model->p.filter_inputs = params->filter_inputs;
    model->p.filter_entries = params->filter_entries;

    model->p.bleach = 1;

    print_model_params(&model->p);

    // Buffer allocs
    model_init_buffers(model);

    // Buffer filling
    srand(time(NULL));
#ifdef REORDER_FIRST
    randomize_input_order(model->input_order, model->p.num_inputs, model->p.dim1_block_size, model->p.dim2_block_size, params->bits_per_input);
#else
    randomize_input_order(model->input_order, model->p.num_inputs_encoded, model->p.dim1_block_size, model->p.dim2_block_size, params->bits_per_input);
#endif

    generate_h3_values(model->hash_parameters, model->p.filter_hashes, model->p.filter_inputs, model->p.filter_entries);

}

void model_init_buffers(model_t* model) {
    // Encoding thresholds
#ifdef STRIDED_ENCODING
    matrix_u8_init(&model->encoding_thresholds, model->p.bits_per_input, model->p.num_inputs);
#else
    matrix_u8_init(&model->encoding_thresholds, model->p.num_inputs, model->p.bits_per_input);
#endif

    // Order
#ifdef REORDER_FIRST
    model->input_order = calloc(model->p.num_inputs, sizeof(*model->input_order));
#else
    model->input_order = calloc(model->p.num_inputs_encoded, sizeof(*model->input_order));
#endif

    // Hashes
    matrix_u16_init(&model->hash_parameters, model->p.filter_hashes, model->p.filter_inputs);

    // Filters
    tensor_u16_init(&model->filters, model->p.num_classes, model->p.num_filters, model->p.filter_entries);

    // Pre-alloc buffers used at inference time
    model_alloc_runtime_buffers(&model->p);
}

void model_alloc_runtime_buffers(model_params_t* p) {
    // Pre-alloc buffers used at inference time
    encoding_buffer = calloc(p->num_inputs_encoded, sizeof(*encoding_buffer));
#ifdef REORDER_FIRST
    reorder_buffer = calloc(p->num_inputs, sizeof(*reorder_buffer));
#else
    reorder_buffer = calloc(p->num_inputs_encoded, sizeof(*reorder_buffer));
#endif
    matrix_u16_init(&hashes_buffer, p->num_filters, p->filter_hashes);
}

// assumes input is already zero padded
u64 model_predict(model_t* model, u8* input) {
#ifdef REORDER_FIRST
    reorder_array(reorder_buffer, input, model->input_order, model->p.num_inputs);
    encode(
        encoding_buffer, reorder_buffer, 
        model->encoding_thresholds, 
        model->p.bits_per_input, model->p.num_inputs, model->p.filter_entries
    );
#else
    encode(
        encoding_buffer, input, 
        model->encoding_thresholds, 
        model->p.bits_per_input, model->p.num_inputs, model->p.filter_entries
    );

    reorder_array(
        reorder_buffer, encoding_buffer, 
        model->input_order, model->p.num_inputs_encoded
    );
#endif

    u64 response_index = 0;
    u64 max_response = 0;
    for(u32 it = 0; it < model->p.num_classes; ++it) {
        u64 resp = discriminator_predict(model, it, reorder_buffer);
        if(resp >= max_response) {
            max_response = resp;
            response_index = it;
        }
    }

    return response_index;
}

void model_train(model_t* model, u8* input, u64 target) {    
    model_frontend(model, input);

    discriminator_train(model, target, reorder_buffer);
}

u64 discriminator_predict(model_t* model, u32 discriminator_index, u8* input) {
    u64 response = 0;
    u8* chunk = input;

    for(u32 it = 0; it < model->p.num_filters; ++it) {
        response += filter_check_membership(model, discriminator_index, it, chunk);
        chunk += model->p.filter_inputs;
    }

    return response;
}

void discriminator_train(model_t* model, u32 discriminator_index, u8* input) {
    u8* chunk = input;

    for(u32 it = 0; it < model->p.num_filters; ++it) {
        filter_add_member(model, discriminator_index, it, chunk);
        chunk += model->p.filter_inputs;
    }
}

/**
 * @brief 
 * 
 * @param result Resulting hash
 * @param input Boolean vector of shape (#inputs)
 * @param parameters Vector of shape (#inputs)
 */
u16 h3_hash(u8* input, u16* parameters, u32 num_inputs) {
    // u16 result = 0;
    // if(input[0]) result = parameters[0];
    // u16 result = parameters[0] & input[0];
#if FAST_HASH
    u16 result = parameters[0] & (- (i16) input[0]);
#else
    u16 result = parameters[0] * input[0];
#endif
    for(u32 j = 1; j < num_inputs; ++j) {
        // if(input[j]) result ^= parameters[j];
        // result ^= input[j] ? parameters[j] : 0;
#if FAST_HASH
        result ^= parameters[j] & (- (i16) input[j]);
#else
        result ^= parameters[j] * input[j];
#endif

        // result ^= parameters[j] & input[j];
    }

    return result;
}

// Can be replaced by an AND reduction (ONLY WHEN BLEACH=1)
int filter_check_membership(model_t* model, u32 discriminator_index, u32 filter_index, u8* input) {
    u16 hash_result;
    u16 entry;

    u16 minimum = 0xffff;
    for(u32 it = 0; it < model->p.filter_hashes; ++it) {
        hash_result = h3_hash(input, MATRIX_AXIS1(model->hash_parameters, it), model->p.filter_inputs);
        entry = *TENSOR3D(model->filters, discriminator_index, filter_index, hash_result);
        if(entry <= minimum) minimum = entry;
    }

    return minimum >= model->p.bleach;
}

void filter_add_member(model_t* model, u32 discriminator_index, u32 filter_index, u8* input) {
    u16 hash_result;
    u16 entry;

    // Get minimum of all filter hash response
    u16 minimum = 0xffff;
    for(u32 it = 0; it < model->p.filter_hashes; ++it) {
        hash_result = h3_hash(input, MATRIX_AXIS1(model->hash_parameters, it), model->p.filter_inputs);
        entry = *TENSOR3D(model->filters, discriminator_index, filter_index, hash_result);
        if(entry < minimum) minimum = entry;
    }

    // Increment the value of all minimum entries
    for(u32 it = 0; it < model->p.filter_hashes; ++it) {
        hash_result = h3_hash(input, MATRIX_AXIS1(model->hash_parameters, it), model->p.filter_inputs);
        entry = *TENSOR3D(model->filters, discriminator_index, filter_index, hash_result);
        if(entry == minimum) 
            *TENSOR3D(model->filters, discriminator_index, filter_index, hash_result) = minimum + 1;
    }
}

u16 filter_reduction(u16* filter, u16* hashes, u32 filter_hashes) {
    u16 min = 0xffff;
    for(u32 it = 0; it < filter_hashes; ++it) {
        u16 entry = filter[hashes[it]];
        if(entry < min) min = entry;
    }

    return min;
}

void perform_hashing(mat_u16 resulting_hashes, model_params_t* model_params, mat_u16 hash_parameters, u8* input) {
    u8* chunk = input;
    for(u32 chunk_it = 0; chunk_it < model_params->num_filters; ++chunk_it) {
        for(u32 hash_it = 0; hash_it < model_params->filter_hashes; ++hash_it) {
            *MATRIX(resulting_hashes, chunk_it, hash_it) = h3_hash(chunk, MATRIX_AXIS1(hash_parameters, hash_it), model_params->filter_inputs);
        }
        chunk += model_params->filter_inputs;
    }
}

// #include "data_loader.h"
u64 model_predict2(model_t* model, u8* input) {
    // Encode + Reorder
    model_frontend(model, input);

    // Hash
    perform_hashing(hashes_buffer, &model->p, model->hash_parameters, reorder_buffer);

    // Filter reduce
    return model_predict_backend(model, hashes_buffer);
}

void model_frontend(model_t* model, u8* input) {
#ifdef REORDER_FIRST
    // Reorder
    reorder_array(
        reorder_buffer, input, 
        model->input_order, model->p.num_inputs
    );

    // Encode
    encode(
        encoding_buffer, reorder_buffer, 
        model->encoding_thresholds, 
        model->p.bits_per_input, model->p.num_inputs, model->p.filter_entries
    );
#else
    // Encode
    encode(
        encoding_buffer, input, 
        model->encoding_thresholds, 
        model->p.bits_per_input, model->p.num_inputs, model->p.filter_entries
    );
    // print_binarized_image_raw(model->encoding_thresholds, NULL, 0, model->p.bits_per_input);
    
    // Reorder
    reorder_array(
        reorder_buffer, encoding_buffer, 
        model->input_order, model->p.num_inputs_encoded
    );
    // print_binarized_image_raw((mat_u8) {.data=reorder_buffer, .stride=model->p.num_inputs_encoded}, NULL, 0, model->p.bits_per_input);
#endif
}

u64 model_predict_backend(model_t* model, mat_u16 hashes_buffer) {
    // Calculate popcounts for each discriminators
    u16 popcounts[model->p.num_classes];
    for(u32 discr_it = 0; discr_it < model->p.num_classes; ++discr_it)
        popcounts[discr_it] = 0;

    for(u32 filter_it = 0; filter_it < model->p.num_filters; ++filter_it) {
        for(u32 discr_it = 0; discr_it < model->p.num_classes; ++discr_it) {
            u16 resp = filter_reduction(TENSOR3D_AXIS2(model->filters, discr_it, filter_it), MATRIX_AXIS1(hashes_buffer, filter_it), model->p.filter_hashes);
            popcounts[discr_it] += (resp >= model->p.bleach);
        }
    }

    // for(u32 discr_it = 0; discr_it < model->p.num_classes; ++discr_it)
    //     printf("%d ", popcounts[discr_it]);
    // printf("\n");

    // Pick the argmax of popcounts
    u64 response_index = 0;
    u16 max_popcount = 0;
    for(u32 discr_it = 0; discr_it < model->p.num_classes; ++discr_it) {
        if(popcounts[discr_it] > max_popcount) {
            max_popcount = popcounts[discr_it];
            response_index = discr_it;
        }
    }

    return response_index;
}

void model_bleach(model_t* model) {
    for(u32 discr_it = 0; discr_it < model->p.num_classes; ++discr_it) {
        for(u32 filter_it = 0; filter_it < model->p.num_filters; ++filter_it) {
            for(u32 entry_it = 0; entry_it < model->p.filter_entries; ++entry_it) {
                u16* entry = TENSOR3D(model->filters, discr_it, filter_it, entry_it);
                *entry = (*entry >= model->p.bleach);
            }
        }
    }

    model->p.bleach = 1;
}

void print_model_params(model_params_t* model_params) {
    printf("Model parameters:\n");
    printf("\tTensor size: %u x %u x %u\n", model_params->num_classes, model_params->num_filters, model_params->filter_entries);
    printf("\tFilter params: %u (hashes) %u (inputs)\n", model_params->filter_hashes, model_params->filter_inputs);
    printf("\tInput size: %u x %u (padding %u) (total %u)\n", model_params->num_inputs, model_params->bits_per_input, model_params->pad_zeros, model_params->num_inputs_encoded);
    printf("\tOther: %u (dim1 block size) %u (dim2 block size) %u (bleach)\n", model_params->dim1_block_size, model_params->dim2_block_size, model_params->bleach);
}
