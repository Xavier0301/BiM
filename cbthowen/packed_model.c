#include "packed_model.h"

// Assumes model param is already set
void pmodel_init_buffers(pmodel_t* model) {
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
    tensor_u8_init(&model->filters, model->p.num_classes, model->p.num_filters, PMODEL_FILTER_SIZE(model));

    // Pre-alloc buffers used at inference time
    model_alloc_runtime_buffers(&model->p);
}

void model_port(model_t* source, pmodel_t* dest) {
    // Shallow copy of parameters (fine because does not contain pointers)
    dest->p = source->p;

    pmodel_init_buffers(dest);

    // Copy thresholds
#ifdef STRIDED_ENCODING
    for(u32 bit_it = 0; bit_it < source->p.bits_per_input; ++bit_it) {
        for(u32 it = 0; it < source->p.num_inputs; ++it) {
            *MATRIX(dest->encoding_thresholds, bit_it, it) = *MATRIX(source->encoding_thresholds, bit_it, it);
        }
    }
#else
    for(u32 it = 0; it < source->p.num_inputs_encoded; ++it) {
        for(u32 bit_it = 0; bit_it < source->p.bits_per_input; ++bit_it) {
            *MATRIX(dest->encoding_thresholds, it, bit_it) = *MATRIX(source->encoding_thresholds, it, bit_it);
        }
    }
#endif

    // Copy input order
    for(u32 it = 0; it < source->p.num_inputs_encoded; ++it)
        dest->input_order[it] = source->input_order[it];

    // Copy hash parameters
    for(u32 hash_it = 0; hash_it < source->p.filter_hashes; ++hash_it) {
        for(u32 input_it = 0; input_it < source->p.filter_inputs; ++input_it) {
            *MATRIX(dest->hash_parameters, hash_it, input_it) = *MATRIX(source->hash_parameters, hash_it, input_it);
        }
    }

}

void model_pack(model_t* source, pmodel_t* dest) {
    // 1. Trivially port all things that don't change
    model_port(source, dest);

    // 2. Pack filters
    tensor_u8_init(
        &dest->filters, 
        source->p.num_classes,
        source->p.num_filters,
        get_packed_bytes(source->p.filter_entries));

    // We could pack the whole tensor as an aray but this is more legible 
    //      and robust to block sizes that don't divide the number of entries
    for(size_t discr_it = 0; discr_it < source->p.num_classes; ++discr_it) {
        for(size_t filter_it = 0; filter_it < source->p.num_filters; ++filter_it) {
            u16* src = TENSOR3D_AXIS2(source->filters, discr_it, filter_it);
            u8* dst = TENSOR3D_AXIS2(dest->filters, discr_it, filter_it);

            pack_array_u16(src, dst, source->p.filter_entries);
        }
    }
}

u8 pfilter_reduction(u8* filter, u16* hashes, u32 filter_hashes) {
    u8 result = 1;
    for(u32 it = 0; it < filter_hashes; ++it) {
        result &= get_bit(filter, hashes[it]);
    }

    return result;
}

void pmodel_frontend(pmodel_t* model, u8* input) {
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

u64 pmodel_predict(pmodel_t* model, u8* input) {
    // Reorder
    pmodel_frontend(model, input);

    // Hash
    perform_hashing(hashes_buffer, &model->p, model->hash_parameters, reorder_buffer);

    return pmodel_predict_backend(model, hashes_buffer);
}

u64 pmodel_predict_backend(pmodel_t* model, mat_u16 hashes_buffer) {
    // Calculate popcounts for each discriminators
    u16 popcounts[model->p.num_classes];
    for(u32 discr_it = 0; discr_it < model->p.num_classes; ++discr_it)
        popcounts[discr_it] = 0;

    for(u32 filter_it = 0; filter_it < model->p.num_filters; ++filter_it) {
        for(u32 discr_it = 0; discr_it < model->p.num_classes; ++discr_it) {
            u8 resp = pfilter_reduction(
                TENSOR3D_AXIS2(model->filters, discr_it, filter_it), 
                MATRIX_AXIS1(hashes_buffer, filter_it), model->p.filter_hashes);
            popcounts[discr_it] += resp;
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
