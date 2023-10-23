#include "data_loader.h"

mat_u8 train_images; // Of shape (#Samples, 784) -> flattened
mat_u8 test_images; // Of shape (#Samples, 784) -> flattened
u8* train_labels; // Of shape (#Samples,) 
u8* test_labels; // Of shape (#Samples,)

mat_u8 binarized_train; // Of shape (#Samples, 784 * bits_per_pixel)
mat_u8 binarized_test; // Of shape (#Samples, 784 * bits_per_pixel)

mat_u8 reordered_binarized_train; // Of shape (#Samples, 784 * bits_per_pixel)
mat_u8 reordered_binarized_test; // Of shape (#Samples, 784 * bits_per_pixel)

void reverse_bytes(u32* element) {
    u8 tmp;
    u8* ptr = (u8*) element;

    tmp = ptr[0];
    ptr[0] = ptr[3];
    ptr[3] = tmp;

    tmp = ptr[1];
    ptr[1] = ptr[2];
    ptr[2] = tmp;
}

void read_mnist_file(char* file_path, u32 num_samples, u32 stride, u32 len_info, u8* data, u32* info, u32 offset) {
    FILE* fd = fopen(file_path, "r");

    if(fd == NULL) printf("Not able to read the file at path %s\n", file_path);
    
    u32 fread_res = fread(info, sizeof(u32), len_info, fd);
    assert(fread_res > 0);
    assert(num_samples <= info[1]);
    for(u32 it = 0; it < len_info; ++it) reverse_bytes(info + it);
    
    if(offset > 0)
        fseek(fd, offset * stride, SEEK_CUR);
    fread_res = fread(data, sizeof(*data), num_samples * stride, fd);
    assert(fread_res > 0);

    fclose(fd);
}

void load_mnist_file(mat_u8 patterns, u8* labels, char* image_path, char* label_path, u32 num_samples, u32 offset) {
    u32* info_buffer = calloc(MNIST_LEN_INFO_IMAGE, sizeof(*info_buffer));

    read_mnist_file(image_path, num_samples, MNIST_IM_SIZE, MNIST_LEN_INFO_IMAGE, patterns.data, info_buffer, offset);
    assert(info_buffer[0] == 2051);
    printf("Image info: %d %d %d %d\n", info_buffer[0], info_buffer[1], info_buffer[2], info_buffer[3]);

    read_mnist_file(label_path, num_samples, 1, MNIST_LEN_INFO_LABEL, labels, info_buffer, offset);  
    assert(info_buffer[0] == 2049);

    free(info_buffer);
}

void load_mnist_train(mat_u8 patterns, u8* labels, u32 num_samples) {
    load_mnist_file(patterns, labels, MNIST_TRAIN_IMAGE, MNIST_TRAIN_LABEL, num_samples, 0);
}

void load_mnist_test(mat_u8 patterns, u8* labels, u32 num_samples) {
    load_mnist_file(patterns, labels, MNIST_TEST_IMAGE, MNIST_TEST_LABEL, num_samples, 0);
}

void load_infimnist(mat_u8 patterns, u8* labels, u32 num_samples) {
    load_mnist_file(patterns, labels, INFIMNIST_PATTERNS, INFIMNIST_LABELS, num_samples, 0);
}

void load_infimnist_labels(u8* labels, u32 num_samples) {
    u32 info_buffer[MNIST_LEN_INFO_LABEL];

    read_mnist_file(INFIMNIST_LABELS, num_samples, 1, MNIST_LEN_INFO_LABEL, labels, info_buffer, 0);  
    assert(info_buffer[0] == 2049);    
}

void load_mnist_train_offset(mat_u8 patterns, u8* labels, u32 num_samples, u32 offset) {
    load_mnist_file(patterns, labels, MNIST_TRAIN_IMAGE, MNIST_TRAIN_LABEL, num_samples, offset);
}

void load_mnist_test_offset(mat_u8 patterns, u8* labels, u32 num_samples, u32 offset) {
    load_mnist_file(patterns, labels, MNIST_TEST_IMAGE, MNIST_TEST_LABEL, num_samples, offset);
}

void load_infimnist_offset(mat_u8 patterns, u8* labels, u32 num_samples, u32 offset) {
    load_mnist_file(patterns, labels, INFIMNIST_PATTERNS, INFIMNIST_LABELS, num_samples, offset);
}

void load_infimnist_labels_offset(u8* labels, u32 num_samples, u32 offset) {
    u32 info_buffer[MNIST_LEN_INFO_LABEL];

    read_mnist_file(INFIMNIST_LABELS, num_samples, 1, MNIST_LEN_INFO_LABEL, labels, info_buffer, offset);  
    assert(info_buffer[0] == 2049);    
}

#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c"
#define BYTE_TO_BINARY(byte)  \
  ((byte) & 0x80 ? '1' : '0'), \
  ((byte) & 0x40 ? '1' : '0'), \
  ((byte) & 0x20 ? '1' : '0'), \
  ((byte) & 0x10 ? '1' : '0'), \
  ((byte) & 0x08 ? '1' : '0'), \
  ((byte) & 0x04 ? '1' : '0'), \
  ((byte) & 0x02 ? '1' : '0'), \
  ((byte) & 0x01 ? '1' : '0') 

