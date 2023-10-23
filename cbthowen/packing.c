#include "packing.h"

inline 
u8 get_bit(u8* data, u32 index) {
    u32 byte = index >> 3;
    u32 bit = index & 0b111;

    return (data[byte] >> bit) & 1;
}

/* value is assumed to be either 0x0 or 0x1, undefined behaviour otherwise */
inline 
void set_bit(u8* data, u32 index, u8 value) {
    u32 byte = index >> 3;
    u32 bit = index & 0b111;

    u8 element = data[byte];
    element &= ~(1 << bit);
    element |= value << bit;

    data[byte] = element;
}

inline
u32 get_packed_bytes(u32 array_len) {
    return array_len >> 3;
}

void pack_array_u16(u16* src, u8* dst, size_t src_len) {
    for(size_t i = 0; i < src_len; ++i) {
        set_bit(dst, i, src[i] & 1);
    }
}

