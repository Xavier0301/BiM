#ifndef _TINYLIB_H_
#define _TINYLIB_H_

/* Some utility wrapper around the UPMEM DPU runtime library */

#include <stdint.h>
#include <stdio.h>
#include <defs.h>
#include <mram.h>
#include <alloc.h>

#include "../cbthowen/types.h"

#define DEFINE_MRAM_READ_UNALIGNED(type, shift) \
    static inline \
    type mram_read_##type##_unaligned(u32 addr) { \
        u32 offset = addr % 8; \
        u32 aligned_addr = addr - offset; \
        \
        __dma_aligned type tmp[8 / sizeof(type)]; \
        mram_read( \
            (__mram_ptr void*) aligned_addr, \
            tmp, \
            sizeof(tmp) \
        ); \
        \
        return tmp[offset >> shift]; \
    }

DEFINE_MRAM_READ_UNALIGNED(u8, 0)

DEFINE_MRAM_READ_UNALIGNED(u16, 1)

DEFINE_MRAM_READ_UNALIGNED(u32, 2)

#define DEFINE_MRAM_READ_TYPED(type) \
    static inline \
    void mram_read_##type(u32 from, type* to, u32 len) { \
        mram_read( \
            (__mram_ptr void*) from, \
            to, \
            len * sizeof(type) \
        ); \
    }

DEFINE_MRAM_READ_TYPED(u8)

DEFINE_MRAM_READ_TYPED(u16)

DEFINE_MRAM_READ_TYPED(u32)

#define DEFINE_MRAM_WRITE_TYPED(type) \
    static inline \
    void mram_write_##type(type* from, u32 to, u32 len) { \
        mram_write( \
            from, \
            (__mram_ptr void*) to, \
            len * sizeof(type) \
        ); \
    }

DEFINE_MRAM_WRITE_TYPED(u8)

DEFINE_MRAM_WRITE_TYPED(u16)

DEFINE_MRAM_WRITE_TYPED(u32)

DEFINE_MRAM_WRITE_TYPED(u64)

#define DEFINE_WRAM_ALLOC_TYPED(type) \
    static inline \
    type* wram_alloc_##type(u32 len) { \
        return (type *) mem_alloc(len * sizeof(type)); \
    }

DEFINE_WRAM_ALLOC_TYPED(u8)

DEFINE_WRAM_ALLOC_TYPED(u16)

DEFINE_WRAM_ALLOC_TYPED(u32)

#endif /* _TINYLIB_H_ */