void print_pixel(u8 value, int raw) {
    if(raw == 1) printf(BYTE_TO_BINARY_PATTERN" ", BYTE_TO_BINARY(value));
    else if(raw == 2) printf("%d ", value);
    else {
        char map[10]= " .,:;ox%#@";
        u32 index = (255 - value) * 10 / 256;
        printf("%c ", map[index]);
    }
}

void print_binarized_value(u8 value) {
    char map[2]= " @";
    printf("%c ", map[value - 1]);
}

void print_mnist_image_(mat_u8 images, u8* labels, u32 index, int raw) {
    printf("Image %u (Label %d)\n", index, labels[index]);
    for (u32 j = 0; j < MNIST_IM_SIZE; ++j) {
        print_pixel(*MATRIX(images, index, j), raw);
        if ((j+1) % 28 == 0) putchar('\n');
    }
    putchar('\n');
}

void print_binarized_image(mat_u8 m, u8* labels, u32 index, u32 num_bits) {
    printf("Image %u (Label %d) (Binarized)\n", index, labels[index]);
    for (u32 j = 0; j < MNIST_IM_SIZE; ++j) {
        char value = *MATRIX(m, index, j * num_bits);
        for(u32 b = 1; b < num_bits; ++b)
            value |= (*MATRIX(m, index, j * num_bits + b) << b);

        print_binarized_value(value);
        if ((j+1) % 28 == 0) putchar('\n');
    } 
    putchar('\n'); 
}

void print_binarized_image_raw(mat_u8 m, u8* labels, u32 index, u32 num_bits) {
    if(labels != NULL)
        printf("Binarized image %u (Label %d) (Binarized)\n", index, labels[index]);
    else
        printf("Binarized image %u (Binarized)\n", index);
    for (u32 j = 0; j < MNIST_IM_SIZE * num_bits; ++j) {
        u8 value = *MATRIX(m, index, j);
        printf("%-3u ", value);
        if ((j+1) % 28 == 0) putchar('\n');
    }
}

void print_image(mat_u8 m, u8* labels, u32 index) {
    print_mnist_image_(m, labels, index, 0);
}

void print_image_raw(mat_u8 m, u8* labels, u32 index) {
    print_mnist_image_(m, labels, index, 1);
}

u8 thermometer_encode(u8 val, double mean, double std, u32 num_bits, double* skews, u8* encodings) {
    u32 skew_index = 0;
    for(; skew_index < num_bits && val >= skews[skew_index] * std + mean; ++skew_index);

    // printf("val: %d, index: %d\n", val, skew_index);
        
    return encodings[skew_index];
}


void binarize_sample2(mat_u8 result, mat_u8 dataset, u32 sample_it, u32 num_bits, double* mean, double* variance, double* skews, u8* encodings) { 
    for(u32 bit_it = 0; bit_it < num_bits; ++bit_it) {
        for(u32 offset_it = 0; offset_it < dataset.stride; ++offset_it) {
            char packed_encoding = thermometer_encode(*MATRIX(dataset, sample_it, offset_it), mean[offset_it], sqrt(variance[offset_it]), num_bits, skews, encodings);
            *MATRIX(result, sample_it, bit_it*dataset.stride + offset_it) = (packed_encoding >> bit_it) & 0x1;
        }
    }
}

void binarize_sample(mat_u8 result, mat_u8 dataset, u32 sample_it, u32 num_bits, double* mean, double* variance, double* skews, u8* encodings) {
    for(u32 offset_it = 0; offset_it < dataset.stride; ++offset_it) {
        char packed_encoding = thermometer_encode(*MATRIX(dataset, sample_it, offset_it), mean[offset_it], sqrt(variance[offset_it]), num_bits, skews, encodings);
        // printf("packed "BYTE_TO_BINARY_PATTERN"\n", BYTE_TO_BINARY(packed_encoding));
        for(u32 bit_it = 0; bit_it < num_bits; ++bit_it) {
            // char x = (packed_encoding >> bit_it) & 0x1;
            // printf("    "BYTE_TO_BINARY_PATTERN"\n", BYTE_TO_BINARY(x));
            *MATRIX(result, sample_it, offset_it*num_bits + bit_it) = (packed_encoding >> bit_it) & 0x1;
        }
    }
}

u8 clip_u8(double x) {
    if(x < 0) return 0;
    if(x > 255) return 255;
    return (u8) x;
}

// thresholds is of shape if STRIDED_ENCODING: (num_bits, num_elements) else: (num_elements, num_bits)
void calculate_thresholds(mat_u8 thresholds, double* skews, double* means, double* variances, u32 num_bits, u32 num_elements) {
    for(u32 it = 0; it < num_elements; ++it) {
        double mean = means[it];
        double std = sqrt(variances[it]);
        for(u32 bit_it = 0; bit_it < num_bits; ++bit_it) {
            u8 thresh = clip_u8(ceil(skews[bit_it] * std + mean));
#ifdef STRIDED_ENCODING
            *MATRIX(thresholds, bit_it, it) = thresh;
#else
            *MATRIX(thresholds, it, bit_it) = thresh;
#endif
        }
    }
}

