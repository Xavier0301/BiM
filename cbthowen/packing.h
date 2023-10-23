#ifndef PACKING_H
#define PACKING_H

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

#include "types.h"

u8 get_bit(u8* data, u32 index);
void set_bit(u8* data, u32 index, u8 value);

u32 get_packed_bytes(u32 array_len);

void pack_array_u16(u16* src, u8* dst, size_t src_len);

#endif // PACKING_H