// verify that the thresholds are in ascending order in terms of bits
void verify_thresholds(mat_u8 thresholds, u32 num_bits, u32 num_elements) {
    for(u32 it = 0; it < num_elements; ++it) {
#ifdef STRIDED_ENCODING
        u8 thresh_prev = *MATRIX(thresholds, 0, it);
#else
        u8 thresh_prev = *MATRIX(thresholds, it, 0);
#endif
        for(u32 bit_it = 1; bit_it < num_bits; ++bit_it) {
#ifdef STRIDED_ENCODING
            u8 thresh = *MATRIX(thresholds, bit_it, it);
#else
            u8 thresh = *MATRIX(thresholds, it, bit_it);
#endif
            assert(thresh_prev <= thresh);
            thresh_prev = thresh;
        }
    }
}

/**
 * @brief 
 * 
 * @param result of shape if STRIDED_ENCODING: (num_bits * num_elements) else: (num_elements * num_bits)
 * @param dataset of shape (num_elements)
 * @param thresholds of shape if STRIDED_ENCODING: (num_bits, num_elements) else: (num_elements, num_bits)
 * @param num_elements 
 * @param num_bits 
 */
void apply_thresholds(u8* result, u8* dataset, mat_u8 thresholds, u32 num_elements, u32 num_bits) {
#ifdef STRIDED_ENCODING
    for(u32 bit_it = 0; bit_it < num_bits; ++bit_it) {
        u8* result_chunk = result + bit_it * num_elements;
        u8* thresholds_chunk = MATRIX_AXIS1(thresholds, bit_it);
        for(u32 it = 0; it < num_elements; ++it) {
            result_chunk[it] = dataset[it] >= thresholds_chunk[it];
        }
    }
#else
    for(u32 it = 0; it < num_elements; ++it) {
        u8* result_chunk = result + it * num_bits;
        u8* thresholds_chunk = MATRIX_AXIS1(thresholds, it);
        for(u32 bit_it = 0; bit_it < num_bits; ++bit_it) {
            result_chunk[bit_it] = dataset[it] >= thresholds_chunk[bit_it];
        }
    }
#endif
}


void binarize_matrix_thresholds(mat_u8 result, mat_u8 dataset, mat_u8 thresholds, u32 sample_size, u32 num_samples, u32 num_bits) {
    for(u32 sample_it = 0; sample_it < num_samples; ++sample_it)
        apply_thresholds(
            MATRIX_AXIS1(result, sample_it), 
            MATRIX_AXIS1(dataset, sample_it), 
            thresholds, 
            sample_size, num_bits
        );
}

void set_thresholds(mat_u8* thresholds, mat_u8 dataset, u32 sample_size, u32 num_samples, u32 num_bits) {
    double skews[num_bits];
    for(u32 it = 0; it < num_bits; ++it) {
        skews[it] = gauss_inv((((double) (it + 1))) / (((double) num_bits + 1)));
        printf("skew: %lf\n", skews[it]);
    }

    double mean[sample_size];
    double variance[sample_size];

    mat_u8_mean(mean, dataset, sample_size, num_samples);
    mat_u8_variance(variance, dataset, sample_size, num_samples, mean);

    calculate_thresholds(*thresholds, skews, mean, variance, num_bits, sample_size);

    verify_thresholds(*thresholds, num_bits, sample_size);
}

/**
 * @brief 
 * 
 * @param result of shape if STRIDED_ENCODING: (num_samples, num_bits * sample_size), else: (num_samples, sample_size * num_bits)
 * @param dataset of shape (num_samples, sample_size)
 * @param sample_size 
 * @param num_samples 
 * @param num_bits 
 * 
 * @return thresholds of shape if STRIDED_ENCODING: (num_bits, sample_size), else: (sample_size, num_bits)
 */
void binarize_matrix(mat_u8* resulting_thresholds, mat_u8 result, mat_u8 dataset, u32 sample_size, u32 num_samples, u32 num_bits) {
    set_thresholds(resulting_thresholds, dataset, sample_size, num_samples, num_bits);

    for(u32 sample_it = 0; sample_it < num_samples; ++sample_it) {
        apply_thresholds(
            MATRIX_AXIS1(result, sample_it), 
            MATRIX_AXIS1(dataset, sample_it), 
            *resulting_thresholds, 
            sample_size, num_bits
        );
    }
}

void fill_input_random(u8* input, u32 input_length) {
    for(u32 it = 0; it < input_length; ++it) {
        input[it] = rand() % 2;
    }
}

void reorder_dataset(mat_u8 result, mat_u8 dataset, u16* order, u32 num_samples, u32 num_elements) {
    for(u32 it = 0; it < num_samples; ++it) {
        reorder_array(MATRIX_AXIS1(result, it), MATRIX_AXIS1(dataset, it), order, num_elements);
    }
}

