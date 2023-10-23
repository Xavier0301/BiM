	.text
	.file	"task.c"
                                        // Start of file scope inline assembly
	.section	.data.reset_barrier,"aw",@progbits
	.type	reset_barrier,@object
	.globl	reset_barrier
	.p2align	2
reset_barrier:
	.byte	255
	.byte	11
	.byte	11
	.byte	__atomic_bit_barrier_reset_barrier
	.size	reset_barrier, 4
	.text
	.section	.data.initialization_barrier,"aw",@progbits
	.type	initialization_barrier,@object
	.globl	initialization_barrier
	.p2align	2
initialization_barrier:
	.byte	255
	.byte	11
	.byte	11
	.byte	__atomic_bit_barrier_initialization_barrier
	.size	initialization_barrier, 4
	.text

                                        // End of file scope inline assembly
	.file	1 "/mnt/host_cwd/BIM" "dpu/task.c"
	.file	2 "/upmem-sdk-2023.4.0/bin/../share/upmem/include/stdlib" "stdint.h"
	.file	3 "/mnt/host_cwd/BIM" "dpu/../cbthowen/types.h"
	.file	4 "/mnt/host_cwd/BIM" "dpu/../support/common.h"
	.file	5 "/mnt/host_cwd/BIM" "dpu/tinytensor.h"
	.section	.text.counter_start,"ax",@progbits
	.globl	counter_start                   // -- Begin function counter_start
	.type	counter_start,@function
counter_start:                          // @counter_start
.Lfunc_begin0:
	.file	6 "/mnt/host_cwd/BIM" "dpu/../support/cyclecount.h"
	.loc	6 11 0                          // dpu/../support/cyclecount.h:11:0
	.cfi_sections .debug_frame
	.cfi_startproc
// %bb.0:
	//DEBUG_VALUE: counter_start:count <- $r0
	.cfi_def_cfa_offset -16
	.cfi_offset 23, -8
	.cfi_offset 22, -4
	sd r22, 8, d22
	add r22, r22, 16
	.cfi_offset 15, -16
	.cfi_offset 14, -12
	sd r22, -16, d14
	move r14, r0
.Ltmp0:
	//DEBUG_VALUE: counter_start:count <- $r14
	.loc	6 12 20 prologue_end            // dpu/../support/cyclecount.h:12:20
	call r23, perfcounter_get
.Ltmp1:
	.loc	6 12 18 is_stmt 0               // dpu/../support/cyclecount.h:12:18
	sd r14, 0, d0
	.loc	6 13 1 is_stmt 1                // dpu/../support/cyclecount.h:13:1
	ld d14, r22, -16
.Ltmp2:
	ld d22, r22, -8
	jump r23
.Ltmp3:
.Lfunc_end0:
	.size	counter_start, .Lfunc_end0-counter_start
	.cfi_endproc
	.section	.stack_sizes,"o",@progbits,.text.counter_start
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.counter_start,"ax",@progbits
                                        // -- End function
	.section	.text.counter_stop,"ax",@progbits
	.globl	counter_stop                    // -- Begin function counter_stop
	.type	counter_stop,@function
counter_stop:                           // @counter_stop
.Lfunc_begin1:
	.loc	6 15 0                          // dpu/../support/cyclecount.h:15:0
	.cfi_startproc
// %bb.0:
	//DEBUG_VALUE: counter_stop:count <- $r0
	.cfi_def_cfa_offset -16
	.cfi_offset 23, -8
	.cfi_offset 22, -4
	sd r22, 8, d22
	add r22, r22, 16
	.cfi_offset 15, -16
	.cfi_offset 14, -12
	sd r22, -16, d14
	move r14, r0
.Ltmp4:
	//DEBUG_VALUE: counter_stop:count <- $r14
	.loc	6 16 18 prologue_end            // dpu/../support/cyclecount.h:16:18
	call r23, perfcounter_get
.Ltmp5:
	.loc	6 16 16 is_stmt 0               // dpu/../support/cyclecount.h:16:16
	sd r14, 8, d0
	.loc	6 17 19 is_stmt 1               // dpu/../support/cyclecount.h:17:19
	call r23, perfcounter_get
.Ltmp6:
	.loc	6 17 17 is_stmt 0               // dpu/../support/cyclecount.h:17:17
	sd r14, 16, d0
	.loc	6 18 64 is_stmt 1               // dpu/../support/cyclecount.h:18:64
	ld d2, r14, 0
	.loc	6 18 44 is_stmt 0               // dpu/../support/cyclecount.h:18:44
	ld d4, r14, 8
	.loc	6 18 70                         // dpu/../support/cyclecount.h:18:70
	lsrx r6, r2, 4
	lsr_add r7, r6, r3, 4
	lsr r6, r2, 4
	.loc	6 18 93                         // dpu/../support/cyclecount.h:18:93
	lsrx r2, r0, 4
	lsr_add r3, r2, r1, 4
	lsr r2, r0, 4
	lsrx r0, r4, 3
	lsr_add r1, r0, r5, 3
	lsr r0, r4, 3
	and r1, r1, 4294967294
	and r0, r0, 0
	.loc	6 18 99                         // dpu/../support/cyclecount.h:18:99
	add r3, r7, r3
	addc r2, r6, r2
	.loc	6 18 77                         // dpu/../support/cyclecount.h:18:77
	sub r1, r1, r3
	subc r0, r0, r2
	.loc	6 18 123                        // dpu/../support/cyclecount.h:18:123
	lslx r2, r1, 4
	lsl_add r2, r2, r0, 4
	lsl r3, r1, 4
	and r1, r3, 4294967280
	and r0, r2, 15
	.loc	6 18 5                          // dpu/../support/cyclecount.h:18:5
	ld d14, r22, -16
.Ltmp7:
	ld d22, r22, -8
	jump r23
.Ltmp8:
.Lfunc_end1:
	.size	counter_stop, .Lfunc_end1-counter_stop
	.cfi_endproc
	.section	.stack_sizes,"o",@progbits,.text.counter_stop
	.long	.Lfunc_begin1
	.byte	16
	.section	.text.counter_stop,"ax",@progbits
                                        // -- End function
	.section	.text.fused_kernel,"ax",@progbits
	.globl	fused_kernel                    // -- Begin function fused_kernel
	.type	fused_kernel,@function
fused_kernel:                           // @fused_kernel
.Lfunc_begin2:
	.loc	1 108 0 is_stmt 1               // dpu/task.c:108:0
	.cfi_startproc
// %bb.0:
	.cfi_def_cfa_offset -80
	.cfi_offset 23, -8
	.cfi_offset 22, -4
	sd r22, 72, d22
	add r22, r22, 80
	.cfi_offset 15, -56
	.cfi_offset 14, -52
.Ltmp9:
	sd r22, -56, d14
	.cfi_offset 17, -64
	.cfi_offset 16, -60
	sd r22, -64, d16
	.cfi_offset 19, -72
	.cfi_offset 18, -68
	sd r22, -72, d18
	.cfi_offset 21, -80
	.cfi_offset 20, -76
	sd r22, -80, d20
.Ltmp10:
	//DEBUG_VALUE: fused_kernel:tasklet_id <- $r17
	.file	7 "/upmem-sdk-2023.4.0/bin/../share/upmem/include/syslib" "defs.h"
	.loc	7 35 12 prologue_end            // /upmem-sdk-2023.4.0/bin/../share/upmem/include/syslib/defs.h:35:12
	move r17, id, nz, .LBB2_2
.Ltmp11:
// %bb.1:
	.loc	1 111 9                         // dpu/task.c:111:9
	call r23, mem_reset
.Ltmp12:
.LBB2_2:
	.loc	1 120 5                         // dpu/task.c:120:5
	move r0, reset_barrier
	call r23, barrier_wait
.Ltmp13:
	.loc	1 131 48                        // dpu/task.c:131:48
	move r0, DPU_INPUT_ARGUMENTS
	lw r15, r0, 24
.Ltmp14:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	lw r14, r0, 28
.Ltmp15:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	lw r5, r0, 32
.Ltmp16:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 64 32] $r5
	lw r1, r0, 36
.Ltmp17:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 96 32] $r1
	sw r22, -40, r1
.Ltmp18:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	lw r18, r0, 40
.Ltmp19:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 160 32] undef
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	lw r19, r0, 48
.Ltmp20:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	.loc	1 133 51                        // dpu/task.c:133:51
	lw r1, zero, DPU_INPUT_ARGUMENTS
.Ltmp21:
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 0 32] $r1
	lw r2, r0, 4
.Ltmp22:
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 32 32] $r2
	lw r3, r0, 8
.Ltmp23:
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 64 32] $r3
	lw r4, r0, 12
.Ltmp24:
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 96 32] $r4
	sw r22, -28, r4
.Ltmp25:
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	lw r4, r0, 16
.Ltmp26:
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 160 32] undef
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 128 32] $r4
	sw r22, -24, r4
.Ltmp27:
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	.loc	1 135 42                        // dpu/task.c:135:42
	lw r6, r0, 52
.Ltmp28:
	//DEBUG_VALUE: fused_kernel:num_inputs <- $r6
	.loc	1 139 51                        // dpu/task.c:139:51
	move r4, __sys_used_mram_end
.Ltmp29:
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 0 32] $r4
	add r1, r1, r4
.Ltmp30:
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 64 32] $r1
	.loc	1 140 51                        // dpu/task.c:140:51
	add r3, r1, r3
.Ltmp31:
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 32 32] $r3
	.loc	1 141 52                        // dpu/task.c:141:52
	add r1, r3, r2
.Ltmp32:
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 160 32] undef
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 128 32] undef
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 96 32] $r1
	sw r22, -32, r1
.Ltmp33:
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	sw r22, -48, r5
.Ltmp34:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	sw r22, -44, r6
	.loc	1 176 9                         // dpu/task.c:176:9
	jneq r17, 0, .LBB2_13
.Ltmp35:
// %bb.3:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: fused_kernel:num_inputs <- $r6
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 0 32] $r4
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 32 32] $r3
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 32 32] $r2
	sw r22, -12, r3
	sw r22, -20, r17
	.loc	1 0 0 is_stmt 0                 // dpu/task.c:0:0
	lw r0, r0, 44
.Ltmp36:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 160 32] $r0
	sw r22, -16, r0
.Ltmp37:
	//DEBUG_VALUE: wram_alloc_u8:len <- [DW_OP_constu 48, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 16, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	.file	8 "/mnt/host_cwd/BIM" "dpu/tinylib.h"
	.loc	8 76 1 is_stmt 1                // dpu/tinylib.h:76:1
	move r0, r5
	call r23, mem_alloc
.Ltmp38:
	move r20, r0
.Ltmp39:
	//DEBUG_VALUE: thresholds_chunk <- $r20
	.loc	1 178 20                        // dpu/task.c:178:20
	sw zero, thresholds, r20
	.loc	1 181 45                        // dpu/task.c:181:45
	add r1, r14, 1
	move r0, 255
	.loc	1 181 33 is_stmt 0              // dpu/task.c:181:33
	call r23, __udiv32
.Ltmp40:
	.loc	1 0 33                          // dpu/task.c:0:33
	lw r1, r22, -48
	.loc	1 181 33                        // dpu/task.c:181:33
	move r21, r0
.Ltmp41:
	//DEBUG_VALUE: thresh_per_skew <- [DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 8 7, DW_OP_stack_value] $r21
	//DEBUG_VALUE: i <- 0
	.loc	1 182 9 is_stmt 1               // dpu/task.c:182:9
	jeq r1, 0, .LBB2_9
.Ltmp42:
// %bb.4:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 16, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: wram_alloc_u8:len <- [DW_OP_constu 48, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: thresh_per_skew <- [DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 8 7, DW_OP_stack_value] $r21
	//DEBUG_VALUE: thresholds_chunk <- $r20
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: fused_kernel:num_inputs <- $r6
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 0 32] $r4
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 32 32] $r3
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 32 32] $r2
	//DEBUG_VALUE: i <- 0
	.loc	1 0 9 is_stmt 0                 // dpu/task.c:0:9
	move r0, 0, true, .LBB2_5
.Ltmp43:
.LBB2_8:                                //   in Loop: Header=BB2_5 Depth=1
	//DEBUG_VALUE: i <- [DW_OP_constu 36, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 16, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: thresh_per_skew <- [DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 8 7, DW_OP_stack_value] $r21
	//DEBUG_VALUE: thresholds_chunk <- $r20
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: fused_kernel:num_inputs <- $r6
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 0 32] $r4
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 32 32] $r3
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 32 32] $r2
	lw r0, r22, -36
.Ltmp44:
	.loc	1 182 42                        // dpu/task.c:182:42
	add r0, r0, 1
.Ltmp45:
	//DEBUG_VALUE: i <- $r0
	.loc	1 186 30 is_stmt 1              // dpu/task.c:186:30
	add r20, r20, r14
.Ltmp46:
	//DEBUG_VALUE: thresholds_chunk <- $r20
	.loc	1 0 30 is_stmt 0                // dpu/task.c:0:30
	lw r1, r22, -48
.Ltmp47:
	.loc	1 182 9 is_stmt 1               // dpu/task.c:182:9
	jeq r0, r1, .LBB2_9
.Ltmp48:
.LBB2_5:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_7 Depth 2
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 16, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: thresh_per_skew <- [DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 8 7, DW_OP_stack_value] $r21
	//DEBUG_VALUE: thresholds_chunk <- $r20
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: fused_kernel:num_inputs <- $r6
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 0 32] $r4
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 32 32] $r3
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 32 32] $r2
	//DEBUG_VALUE: thresholds_chunk <- $r20
	//DEBUG_VALUE: i <- $r0
	//DEBUG_VALUE: j <- 0
	sw r22, -36, r0
.Ltmp49:
	//DEBUG_VALUE: i <- [DW_OP_constu 36, DW_OP_minus] [$r22+0]
	.loc	1 183 13                        // dpu/task.c:183:13
	jeq r14, 0, .LBB2_8
.Ltmp50:
// %bb.6:                               //   in Loop: Header=BB2_5 Depth=1
	//DEBUG_VALUE: i <- [DW_OP_constu 36, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 16, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: thresh_per_skew <- [DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 8 7, DW_OP_stack_value] $r21
	//DEBUG_VALUE: thresholds_chunk <- $r20
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: fused_kernel:num_inputs <- $r6
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 0 32] $r4
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 32 32] $r3
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 32 32] $r2
	//DEBUG_VALUE: j <- 0
	.loc	1 0 13 is_stmt 0                // dpu/task.c:0:13
	move r16, 0
.Ltmp51:
.LBB2_7:                                //   Parent Loop BB2_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	//DEBUG_VALUE: i <- [DW_OP_constu 36, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 16, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: thresh_per_skew <- [DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 8 7, DW_OP_stack_value] $r21
	//DEBUG_VALUE: thresholds_chunk <- $r20
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: fused_kernel:num_inputs <- $r6
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 0 32] $r4
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 32 32] $r3
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 32 32] $r2
	//DEBUG_VALUE: j <- $r16
	.loc	1 184 42 is_stmt 1              // dpu/task.c:184:42
	add r17, r16, 1
	.loc	1 184 47 is_stmt 0              // dpu/task.c:184:47
	move r0, r17
	move r1, r21
	call r23, __mulsi3
.Ltmp52:
	.loc	1 184 37                        // dpu/task.c:184:37
	add r1, r20, r16
	sb r1, 0, r0
.Ltmp53:
	//DEBUG_VALUE: j <- $r17
	.loc	1 0 37                          // dpu/task.c:0:37
	move r16, r17
.Ltmp54:
	//DEBUG_VALUE: j <- $r16
	jneq r14, r17, .LBB2_7
	jump .LBB2_8
.Ltmp55:
.LBB2_9:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 16, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: thresh_per_skew <- [DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 8 7, DW_OP_stack_value] $r21
	//DEBUG_VALUE: thresholds_chunk <- $r20
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: fused_kernel:num_inputs <- $r6
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 0 32] $r4
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 32 32] $r3
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 32 32] $r2
	//DEBUG_VALUE: wram_alloc_u16:len <- [DW_OP_constu 48, DW_OP_minus] [$r22+0]
	.loc	8 78 1 is_stmt 1                // dpu/tinylib.h:78:1
	lsl r20, r1, 1
.Ltmp56:
	move r0, r20
	call r23, mem_alloc
.Ltmp57:
	.loc	8 0 1 is_stmt 0                 // dpu/tinylib.h:0:1
	lw r3, r22, -48
.Ltmp58:
	.loc	1 190 15 is_stmt 1              // dpu/task.c:190:15
	sw zero, order, r0
	move r21, -1
.Ltmp59:
	//DEBUG_VALUE: mram_read:nb_of_bytes <- $r20
	//DEBUG_VALUE: mram_read:from <- [DW_OP_constu 12, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mram_read:to <- $r0
	//DEBUG_VALUE: mram_read_u16:len <- [DW_OP_constu 48, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mram_read_u16:from <- [DW_OP_constu 12, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mram_read_u16:to <- $r0
	.file	9 "/upmem-sdk-2023.4.0/bin/../share/upmem/include/syslib" "mram.h"
	.loc	9 39 24                         // /upmem-sdk-2023.4.0/bin/../share/upmem/include/syslib/mram.h:39:24
	lsr_add r1, r21, r20, 3
	lsl_add r0, r0, r1, 24
.Ltmp60:
	lw r1, r22, -12
.Ltmp61:
	//DEBUG_VALUE: mram_read:from <- $r1
	//DEBUG_VALUE: mram_read_u16:from <- $r1
	ldma r0, r1, 0
.Ltmp62:
	//DEBUG_VALUE: i <- 0
	.loc	1 194 9                         // dpu/task.c:194:9
	jeq r3, 0, .LBB2_12
.Ltmp63:
// %bb.10:
	//DEBUG_VALUE: mram_read_u16:len <- [DW_OP_constu 48, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: wram_alloc_u16:len <- [DW_OP_constu 48, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 16, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: mram_read:nb_of_bytes <- $r20
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: fused_kernel:num_inputs <- $r6
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 0 32] $r4
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_LLVM_fragment 32 32] $r2
	//DEBUG_VALUE: mram_read_u16:from <- $r1
	//DEBUG_VALUE: mram_read:from <- $r1
	//DEBUG_VALUE: i <- 0
	.loc	1 0 9 is_stmt 0                 // dpu/task.c:0:9
	lw r0, zero, order
	move r1, 0
.Ltmp64:
.LBB2_11:                               // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 16, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: fused_kernel:num_inputs <- $r6
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 0 32] $r4
	//DEBUG_VALUE: i <- $r1
	.loc	1 195 22 is_stmt 1              // dpu/task.c:195:22
	lsl_add r2, r0, r1, 1
	sh r2, 0, r1
.Ltmp65:
	.loc	1 194 42                        // dpu/task.c:194:42
	add r1, r1, 1
.Ltmp66:
	//DEBUG_VALUE: i <- $r1
	.loc	1 194 9 is_stmt 0               // dpu/task.c:194:9
	jneq r3, r1, .LBB2_11
.Ltmp67:
.LBB2_12:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 16, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: fused_kernel:num_inputs <- $r6
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 0 32] $r4
	//DEBUG_VALUE: mat_u16_init:rows <- $r19
	//DEBUG_VALUE: mat_u16_init:cols <- $r18
	.loc	5 57 1 is_stmt 1                // dpu/tinytensor.h:57:1
	sw zero, hash_params, r18
	move r17, hash_params
.Ltmp68:
	//DEBUG_VALUE: mat_u16_init:mat <- $r17
	.loc	1 200 80                        // dpu/task.c:200:80
	move r0, r19
	move r1, r18
	call r23, __mulsi3
.Ltmp69:
	//DEBUG_VALUE: wram_alloc_u16:len <- undef
	//DEBUG_VALUE: mram_read_u16:len <- $r0
	.loc	8 48 1                          // dpu/tinylib.h:48:1
	lsl r16, r0, 1
.Ltmp70:
	//DEBUG_VALUE: mram_read_u16:to <- undef
	//DEBUG_VALUE: mat_u16_init:mat <- $r17
	//DEBUG_VALUE: mat_u16_init:cols <- $r18
	//DEBUG_VALUE: mat_u16_init:rows <- $r19
	.loc	8 78 1                          // dpu/tinylib.h:78:1
	move r0, r16
.Ltmp71:
	call r23, mem_alloc
.Ltmp72:
	.loc	5 57 1                          // dpu/tinytensor.h:57:1
	sw r17, 4, r0
.Ltmp73:
	//DEBUG_VALUE: mram_read:from <- [DW_OP_constu 32, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mram_read:to <- $r0
	//DEBUG_VALUE: mram_read_u16:from <- [DW_OP_constu 32, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mram_read:nb_of_bytes <- $r16
	.loc	9 39 24                         // /upmem-sdk-2023.4.0/bin/../share/upmem/include/syslib/mram.h:39:24
	lsr_add r1, r21, r16, 3
	lsl_add r0, r0, r1, 24
.Ltmp74:
	lw r1, r22, -32
.Ltmp75:
	//DEBUG_VALUE: mram_read:from <- $r1
	//DEBUG_VALUE: mram_read_u16:from <- $r1
	ldma r0, r1, 0
.Ltmp76:
	//DEBUG_VALUE: mram_read:from <- [DW_OP_constu 32, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mram_read_u16:from <- [DW_OP_constu 32, DW_OP_minus] [$r22+0]
	.loc	1 203 64                        // dpu/task.c:203:64
	lw r0, r22, -16
	lsr r0, r0, 3
.Ltmp77:
	//DEBUG_VALUE: mat_u8_init:rows <- [DW_OP_constu 40, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mat_u8_init:cols <- $r0
	.loc	5 58 1                          // dpu/tinytensor.h:58:1
	sw zero, filters, r0
	move r17, filters
.Ltmp78:
	//DEBUG_VALUE: mat_u8_init:mat <- $r17
	lw r1, r22, -40
	call r23, __mulsi3
.Ltmp79:
	move r16, r0
.Ltmp80:
	//DEBUG_VALUE: wram_alloc_u8:len <- $r16
	.loc	8 76 1                          // dpu/tinylib.h:76:1
	call r23, mem_alloc
.Ltmp81:
	.loc	8 0 1 is_stmt 0                 // dpu/tinylib.h:0:1
	lw r5, r22, -48
.Ltmp82:
	.loc	5 58 1 is_stmt 1                // dpu/tinytensor.h:58:1
	sw r17, 4, r0
.Ltmp83:
	//DEBUG_VALUE: mram_read:to <- $r0
	//DEBUG_VALUE: mram_read_u8:to <- $r0
	//DEBUG_VALUE: mram_read:nb_of_bytes <- $r16
	//DEBUG_VALUE: mram_read_u8:len <- $r16
	.loc	9 39 24                         // /upmem-sdk-2023.4.0/bin/../share/upmem/include/syslib/mram.h:39:24
	lsr_add r1, r21, r16, 3
	lsl_add r0, r0, r1, 24
.Ltmp84:
	move r1, __sys_used_mram_end
.Ltmp85:
	//DEBUG_VALUE: mram_read:from <- $r1
	ldma r0, r1, 0
.Ltmp86:
	//DEBUG_VALUE: mram_read_u8:from <- undef
	.loc	9 0 24 is_stmt 0                // /upmem-sdk-2023.4.0/bin/../share/upmem/include/syslib/mram.h:0:24
	lw r17, r22, -20
.Ltmp87:
	lw r6, r22, -44
.Ltmp88:
.LBB2_13:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 0 32] $r4
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 128 32] undef
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 160 32] undef
	//DEBUG_VALUE: wram_alloc_u8:len <- [DW_OP_constu 48, DW_OP_minus] [$r22+0]
	.loc	8 76 1 is_stmt 1                // dpu/tinylib.h:76:1
	move r0, r5
	move r16, r5
	call r23, mem_alloc
.Ltmp89:
	move r20, r0
.Ltmp90:
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: wram_alloc_u8:len <- [DW_OP_constu 48, DW_OP_minus] [$r22+0]
	.loc	8 76 1 is_stmt 0                // dpu/tinylib.h:76:1
	move r0, r16
	call r23, mem_alloc
.Ltmp91:
	move r21, r0
.Ltmp92:
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	.loc	1 236 5 is_stmt 1               // dpu/task.c:236:5
	move r0, initialization_barrier
	call r23, barrier_wait
.Ltmp93:
	.loc	1 0 5 is_stmt 0                 // dpu/task.c:0:5
	lw r0, r22, -44
.Ltmp94:
	//DEBUG_VALUE: sample_it <- $r17
	.loc	1 239 5 is_stmt 1               // dpu/task.c:239:5
	jgeu r17, r0, .LBB2_39
.Ltmp95:
// %bb.14:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 0 32] $r4
	.loc	1 0 0 is_stmt 0                 // dpu/task.c:0:0
	lw r1, r22, -28
	lw r2, r22, -32
	add r1, r2, r1
.Ltmp96:
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 128 32] $r1
	sw r22, -36, r1
.Ltmp97:
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	lw r2, r22, -24
	add r1, r1, r2
.Ltmp98:
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_LLVM_fragment 160 32] $r1
	sw r22, -32, r1
.Ltmp99:
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	.loc	1 239 5                         // dpu/task.c:239:5
	lsl r16, r19, 1, true, .LBB2_15
.Ltmp100:
.LBB2_38:                               //   in Loop: Header=BB2_15 Depth=1
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	.loc	1 317 31 is_stmt 1              // dpu/task.c:317:31
	lw r0, r22, -32
	add r0, r0, r17
	move r1, -1
.Ltmp101:
	//DEBUG_VALUE: mram_write:nb_of_bytes <- [DW_OP_constu 40, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mram_write:to <- $r0
	//DEBUG_VALUE: mram_write:from <- $r21
	//DEBUG_VALUE: mram_write_u8:len <- [DW_OP_constu 40, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mram_write_u8:from <- $r21
	//DEBUG_VALUE: mram_write_u8:to <- $r0
	.loc	9 61 24                         // /upmem-sdk-2023.4.0/bin/../share/upmem/include/syslib/mram.h:61:24
	lsr_add r1, r1, r11, 3
	lsl_add r1, r21, r1, 24
.Ltmp102:
	.loc	1 239 71                        // dpu/task.c:239:71
	add r17, r17, 11
.Ltmp103:
	//DEBUG_VALUE: sample_it <- $r17
	.loc	9 61 24                         // /upmem-sdk-2023.4.0/bin/../share/upmem/include/syslib/mram.h:61:24
	sdma r1, r0, 0
	//DEBUG_VALUE: mram_write:nb_of_bytes <- [DW_OP_constu 40, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mram_write:to <- $r0
	//DEBUG_VALUE: mram_write:from <- $r21
	//DEBUG_VALUE: mram_write_u8:len <- [DW_OP_constu 40, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: mram_write_u8:from <- $r21
	//DEBUG_VALUE: mram_write_u8:to <- $r0
	lw r0, r22, -44
.Ltmp104:
	.loc	1 239 5                         // dpu/task.c:239:5
	jgeu r17, r0, .LBB2_39
.Ltmp105:
.LBB2_15:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_16 Depth 2
                                        //       Child Loop BB2_18 Depth 3
                                        //     Child Loop BB2_22 Depth 2
                                        //     Child Loop BB2_25 Depth 2
                                        //       Child Loop BB2_27 Depth 3
                                        //         Child Loop BB2_29 Depth 4
                                        //     Child Loop BB2_34 Depth 2
                                        //       Child Loop BB2_36 Depth 3
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: sample_it <- $r17
	.loc	1 244 55                        // dpu/task.c:244:55
	move r0, r17
	move r1, r15
	call r23, __mulsi3
.Ltmp106:
	.loc	1 244 43 is_stmt 0              // dpu/task.c:244:43
	lw r1, r22, -36
	add r0, r0, r1
.Ltmp107:
	//DEBUG_VALUE: input_addr <- $r0
	.loc	1 0 43                          // dpu/task.c:0:43
	move r1, -1
.Ltmp108:
	//DEBUG_VALUE: mram_read:nb_of_bytes <- $r15
	//DEBUG_VALUE: mram_read:to <- $r21
	//DEBUG_VALUE: mram_read:from <- $r0
	//DEBUG_VALUE: mram_read_u8:len <- $r15
	//DEBUG_VALUE: mram_read_u8:to <- $r21
	//DEBUG_VALUE: mram_read_u8:from <- $r0
	.loc	9 39 24 is_stmt 1               // /upmem-sdk-2023.4.0/bin/../share/upmem/include/syslib/mram.h:39:24
	lsr_add r1, r1, r15, 3
	lsl_add r1, r21, r1, 24
	ldma r1, r0, 0
.Ltmp109:
	.loc	1 250 13                        // dpu/task.c:250:13
	lw r0, zero, thresholds
.Ltmp110:
	//DEBUG_VALUE: it <- 0
	//DEBUG_VALUE: encode_buffer:len <- $r15
	//DEBUG_VALUE: encode_buffer:num_bits <- $r14
	//DEBUG_VALUE: encode_buffer:output <- $r20
	//DEBUG_VALUE: encode_buffer:input <- $r21
	//DEBUG_VALUE: encode_buffer:thresholds <- $r0
	//DEBUG_VALUE: encode_buffer:thresholds_chunk <- $r0
	.loc	1 0 13 is_stmt 0                // dpu/task.c:0:13
	move r1, 0, true, .LBB2_16
.Ltmp111:
.LBB2_19:                               //   in Loop: Header=BB2_16 Depth=2
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: encode_buffer:input <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: encode_buffer:output <- $r20
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: encode_buffer:len <- $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: encode_buffer:num_bits <- $r14
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: it <- $r1
	//DEBUG_VALUE: encode_buffer:thresholds_chunk <- $r0
	.loc	1 58 31 is_stmt 1               // dpu/task.c:58:31
	add r1, r1, 1
.Ltmp112:
	//DEBUG_VALUE: it <- $r1
	.loc	1 65 26                         // dpu/task.c:65:26
	add r0, r0, r14
.Ltmp113:
	//DEBUG_VALUE: encode_buffer:thresholds_chunk <- $r0
	.loc	1 58 5                          // dpu/task.c:58:5
	jeq r1, r15, .LBB2_20
.Ltmp114:
.LBB2_16:                               //   Parent Loop BB2_15 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB2_18 Depth 3
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: encode_buffer:input <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: encode_buffer:output <- $r20
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: encode_buffer:len <- $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: encode_buffer:num_bits <- $r14
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: encode_buffer:thresholds_chunk <- $r0
	//DEBUG_VALUE: encode_buffer:thresholds_chunk <- $r0
	//DEBUG_VALUE: it <- $r1
	//DEBUG_VALUE: input_el <- undef
	//DEBUG_VALUE: output_ptr <- undef
	//DEBUG_VALUE: bit_it <- 0
	.loc	1 61 9                          // dpu/task.c:61:9
	jeq r14, 0, .LBB2_19
.Ltmp115:
// %bb.17:                              //   in Loop: Header=BB2_16 Depth=2
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: encode_buffer:input <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: encode_buffer:output <- $r20
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: encode_buffer:len <- $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: encode_buffer:num_bits <- $r14
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: it <- $r1
	//DEBUG_VALUE: encode_buffer:thresholds_chunk <- $r0
	.loc	1 0 0 is_stmt 0                 // dpu/task.c:0:0
	add r2, r21, r1
	lbs r2, r2, 0
	.loc	1 60 33 is_stmt 1               // dpu/task.c:60:33
	add r3, r20, r1
.Ltmp116:
	//DEBUG_VALUE: output_ptr <- $r3
	.loc	1 0 33 is_stmt 0                // dpu/task.c:0:33
	move r4, 0
.Ltmp117:
.LBB2_18:                               //   Parent Loop BB2_15 Depth=1
                                        //     Parent Loop BB2_16 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: encode_buffer:input <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: encode_buffer:output <- $r20
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: encode_buffer:len <- $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: encode_buffer:num_bits <- $r14
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: output_ptr <- $r3
	//DEBUG_VALUE: it <- $r1
	//DEBUG_VALUE: encode_buffer:thresholds_chunk <- $r0
	//DEBUG_VALUE: output_ptr <- $r3
	//DEBUG_VALUE: bit_it <- $r4
	.loc	1 62 38 is_stmt 1               // dpu/task.c:62:38
	add r5, r0, r4
	lbu r5, r5, 0
	.loc	1 62 36 is_stmt 0               // dpu/task.c:62:36
	and r6, r2, 255
	sub r5, r6, r5, gtu
	.loc	1 62 25                         // dpu/task.c:62:25
	sb r3, 0, r5
.Ltmp118:
	.loc	1 61 48 is_stmt 1               // dpu/task.c:61:48
	add r4, r4, 1
.Ltmp119:
	//DEBUG_VALUE: bit_it <- $r4
	.loc	1 63 24                         // dpu/task.c:63:24
	add r3, r3, r15
.Ltmp120:
	//DEBUG_VALUE: output_ptr <- $r3
	.loc	1 61 9                          // dpu/task.c:61:9
	jneq r14, r4, .LBB2_18
	jump .LBB2_19
.Ltmp121:
.LBB2_20:                               //   in Loop: Header=BB2_15 Depth=1
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: reorder:order <- undef
	//DEBUG_VALUE: reorder:input <- $r20
	//DEBUG_VALUE: reorder:output <- $r21
	//DEBUG_VALUE: reorder:len <- [DW_OP_constu 48, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: it <- 0
	.loc	1 0 9 is_stmt 0                 // dpu/task.c:0:9
	lw r2, r22, -48
	lw r11, r22, -40
.Ltmp122:
	.loc	1 71 5 is_stmt 1                // dpu/task.c:71:5
	jeq r2, 0, .LBB2_23
.Ltmp123:
// %bb.21:                              //   in Loop: Header=BB2_15 Depth=1
	//DEBUG_VALUE: reorder:len <- [DW_OP_constu 48, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: reorder:output <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: reorder:input <- $r20
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: it <- 0
	.loc	1 0 5 is_stmt 0                 // dpu/task.c:0:5
	lw r0, zero, order
.Ltmp124:
	//DEBUG_VALUE: reorder:order <- $r0
	move r1, r21
.Ltmp125:
.LBB2_22:                               //   Parent Loop BB2_15 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	//DEBUG_VALUE: reorder:len <- [DW_OP_constu 48, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: reorder:output <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: reorder:input <- $r20
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: it <- undef
	.loc	1 72 28 is_stmt 1               // dpu/task.c:72:28
	lhu r3, r0, 0
	.loc	1 72 22 is_stmt 0               // dpu/task.c:72:22
	add r3, r20, r3
	lbs r3, r3, 0
	.loc	1 72 20                         // dpu/task.c:72:20
	sb r1, 0, r3
.Ltmp126:
	//DEBUG_VALUE: it <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	.loc	1 71 24 is_stmt 1               // dpu/task.c:71:24
	add r1, r1, 1
	add r0, r0, 2
	add r2, r2, -1, nz, .LBB2_22
.Ltmp127:
.LBB2_23:                               //   in Loop: Header=BB2_15 Depth=1
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: hash_ptr <- $r20
	//DEBUG_VALUE: input_chunk <- $r21
	//DEBUG_VALUE: filter_it <- 0
	.loc	1 273 9                         // dpu/task.c:273:9
	jeq r11, 0, .LBB2_38
.Ltmp128:
// %bb.24:                              //   in Loop: Header=BB2_15 Depth=1
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: input_chunk <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: hash_ptr <- $r20
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: filter_it <- 0
	.loc	1 0 9 is_stmt 0                 // dpu/task.c:0:9
	lw r1, zero, hash_params
	move r0, hash_params
	lw r0, r0, 4
	.loc	1 273 9                         // dpu/task.c:273:9
	lsl r1, r1, 1
	move r2, 0
	move r3, r21
	move r4, r20, true, .LBB2_25
.Ltmp129:
.LBB2_31:                               //   in Loop: Header=BB2_25 Depth=2
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: hash_ptr <- $r4
	//DEBUG_VALUE: input_chunk <- $r3
	//DEBUG_VALUE: filter_it <- $r2
	.loc	1 289 25 is_stmt 1              // dpu/task.c:289:25
	add r3, r3, r18
.Ltmp130:
	//DEBUG_VALUE: input_chunk <- $r3
	.loc	1 273 59                        // dpu/task.c:273:59
	add r2, r2, 1
.Ltmp131:
	//DEBUG_VALUE: filter_it <- $r2
	.loc	1 290 22                        // dpu/task.c:290:22
	add r4, r4, 2
.Ltmp132:
	//DEBUG_VALUE: hash_ptr <- $r4
	.loc	1 273 9                         // dpu/task.c:273:9
	jeq r2, r11, .LBB2_32
.Ltmp133:
.LBB2_25:                               //   Parent Loop BB2_15 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB2_27 Depth 3
                                        //         Child Loop BB2_29 Depth 4
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: hash_ptr <- $r4
	//DEBUG_VALUE: input_chunk <- $r3
	//DEBUG_VALUE: filter_it <- $r2
	//DEBUG_VALUE: hash_param_row <- $r0
	//DEBUG_VALUE: hash_it <- 0
	.loc	1 0 9 is_stmt 0                 // dpu/task.c:0:9
	jeq r19, 0, .LBB2_31
.Ltmp134:
// %bb.26:                              //   in Loop: Header=BB2_25 Depth=2
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: hash_ptr <- $r4
	//DEBUG_VALUE: input_chunk <- $r3
	//DEBUG_VALUE: filter_it <- $r2
	//DEBUG_VALUE: hash_param_row <- $r0
	//DEBUG_VALUE: hash_it <- 0
	move r5, 0
	move r6, r0, true, .LBB2_27
.Ltmp135:
.LBB2_30:                               //   in Loop: Header=BB2_27 Depth=3
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: h3_hash:len <- $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: h3_hash:result <- $r7
	//DEBUG_VALUE: h3_hash:params <- $r6
	//DEBUG_VALUE: hash_param_row <- $r6
	//DEBUG_VALUE: hash_it <- $r5
	//DEBUG_VALUE: h3_hash:output <- $r4
	//DEBUG_VALUE: hash_ptr <- $r4
	//DEBUG_VALUE: h3_hash:input <- $r3
	//DEBUG_VALUE: input_chunk <- $r3
	//DEBUG_VALUE: filter_it <- $r2
	.loc	1 87 13 is_stmt 1               // dpu/task.c:87:13
	sh r4, 0, r7
.Ltmp136:
	.loc	1 286 26                        // dpu/task.c:286:26
	add r4, r4, 2
.Ltmp137:
	//DEBUG_VALUE: hash_ptr <- $r4
	.loc	1 279 61                        // dpu/task.c:279:61
	add r5, r5, 1
.Ltmp138:
	//DEBUG_VALUE: hash_it <- $r5
	.loc	1 279 13 is_stmt 0              // dpu/task.c:279:13
	add r6, r6, r1
.Ltmp139:
	//DEBUG_VALUE: hash_param_row <- $r6
	.loc	1 0 13                          // dpu/task.c:0:13
	jeq r5, r19, .LBB2_31
.Ltmp140:
.LBB2_27:                               //   Parent Loop BB2_15 Depth=1
                                        //     Parent Loop BB2_25 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB2_29 Depth 4
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: hash_ptr <- $r4
	//DEBUG_VALUE: input_chunk <- $r3
	//DEBUG_VALUE: filter_it <- $r2
	//DEBUG_VALUE: hash_ptr <- $r4
	//DEBUG_VALUE: hash_param_row <- $r6
	//DEBUG_VALUE: hash_it <- $r5
	//DEBUG_VALUE: h3_hash:input <- $r3
	//DEBUG_VALUE: h3_hash:output <- $r4
	//DEBUG_VALUE: h3_hash:params <- $r6
	//DEBUG_VALUE: h3_hash:len <- $r18
	.loc	1 79 18 is_stmt 1               // dpu/task.c:79:18
	lhu r7, r6, 0
	.loc	1 79 31 is_stmt 0               // dpu/task.c:79:31
	lbu r8, r3, 0
	.loc	1 79 28                         // dpu/task.c:79:28
	and r7, r8, r7
	//DEBUG_VALUE: i <- 1
.Ltmp141:
	//DEBUG_VALUE: h3_hash:result <- $r7
	.loc	1 0 28                          // dpu/task.c:0:28
	jltu r18, 2, .LBB2_30
.Ltmp142:
// %bb.28:                              //   in Loop: Header=BB2_27 Depth=3
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: h3_hash:len <- $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: h3_hash:result <- $r7
	//DEBUG_VALUE: h3_hash:params <- $r6
	//DEBUG_VALUE: hash_param_row <- $r6
	//DEBUG_VALUE: hash_it <- $r5
	//DEBUG_VALUE: h3_hash:output <- $r4
	//DEBUG_VALUE: hash_ptr <- $r4
	//DEBUG_VALUE: h3_hash:input <- $r3
	//DEBUG_VALUE: input_chunk <- $r3
	//DEBUG_VALUE: filter_it <- $r2
	//DEBUG_VALUE: i <- 1
	move r8, 1
.Ltmp143:
.LBB2_29:                               //   Parent Loop BB2_15 Depth=1
                                        //     Parent Loop BB2_25 Depth=2
                                        //       Parent Loop BB2_27 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: h3_hash:len <- $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: h3_hash:result <- $r7
	//DEBUG_VALUE: h3_hash:params <- $r6
	//DEBUG_VALUE: hash_param_row <- $r6
	//DEBUG_VALUE: hash_it <- $r5
	//DEBUG_VALUE: h3_hash:output <- $r4
	//DEBUG_VALUE: hash_ptr <- $r4
	//DEBUG_VALUE: h3_hash:input <- $r3
	//DEBUG_VALUE: input_chunk <- $r3
	//DEBUG_VALUE: filter_it <- $r2
	//DEBUG_VALUE: h3_hash:result <- $r7
	//DEBUG_VALUE: i <- $r8
	.loc	1 83 19 is_stmt 1               // dpu/task.c:83:19
	lsl_add r9, r6, r8, 1
	lhu r9, r9, 0
	.loc	1 83 32 is_stmt 0               // dpu/task.c:83:32
	add r10, r3, r8
	lbu r10, r10, 0
	.loc	1 83 29                         // dpu/task.c:83:29
	and r9, r10, r9
.Ltmp144:
	.loc	1 81 29 is_stmt 1               // dpu/task.c:81:29
	add r8, r8, 1
.Ltmp145:
	//DEBUG_VALUE: i <- $r8
	.loc	1 83 16                         // dpu/task.c:83:16
	xor r7, r9, r7
.Ltmp146:
	//DEBUG_VALUE: h3_hash:result <- $r7
	.loc	1 0 16 is_stmt 0                // dpu/task.c:0:16
	jneq r18, r8, .LBB2_29
	jump .LBB2_30
.Ltmp147:
.LBB2_32:                               //   in Loop: Header=BB2_15 Depth=1
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: hash_ptr <- $r4
	//DEBUG_VALUE: input_chunk <- $r3
	//DEBUG_VALUE: hash_ptr <- $r20
	//DEBUG_VALUE: filter_ptr <- undef
	//DEBUG_VALUE: filter_it <- 0
	.loc	1 305 9 is_stmt 1               // dpu/task.c:305:9
	jeq r11, 0, .LBB2_38
.Ltmp148:
// %bb.33:                              //   in Loop: Header=BB2_15 Depth=1
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: hash_ptr <- $r20
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: input_chunk <- $r3
	.loc	1 304 34                        // dpu/task.c:304:34
	move r0, filters
	lw r0, r0, 4
.Ltmp149:
	//DEBUG_VALUE: filter_ptr <- $r0
	.loc	1 0 34 is_stmt 0                // dpu/task.c:0:34
	move r1, 0
	move r2, r20, true, .LBB2_34
.Ltmp150:
.LBB2_37:                               //   in Loop: Header=BB2_34 Depth=2
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: hash_ptr <- $r2
	//DEBUG_VALUE: filter_it <- $r1
	//DEBUG_VALUE: filter_ptr <- $r0
	.loc	1 306 13 is_stmt 1              // dpu/task.c:306:13
	add r4, r21, r1
	.loc	1 306 42 is_stmt 0              // dpu/task.c:306:42
	sb r4, 0, r3
	.loc	1 312 35 is_stmt 1              // dpu/task.c:312:35
	lw r3, zero, filters
.Ltmp151:
	.loc	1 305 9                         // dpu/task.c:305:9
	add r2, r2, r16
.Ltmp152:
	//DEBUG_VALUE: hash_ptr <- $r2
	.loc	1 305 59 is_stmt 0              // dpu/task.c:305:59
	add r1, r1, 1
.Ltmp153:
	//DEBUG_VALUE: filter_it <- $r1
	.loc	1 312 24 is_stmt 1              // dpu/task.c:312:24
	add r0, r0, r3
.Ltmp154:
	//DEBUG_VALUE: filter_ptr <- $r0
	.loc	1 305 9                         // dpu/task.c:305:9
	jeq r1, r11, .LBB2_38
.Ltmp155:
.LBB2_34:                               //   Parent Loop BB2_15 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB2_36 Depth 3
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: filter_ptr <- $r0
	//DEBUG_VALUE: hash_ptr <- $r2
	//DEBUG_VALUE: filter_ptr <- $r0
	//DEBUG_VALUE: filter_it <- $r1
	//DEBUG_VALUE: and_reduce:input <- $r2
	//DEBUG_VALUE: and_reduce:lookup_table <- $r0
	//DEBUG_VALUE: and_reduce:len <- $r19
	.loc	1 92 39                         // dpu/task.c:92:39
	lhu r3, r2, 0
.Ltmp156:
	//DEBUG_VALUE: get_bit:byte <- undef
	//DEBUG_VALUE: get_bit:data <- $r0
	//DEBUG_VALUE: get_bit:index <- [DW_OP_LLVM_convert 16 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $r3
	.loc	1 50 13                         // dpu/task.c:50:13
	lsr_add r4, r0, r3, 3
	lbu r4, r4, 0
	.loc	1 48 21                         // dpu/task.c:48:21
	and r3, r3, 7
.Ltmp157:
	//DEBUG_VALUE: get_bit:bit <- [DW_OP_LLVM_convert 16 7, DW_OP_LLVM_convert 32 7, DW_OP_constu 7, DW_OP_and, DW_OP_stack_value] undef
	.loc	1 50 24                         // dpu/task.c:50:24
	lsr r3, r4, r3
	.loc	1 50 12 is_stmt 0               // dpu/task.c:50:12
	and r3, r3, 1
	//DEBUG_VALUE: i <- 1
.Ltmp158:
	//DEBUG_VALUE: and_reduce:result <- undef
	.loc	1 0 12                          // dpu/task.c:0:12
	jltu r19, 2, .LBB2_37
.Ltmp159:
// %bb.35:                              //   in Loop: Header=BB2_34 Depth=2
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: and_reduce:len <- $r19
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: and_reduce:input <- $r2
	//DEBUG_VALUE: hash_ptr <- $r2
	//DEBUG_VALUE: filter_it <- $r1
	//DEBUG_VALUE: get_bit:data <- $r0
	//DEBUG_VALUE: and_reduce:lookup_table <- $r0
	//DEBUG_VALUE: filter_ptr <- $r0
	//DEBUG_VALUE: i <- 1
	move r4, 1
.Ltmp160:
.LBB2_36:                               //   Parent Loop BB2_15 Depth=1
                                        //     Parent Loop BB2_34 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 160 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 36, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: and_reduce:len <- $r19
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: sample_it <- $r17
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	//DEBUG_VALUE: and_reduce:input <- $r2
	//DEBUG_VALUE: hash_ptr <- $r2
	//DEBUG_VALUE: filter_it <- $r1
	//DEBUG_VALUE: and_reduce:lookup_table <- $r0
	//DEBUG_VALUE: filter_ptr <- $r0
	//DEBUG_VALUE: and_reduce:result <- $r3
	//DEBUG_VALUE: i <- $r4
	.loc	1 94 41 is_stmt 1               // dpu/task.c:94:41
	lsl_add r5, r2, r4, 1
	lhu r5, r5, 0
.Ltmp161:
	//DEBUG_VALUE: get_bit:byte <- undef
	//DEBUG_VALUE: get_bit:data <- $r0
	//DEBUG_VALUE: get_bit:index <- [DW_OP_LLVM_convert 16 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $r5
	.loc	1 50 13                         // dpu/task.c:50:13
	lsr_add r6, r0, r5, 3
	lbu r6, r6, 0
	.loc	1 48 21                         // dpu/task.c:48:21
	and r5, r5, 7
.Ltmp162:
	//DEBUG_VALUE: get_bit:bit <- [DW_OP_LLVM_convert 16 7, DW_OP_LLVM_convert 32 7, DW_OP_constu 7, DW_OP_and, DW_OP_stack_value] undef
	.loc	1 50 24                         // dpu/task.c:50:24
	lsr r5, r6, r5
.Ltmp163:
	.loc	1 93 29                         // dpu/task.c:93:29
	add r4, r4, 1
.Ltmp164:
	//DEBUG_VALUE: i <- $r4
	.loc	1 94 16                         // dpu/task.c:94:16
	and r3, r3, r5
.Ltmp165:
	//DEBUG_VALUE: and_reduce:result <- $r3
	.loc	1 0 16 is_stmt 0                // dpu/task.c:0:16
	jneq r19, r4, .LBB2_36
	jump .LBB2_37
.Ltmp166:
.LBB2_39:
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 48, DW_OP_minus, DW_OP_LLVM_fragment 64 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:addresses <- [DW_OP_constu 32, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 24, DW_OP_minus, DW_OP_LLVM_fragment 128 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:size_bytes <- [DW_OP_constu 28, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_constu 40, DW_OP_minus, DW_OP_LLVM_fragment 96 32] [$r22+0]
	//DEBUG_VALUE: fused_kernel:pbuffer2 <- $r21
	//DEBUG_VALUE: fused_kernel:input <- $r21
	//DEBUG_VALUE: fused_kernel:reordered <- $r21
	//DEBUG_VALUE: fused_kernel:filter_reductions <- $r21
	//DEBUG_VALUE: fused_kernel:pbuffer1 <- $r20
	//DEBUG_VALUE: fused_kernel:encoded <- $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 32 32] $r20
	//DEBUG_VALUE: fused_kernel:hashes <- [DW_OP_LLVM_fragment 0 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 192 32] $r19
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 128 32] $r18
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 0 32] $r15
	//DEBUG_VALUE: fused_kernel:p <- [DW_OP_LLVM_fragment 32 32] $r14
	move r0, 0
	.loc	1 329 5 is_stmt 1               // dpu/task.c:329:5
	ld d20, r22, -80
.Ltmp167:
	ld d18, r22, -72
.Ltmp168:
	ld d16, r22, -64
	ld d14, r22, -56
.Ltmp169:
	ld d22, r22, -8
.Ltmp170:
	jump r23
.Ltmp171:
.Lfunc_end2:
	.size	fused_kernel, .Lfunc_end2-fused_kernel
	.cfi_endproc
	.file	10 "/upmem-sdk-2023.4.0/bin/../share/upmem/include/syslib" "sysdef.h"
	.section	.stack_sizes,"o",@progbits,.text.fused_kernel
	.long	.Lfunc_begin2
	.byte	80
	.section	.text.fused_kernel,"ax",@progbits
                                        // -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin3:
	.loc	1 102 0                         // dpu/task.c:102:0
	.cfi_startproc
// %bb.0:
	.cfi_def_cfa_offset -8
	.cfi_offset 23, -8
	.cfi_offset 22, -4
	sd r22, 0, d22
	add r22, r22, 8
.Ltmp172:
	.loc	1 104 12 prologue_end           // dpu/task.c:104:12
	call r23, fused_kernel
.Ltmp173:
	.loc	1 0 12 is_stmt 0                // dpu/task.c:0:12
	move r0, 0
	.loc	1 104 5                         // dpu/task.c:104:5
	ld d22, r22, -8
	jump r23
.Ltmp174:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin3
	.byte	8
	.section	.text.main,"ax",@progbits
                                        // -- End function
	.type	kernels,@object                 // @kernels
	.section	.data.kernels,"aw",@progbits
	.globl	kernels
	.p2align	2
kernels:
	.long	fused_kernel
	.size	kernels, 4

	.type	DPU_INPUT_ARGUMENTS,@object     // @DPU_INPUT_ARGUMENTS
	.section	.dpu_host,"aw",@progbits
	.globl	DPU_INPUT_ARGUMENTS
	.p2align	3
DPU_INPUT_ARGUMENTS:
	.zero	60
	.size	DPU_INPUT_ARGUMENTS, 60

	.type	thresholds,@object              // @thresholds
	.section	.bss.thresholds,"aw",@nobits
	.globl	thresholds
	.p2align	2
thresholds:
	.long	0
	.size	thresholds, 4

	.type	order,@object                   // @order
	.section	.bss.order,"aw",@nobits
	.globl	order
	.p2align	2
order:
	.long	0
	.size	order, 4

	.type	hash_params,@object             // @hash_params
	.section	.bss.hash_params,"aw",@nobits
	.globl	hash_params
	.p2align	2
hash_params:
	.zero	8
	.size	hash_params, 8

	.type	filters,@object                 // @filters
	.section	.bss.filters,"aw",@nobits
	.globl	filters
	.p2align	2
filters:
	.zero	8
	.size	filters, 8

	.type	DPU_RESULTS,@object             // @DPU_RESULTS
	.section	.dpu_host,"aw",@progbits
	.globl	DPU_RESULTS
	.p2align	3
DPU_RESULTS:
	.zero	88
	.size	DPU_RESULTS, 88

	.type	__atomic_bit_barrier_reset_barrier,@object // @__atomic_bit_barrier_reset_barrier
	.section	.atomic,"aw",@progbits
	.globl	__atomic_bit_barrier_reset_barrier
__atomic_bit_barrier_reset_barrier:
	.byte	0                               // 0x0
	.size	__atomic_bit_barrier_reset_barrier, 1

	.type	__atomic_bit_barrier_initialization_barrier,@object // @__atomic_bit_barrier_initialization_barrier
	.globl	__atomic_bit_barrier_initialization_barrier
__atomic_bit_barrier_initialization_barrier:
	.byte	0                               // 0x0
	.size	__atomic_bit_barrier_initialization_barrier, 1

	.file	11 "/upmem-sdk-2023.4.0/bin/../share/upmem/include/syslib" "perfcounter.h"
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.long	-1
	.long	.Lfunc_begin0                   //   base address
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp0-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp0-.Lfunc_begin0
	.long	.Ltmp2-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	94                              // DW_OP_reg14
	.long	0
	.long	0
.Ldebug_loc1:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Lfunc_begin1-.Lfunc_begin1
	.long	.Ltmp4-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp4-.Lfunc_begin1
	.long	.Ltmp7-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	94                              // DW_OP_reg14
	.long	0
	.long	0
.Ldebug_loc2:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp10-.Lfunc_begin2
	.long	.Ltmp11-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	0
	.long	0
.Ldebug_loc3:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp14-.Lfunc_begin2
	.long	.Ltmp15-.Lfunc_begin2
	.short	3                               // Loc expr size
	.byte	95                              // DW_OP_reg15
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp15-.Lfunc_begin2
	.long	.Ltmp16-.Lfunc_begin2
	.short	6                               // Loc expr size
	.byte	95                              // DW_OP_reg15
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	94                              // DW_OP_reg14
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp16-.Lfunc_begin2
	.long	.Ltmp17-.Lfunc_begin2
	.short	9                               // Loc expr size
	.byte	95                              // DW_OP_reg15
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	94                              // DW_OP_reg14
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	85                              // DW_OP_reg5
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp17-.Lfunc_begin2
	.long	.Ltmp18-.Lfunc_begin2
	.short	12                              // Loc expr size
	.byte	95                              // DW_OP_reg15
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	94                              // DW_OP_reg14
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	85                              // DW_OP_reg5
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	81                              // DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp18-.Lfunc_begin2
	.long	.Ltmp19-.Lfunc_begin2
	.short	13                              // Loc expr size
	.byte	95                              // DW_OP_reg15
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	94                              // DW_OP_reg14
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	85                              // DW_OP_reg5
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	88                              // -40
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp19-.Lfunc_begin2
	.long	.Ltmp20-.Lfunc_begin2
	.short	16                              // Loc expr size
	.byte	95                              // DW_OP_reg15
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	94                              // DW_OP_reg14
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	85                              // DW_OP_reg5
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	88                              // -40
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	98                              // DW_OP_reg18
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp20-.Lfunc_begin2
	.long	.Ltmp34-.Lfunc_begin2
	.short	21                              // Loc expr size
	.byte	95                              // DW_OP_reg15
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	94                              // DW_OP_reg14
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	85                              // DW_OP_reg5
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	88                              // -40
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	98                              // DW_OP_reg18
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	99                              // DW_OP_reg19
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp34-.Lfunc_begin2
	.long	.Ltmp36-.Lfunc_begin2
	.short	22                              // Loc expr size
	.byte	95                              // DW_OP_reg15
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	94                              // DW_OP_reg14
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	80                              // -48
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	88                              // -40
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	98                              // DW_OP_reg18
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	99                              // DW_OP_reg19
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp36-.Lfunc_begin2
	.long	.Ltmp37-.Lfunc_begin2
	.short	23                              // Loc expr size
	.byte	95                              // DW_OP_reg15
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	94                              // DW_OP_reg14
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	80                              // -48
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	88                              // -40
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	98                              // DW_OP_reg18
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	80                              // DW_OP_reg0
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	99                              // DW_OP_reg19
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp37-.Lfunc_begin2
	.long	.Ltmp88-.Lfunc_begin2
	.short	24                              // Loc expr size
	.byte	95                              // DW_OP_reg15
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	94                              // DW_OP_reg14
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	80                              // -48
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	88                              // -40
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	98                              // DW_OP_reg18
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	112                             // -16
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	99                              // DW_OP_reg19
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp88-.Lfunc_begin2
	.long	.Ltmp168-.Lfunc_begin2
	.short	22                              // Loc expr size
	.byte	95                              // DW_OP_reg15
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	94                              // DW_OP_reg14
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	80                              // -48
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	88                              // -40
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	98                              // DW_OP_reg18
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	99                              // DW_OP_reg19
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp168-.Lfunc_begin2
	.long	.Ltmp169-.Lfunc_begin2
	.short	14                              // Loc expr size
	.byte	95                              // DW_OP_reg15
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	94                              // DW_OP_reg14
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	80                              // -48
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	88                              // -40
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp169-.Lfunc_begin2
	.long	.Ltmp170-.Lfunc_begin2
	.short	10                              // Loc expr size
	.byte	147                             // DW_OP_piece
	.byte	8                               // 8
	.byte	134                             // DW_OP_breg22
	.byte	80                              // -48
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	88                              // -40
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	0
	.long	0
.Ldebug_loc4:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp21-.Lfunc_begin2
	.long	.Ltmp22-.Lfunc_begin2
	.short	3                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp22-.Lfunc_begin2
	.long	.Ltmp23-.Lfunc_begin2
	.short	6                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	82                              // DW_OP_reg2
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp23-.Lfunc_begin2
	.long	.Ltmp24-.Lfunc_begin2
	.short	9                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	82                              // DW_OP_reg2
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	83                              // DW_OP_reg3
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp24-.Lfunc_begin2
	.long	.Ltmp25-.Lfunc_begin2
	.short	12                              // Loc expr size
	.byte	81                              // DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	82                              // DW_OP_reg2
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	83                              // DW_OP_reg3
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	84                              // DW_OP_reg4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp25-.Lfunc_begin2
	.long	.Ltmp26-.Lfunc_begin2
	.short	13                              // Loc expr size
	.byte	81                              // DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	82                              // DW_OP_reg2
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	83                              // DW_OP_reg3
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	100                             // -28
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp26-.Lfunc_begin2
	.long	.Ltmp27-.Lfunc_begin2
	.short	16                              // Loc expr size
	.byte	81                              // DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	82                              // DW_OP_reg2
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	83                              // DW_OP_reg3
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	100                             // -28
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	84                              // DW_OP_reg4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp27-.Lfunc_begin2
	.long	.Ltmp30-.Lfunc_begin2
	.short	17                              // Loc expr size
	.byte	81                              // DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	82                              // DW_OP_reg2
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	83                              // DW_OP_reg3
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	100                             // -28
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	104                             // -24
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp30-.Lfunc_begin2
	.long	.Ltmp31-.Lfunc_begin2
	.short	16                              // Loc expr size
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	82                              // DW_OP_reg2
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	83                              // DW_OP_reg3
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	100                             // -28
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	104                             // -24
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp31-.Lfunc_begin2
	.long	.Ltmp64-.Lfunc_begin2
	.short	15                              // Loc expr size
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	82                              // DW_OP_reg2
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	100                             // -28
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	104                             // -24
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp64-.Lfunc_begin2
	.long	.Ltmp170-.Lfunc_begin2
	.short	10                              // Loc expr size
	.byte	147                             // DW_OP_piece
	.byte	12                              // 12
	.byte	134                             // DW_OP_breg22
	.byte	100                             // -28
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	104                             // -24
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	0
	.long	0
.Ldebug_loc5:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp28-.Lfunc_begin2
	.long	.Ltmp88-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	86                              // DW_OP_reg6
	.long	0
	.long	0
.Ldebug_loc6:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp29-.Lfunc_begin2
	.long	.Ltmp30-.Lfunc_begin2
	.short	3                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp30-.Lfunc_begin2
	.long	.Ltmp31-.Lfunc_begin2
	.short	8                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	81                              // DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp31-.Lfunc_begin2
	.long	.Ltmp32-.Lfunc_begin2
	.short	9                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	83                              // DW_OP_reg3
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	81                              // DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp32-.Lfunc_begin2
	.long	.Ltmp33-.Lfunc_begin2
	.short	11                              // Loc expr size
	.byte	84                              // DW_OP_reg4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	83                              // DW_OP_reg3
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	81                              // DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp33-.Lfunc_begin2
	.long	.Ltmp58-.Lfunc_begin2
	.short	12                              // Loc expr size
	.byte	84                              // DW_OP_reg4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	83                              // DW_OP_reg3
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp58-.Lfunc_begin2
	.long	.Ltmp96-.Lfunc_begin2
	.short	9                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	147                             // DW_OP_piece
	.byte	8                               // 8
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp96-.Lfunc_begin2
	.long	.Ltmp97-.Lfunc_begin2
	.short	12                              // Loc expr size
	.byte	84                              // DW_OP_reg4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	147                             // DW_OP_piece
	.byte	8                               // 8
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	81                              // DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp97-.Lfunc_begin2
	.long	.Ltmp98-.Lfunc_begin2
	.short	13                              // Loc expr size
	.byte	84                              // DW_OP_reg4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	147                             // DW_OP_piece
	.byte	8                               // 8
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	92                              // -36
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp98-.Lfunc_begin2
	.long	.Ltmp99-.Lfunc_begin2
	.short	16                              // Loc expr size
	.byte	84                              // DW_OP_reg4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	147                             // DW_OP_piece
	.byte	8                               // 8
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	92                              // -36
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	81                              // DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp99-.Lfunc_begin2
	.long	.Ltmp100-.Lfunc_begin2
	.short	17                              // Loc expr size
	.byte	84                              // DW_OP_reg4
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	147                             // DW_OP_piece
	.byte	8                               // 8
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	92                              // -36
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp100-.Lfunc_begin2
	.long	.Ltmp166-.Lfunc_begin2
	.short	14                              // Loc expr size
	.byte	147                             // DW_OP_piece
	.byte	12                              // 12
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	92                              // -36
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp166-.Lfunc_begin2
	.long	.Ltmp170-.Lfunc_begin2
	.short	6                               // Loc expr size
	.byte	147                             // DW_OP_piece
	.byte	12                              // 12
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	0
	.long	0
.Ldebug_loc7:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp39-.Lfunc_begin2
	.long	.Ltmp56-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	100                             // DW_OP_reg20
	.long	0
	.long	0
.Ldebug_loc8:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp41-.Lfunc_begin2
	.long	.Ltmp59-.Lfunc_begin2
	.short	3                               // Loc expr size
	.byte	133                             // DW_OP_breg21
	.byte	0                               // 0
	.byte	159                             // DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc9:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp41-.Lfunc_begin2
	.long	.Ltmp43-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	48                              // DW_OP_lit0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp43-.Lfunc_begin2
	.long	.Ltmp45-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	92                              // -36
	.long	.Ltmp45-.Lfunc_begin2
	.long	.Ltmp49-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp49-.Lfunc_begin2
	.long	.Ltmp55-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	92                              // -36
	.long	0
	.long	0
.Ldebug_loc10:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp48-.Lfunc_begin2
	.long	.Ltmp51-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	48                              // DW_OP_lit0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp51-.Lfunc_begin2
	.long	.Ltmp53-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	96                              // DW_OP_reg16
	.long	.Ltmp53-.Lfunc_begin2
	.long	.Ltmp54-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	.Ltmp54-.Lfunc_begin2
	.long	.Ltmp55-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	96                              // DW_OP_reg16
	.long	0
	.long	0
.Ldebug_loc11:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp59-.Lfunc_begin2
	.long	.Ltmp61-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	116                             // -12
	.long	.Ltmp61-.Lfunc_begin2
	.long	.Ltmp63-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc12:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp59-.Lfunc_begin2
	.long	.Ltmp60-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc13:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp59-.Lfunc_begin2
	.long	.Ltmp61-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	116                             // -12
	.long	.Ltmp61-.Lfunc_begin2
	.long	.Ltmp63-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc14:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp59-.Lfunc_begin2
	.long	.Ltmp60-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc15:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp62-.Lfunc_begin2
	.long	.Ltmp64-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	48                              // DW_OP_lit0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp64-.Lfunc_begin2
	.long	.Ltmp67-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc16:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp68-.Lfunc_begin2
	.long	.Ltmp78-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	0
	.long	0
.Ldebug_loc17:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp69-.Lfunc_begin2
	.long	.Ltmp71-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc18:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp73-.Lfunc_begin2
	.long	.Ltmp75-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.long	.Ltmp75-.Lfunc_begin2
	.long	.Ltmp76-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp76-.Lfunc_begin2
	.long	.Ltmp88-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.long	0
	.long	0
.Ldebug_loc19:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp73-.Lfunc_begin2
	.long	.Ltmp74-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc20:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp73-.Lfunc_begin2
	.long	.Ltmp75-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.long	.Ltmp75-.Lfunc_begin2
	.long	.Ltmp76-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp76-.Lfunc_begin2
	.long	.Ltmp88-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	96                              // -32
	.long	0
	.long	0
.Ldebug_loc21:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp78-.Lfunc_begin2
	.long	.Ltmp87-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	0
	.long	0
.Ldebug_loc22:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp83-.Lfunc_begin2
	.long	.Ltmp84-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc23:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp83-.Lfunc_begin2
	.long	.Ltmp84-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc24:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp85-.Lfunc_begin2
	.long	.Ltmp88-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc25:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp90-.Lfunc_begin2
	.long	.Ltmp92-.Lfunc_begin2
	.short	5                               // Loc expr size
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	100                             // DW_OP_reg20
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp92-.Lfunc_begin2
	.long	.Ltmp167-.Lfunc_begin2
	.short	6                               // Loc expr size
	.byte	99                              // DW_OP_reg19
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	100                             // DW_OP_reg20
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp167-.Lfunc_begin2
	.long	.Ltmp168-.Lfunc_begin2
	.short	3                               // Loc expr size
	.byte	99                              // DW_OP_reg19
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	0
	.long	0
.Ldebug_loc26:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp90-.Lfunc_begin2
	.long	.Ltmp167-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	100                             // DW_OP_reg20
	.long	0
	.long	0
.Ldebug_loc27:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp90-.Lfunc_begin2
	.long	.Ltmp167-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	100                             // DW_OP_reg20
	.long	0
	.long	0
.Ldebug_loc28:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp92-.Lfunc_begin2
	.long	.Ltmp167-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	101                             // DW_OP_reg21
	.long	0
	.long	0
.Ldebug_loc29:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp92-.Lfunc_begin2
	.long	.Ltmp167-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	101                             // DW_OP_reg21
	.long	0
	.long	0
.Ldebug_loc30:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp92-.Lfunc_begin2
	.long	.Ltmp167-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	101                             // DW_OP_reg21
	.long	0
	.long	0
.Ldebug_loc31:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp92-.Lfunc_begin2
	.long	.Ltmp167-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	101                             // DW_OP_reg21
	.long	0
	.long	0
.Ldebug_loc32:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp107-.Lfunc_begin2
	.long	.Ltmp110-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc33:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp116-.Lfunc_begin2
	.long	.Ltmp121-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	83                              // DW_OP_reg3
	.long	0
	.long	0
.Ldebug_loc34:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp114-.Lfunc_begin2
	.long	.Ltmp115-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	48                              // DW_OP_lit0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp117-.Lfunc_begin2
	.long	.Ltmp121-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	0
	.long	0
.Ldebug_loc35:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp124-.Lfunc_begin2
	.long	.Ltmp125-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc36:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp121-.Lfunc_begin2
	.long	.Ltmp125-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	48                              // DW_OP_lit0
	.byte	159                             // DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc37:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp127-.Lfunc_begin2
	.long	.Ltmp129-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	100                             // DW_OP_reg20
	.long	.Ltmp129-.Lfunc_begin2
	.long	.Ltmp147-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp147-.Lfunc_begin2
	.long	.Ltmp150-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	100                             // DW_OP_reg20
	.long	.Ltmp150-.Lfunc_begin2
	.long	.Ltmp166-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	0
	.long	0
.Ldebug_loc38:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp127-.Lfunc_begin2
	.long	.Ltmp129-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	101                             // DW_OP_reg21
	.long	.Ltmp129-.Lfunc_begin2
	.long	.Ltmp150-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	83                              // DW_OP_reg3
	.long	0
	.long	0
.Ldebug_loc39:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp127-.Lfunc_begin2
	.long	.Ltmp129-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	48                              // DW_OP_lit0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp129-.Lfunc_begin2
	.long	.Ltmp147-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	0
	.long	0
.Ldebug_loc40:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp135-.Lfunc_begin2
	.long	.Ltmp147-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	86                              // DW_OP_reg6
	.long	0
	.long	0
.Ldebug_loc41:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp135-.Lfunc_begin2
	.long	.Ltmp140-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	87                              // DW_OP_reg7
	.long	.Ltmp141-.Lfunc_begin2
	.long	.Ltmp147-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	87                              // DW_OP_reg7
	.long	0
	.long	0
.Ldebug_loc42:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp135-.Lfunc_begin2
	.long	.Ltmp139-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	86                              // DW_OP_reg6
	.long	.Ltmp140-.Lfunc_begin2
	.long	.Ltmp147-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	86                              // DW_OP_reg6
	.long	0
	.long	0
.Ldebug_loc43:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp135-.Lfunc_begin2
	.long	.Ltmp137-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	.Ltmp140-.Lfunc_begin2
	.long	.Ltmp147-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	84                              // DW_OP_reg4
	.long	0
	.long	0
.Ldebug_loc44:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp149-.Lfunc_begin2
	.long	.Ltmp166-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc45:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp147-.Lfunc_begin2
	.long	.Ltmp148-.Lfunc_begin2
	.short	2                               // Loc expr size
	.byte	48                              // DW_OP_lit0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp150-.Lfunc_begin2
	.long	.Ltmp166-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc46:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp156-.Lfunc_begin2
	.long	.Ltmp157-.Lfunc_begin2
	.short	8                               // Loc expr size
	.byte	115                             // DW_OP_breg3
	.byte	0                               // 0
	.byte	16                              // DW_OP_constu
	.byte	255                             // 65535
	.byte	255                             // 
	.byte	3                               // 
	.byte	26                              // DW_OP_and
	.byte	159                             // DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc47:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp160-.Lfunc_begin2
	.long	.Ltmp166-.Lfunc_begin2
	.short	1                               // Loc expr size
	.byte	83                              // DW_OP_reg3
	.long	0
	.long	0
.Ldebug_loc48:
	.long	-1
	.long	.Lfunc_begin2                   //   base address
	.long	.Ltmp161-.Lfunc_begin2
	.long	.Ltmp162-.Lfunc_begin2
	.short	8                               // Loc expr size
	.byte	117                             // DW_OP_breg5
	.byte	0                               // 0
	.byte	16                              // DW_OP_constu
	.byte	255                             // 65535
	.byte	255                             // 
	.byte	3                               // 
	.byte	26                              // DW_OP_and
	.byte	159                             // DW_OP_stack_value
	.long	0
	.long	0
	.section	.debug_abbrev,"",@progbits
	.byte	1                               // Abbreviation Code
	.byte	17                              // DW_TAG_compile_unit
	.byte	1                               // DW_CHILDREN_yes
	.byte	37                              // DW_AT_producer
	.byte	14                              // DW_FORM_strp
	.byte	19                              // DW_AT_language
	.byte	5                               // DW_FORM_data2
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	16                              // DW_AT_stmt_list
	.byte	23                              // DW_FORM_sec_offset
	.byte	27                              // DW_AT_comp_dir
	.byte	14                              // DW_FORM_strp
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	85                              // DW_AT_ranges
	.byte	23                              // DW_FORM_sec_offset
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	2                               // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	3                               // Abbreviation Code
	.byte	1                               // DW_TAG_array_type
	.byte	1                               // DW_CHILDREN_yes
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	4                               // Abbreviation Code
	.byte	33                              // DW_TAG_subrange_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	55                              // DW_AT_count
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	5                               // Abbreviation Code
	.byte	15                              // DW_TAG_pointer_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	6                               // Abbreviation Code
	.byte	21                              // DW_TAG_subroutine_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	39                              // DW_AT_prototyped
	.byte	25                              // DW_FORM_flag_present
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	7                               // Abbreviation Code
	.byte	36                              // DW_TAG_base_type
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	62                              // DW_AT_encoding
	.byte	11                              // DW_FORM_data1
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	8                               // Abbreviation Code
	.byte	36                              // DW_TAG_base_type
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	62                              // DW_AT_encoding
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	9                               // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.ascii	"\210\001"                      // DW_AT_alignment
	.byte	15                              // DW_FORM_udata
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	10                              // Abbreviation Code
	.byte	22                              // DW_TAG_typedef
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	11                              // Abbreviation Code
	.byte	19                              // DW_TAG_structure_type
	.byte	1                               // DW_CHILDREN_yes
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	12                              // Abbreviation Code
	.byte	13                              // DW_TAG_member
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	56                              // DW_AT_data_member_location
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	13                              // Abbreviation Code
	.byte	4                               // DW_TAG_enumeration_type
	.byte	1                               // DW_CHILDREN_yes
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	14                              // Abbreviation Code
	.byte	40                              // DW_TAG_enumerator
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	28                              // DW_AT_const_value
	.byte	15                              // DW_FORM_udata
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	15                              // Abbreviation Code
	.byte	19                              // DW_TAG_structure_type
	.byte	1                               // DW_CHILDREN_yes
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	16                              // Abbreviation Code
	.byte	15                              // DW_TAG_pointer_type
	.byte	0                               // DW_CHILDREN_no
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	17                              // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	1                               // DW_CHILDREN_yes
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	64                              // DW_AT_frame_base
	.byte	24                              // DW_FORM_exprloc
	.ascii	"\227B"                         // DW_AT_GNU_all_call_sites
	.byte	25                              // DW_FORM_flag_present
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	39                              // DW_AT_prototyped
	.byte	25                              // DW_FORM_flag_present
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	18                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	23                              // DW_FORM_sec_offset
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	19                              // Abbreviation Code
	.ascii	"\211\202\001"                  // DW_TAG_GNU_call_site
	.byte	0                               // DW_CHILDREN_no
	.ascii	"\223B"                         // DW_AT_GNU_call_site_target
	.byte	24                              // DW_FORM_exprloc
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	20                              // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	1                               // DW_CHILDREN_yes
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	64                              // DW_AT_frame_base
	.byte	24                              // DW_FORM_exprloc
	.ascii	"\227B"                         // DW_AT_GNU_all_call_sites
	.byte	25                              // DW_FORM_flag_present
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	39                              // DW_AT_prototyped
	.byte	25                              // DW_FORM_flag_present
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	21                              // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	32                              // DW_AT_inline
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	22                              // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	1                               // DW_CHILDREN_yes
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	39                              // DW_AT_prototyped
	.byte	25                              // DW_FORM_flag_present
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	32                              // DW_AT_inline
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	23                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	24                              // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	1                               // DW_CHILDREN_yes
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	39                              // DW_AT_prototyped
	.byte	25                              // DW_FORM_flag_present
	.byte	32                              // DW_AT_inline
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	25                              // Abbreviation Code
	.byte	38                              // DW_TAG_const_type
	.byte	0                               // DW_CHILDREN_no
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	26                              // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	1                               // DW_CHILDREN_yes
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	39                              // DW_AT_prototyped
	.byte	25                              // DW_FORM_flag_present
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	32                              // DW_AT_inline
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	27                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	28                              // Abbreviation Code
	.byte	11                              // DW_TAG_lexical_block
	.byte	1                               // DW_CHILDREN_yes
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	29                              // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	1                               // DW_CHILDREN_yes
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	39                              // DW_AT_prototyped
	.byte	25                              // DW_FORM_flag_present
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	32                              // DW_AT_inline
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	30                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	23                              // DW_FORM_sec_offset
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	31                              // Abbreviation Code
	.byte	29                              // DW_TAG_inlined_subroutine
	.byte	0                               // DW_CHILDREN_no
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	88                              // DW_AT_call_file
	.byte	11                              // DW_FORM_data1
	.byte	89                              // DW_AT_call_line
	.byte	11                              // DW_FORM_data1
	.byte	87                              // DW_AT_call_column
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	32                              // Abbreviation Code
	.byte	11                              // DW_TAG_lexical_block
	.byte	1                               // DW_CHILDREN_yes
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	33                              // Abbreviation Code
	.byte	29                              // DW_TAG_inlined_subroutine
	.byte	1                               // DW_CHILDREN_yes
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	88                              // DW_AT_call_file
	.byte	11                              // DW_FORM_data1
	.byte	89                              // DW_AT_call_line
	.byte	11                              // DW_FORM_data1
	.byte	87                              // DW_AT_call_column
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	34                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	35                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	23                              // DW_FORM_sec_offset
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	36                              // Abbreviation Code
	.byte	29                              // DW_TAG_inlined_subroutine
	.byte	1                               // DW_CHILDREN_yes
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	85                              // DW_AT_ranges
	.byte	23                              // DW_FORM_sec_offset
	.byte	88                              // DW_AT_call_file
	.byte	11                              // DW_FORM_data1
	.byte	89                              // DW_AT_call_line
	.byte	11                              // DW_FORM_data1
	.byte	87                              // DW_AT_call_column
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	37                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	38                              // Abbreviation Code
	.byte	11                              // DW_TAG_lexical_block
	.byte	1                               // DW_CHILDREN_yes
	.byte	85                              // DW_AT_ranges
	.byte	23                              // DW_FORM_sec_offset
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	39                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	40                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	23                              // DW_FORM_sec_offset
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	5                               // DW_FORM_data2
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	41                              // Abbreviation Code
	.byte	29                              // DW_TAG_inlined_subroutine
	.byte	1                               // DW_CHILDREN_yes
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	85                              // DW_AT_ranges
	.byte	23                              // DW_FORM_sec_offset
	.byte	88                              // DW_AT_call_file
	.byte	11                              // DW_FORM_data1
	.byte	89                              // DW_AT_call_line
	.byte	5                               // DW_FORM_data2
	.byte	87                              // DW_AT_call_column
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	42                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	43                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	44                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	23                              // DW_FORM_sec_offset
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	45                              // Abbreviation Code
	.byte	29                              // DW_TAG_inlined_subroutine
	.byte	1                               // DW_CHILDREN_yes
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	88                              // DW_AT_call_file
	.byte	11                              // DW_FORM_data1
	.byte	89                              // DW_AT_call_line
	.byte	5                               // DW_FORM_data2
	.byte	87                              // DW_AT_call_column
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	46                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	5                               // DW_FORM_data2
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	0                               // EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 // Length of Unit
.Ldebug_info_start0:
	.short	4                               // DWARF version number
	.long	.debug_abbrev                   // Offset Into Abbrev. Section
	.byte	4                               // Address Size (in bytes)
	.byte	1                               // Abbrev [1] 0xb:0xd18 DW_TAG_compile_unit
	.long	.Linfo_string0                  // DW_AT_producer
	.short	12                              // DW_AT_language
	.long	.Linfo_string1                  // DW_AT_name
	.long	.Lline_table_start0             // DW_AT_stmt_list
	.long	.Linfo_string2                  // DW_AT_comp_dir
	.long	0                               // DW_AT_low_pc
	.long	.Ldebug_ranges11                // DW_AT_ranges
	.byte	2                               // Abbrev [2] 0x26:0x11 DW_TAG_variable
	.long	.Linfo_string3                  // DW_AT_name
	.long	55                              // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	101                             // DW_AT_decl_line
	.byte	5                               // DW_AT_location
	.byte	3
	.long	kernels
	.byte	3                               // Abbrev [3] 0x37:0xc DW_TAG_array_type
	.long	67                              // DW_AT_type
	.byte	4                               // Abbrev [4] 0x3c:0x6 DW_TAG_subrange_type
	.long	84                              // DW_AT_type
	.byte	1                               // DW_AT_count
	.byte	0                               // End Of Children Mark
	.byte	5                               // Abbrev [5] 0x43:0x5 DW_TAG_pointer_type
	.long	72                              // DW_AT_type
	.byte	6                               // Abbrev [6] 0x48:0x5 DW_TAG_subroutine_type
	.long	77                              // DW_AT_type
                                        // DW_AT_prototyped
	.byte	7                               // Abbrev [7] 0x4d:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  // DW_AT_name
	.byte	5                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	8                               // Abbrev [8] 0x54:0x7 DW_TAG_base_type
	.long	.Linfo_string5                  // DW_AT_name
	.byte	8                               // DW_AT_byte_size
	.byte	7                               // DW_AT_encoding
	.byte	9                               // Abbrev [9] 0x5b:0x12 DW_TAG_variable
	.long	.Linfo_string6                  // DW_AT_name
	.long	109                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	24                              // DW_AT_decl_line
	.byte	8                               // DW_AT_alignment
	.byte	5                               // DW_AT_location
	.byte	3
	.long	DPU_INPUT_ARGUMENTS
	.byte	10                              // Abbrev [10] 0x6d:0xb DW_TAG_typedef
	.long	120                             // DW_AT_type
	.long	.Linfo_string31                 // DW_AT_name
	.byte	4                               // DW_AT_decl_file
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // Abbrev [11] 0x78:0x39 DW_TAG_structure_type
	.long	.Linfo_string31                 // DW_AT_name
	.byte	60                              // DW_AT_byte_size
	.byte	4                               // DW_AT_decl_file
	.byte	48                              // DW_AT_decl_line
	.byte	12                              // Abbrev [12] 0x80:0xc DW_TAG_member
	.long	.Linfo_string7                  // DW_AT_name
	.long	177                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	49                              // DW_AT_decl_line
	.byte	0                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x8c:0xc DW_TAG_member
	.long	.Linfo_string18                 // DW_AT_name
	.long	298                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	51                              // DW_AT_decl_line
	.byte	24                              // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x98:0xc DW_TAG_member
	.long	.Linfo_string27                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	53                              // DW_AT_decl_line
	.byte	52                              // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0xa4:0xc DW_TAG_member
	.long	.Linfo_string28                 // DW_AT_name
	.long	402                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	58                              // DW_AT_decl_line
	.byte	56                              // DW_AT_data_member_location
	.byte	0                               // End Of Children Mark
	.byte	10                              // Abbrev [10] 0xb1:0xb DW_TAG_typedef
	.long	188                             // DW_AT_type
	.long	.Linfo_string17                 // DW_AT_name
	.byte	4                               // DW_AT_decl_file
	.byte	37                              // DW_AT_decl_line
	.byte	11                              // Abbrev [11] 0xbc:0x51 DW_TAG_structure_type
	.long	.Linfo_string17                 // DW_AT_name
	.byte	24                              // DW_AT_byte_size
	.byte	4                               // DW_AT_decl_file
	.byte	30                              // DW_AT_decl_line
	.byte	12                              // Abbrev [12] 0xc4:0xc DW_TAG_member
	.long	.Linfo_string8                  // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	31                              // DW_AT_decl_line
	.byte	0                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0xd0:0xc DW_TAG_member
	.long	.Linfo_string12                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	32                              // DW_AT_decl_line
	.byte	4                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0xdc:0xc DW_TAG_member
	.long	.Linfo_string13                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	33                              // DW_AT_decl_line
	.byte	8                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0xe8:0xc DW_TAG_member
	.long	.Linfo_string14                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	34                              // DW_AT_decl_line
	.byte	12                              // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0xf4:0xc DW_TAG_member
	.long	.Linfo_string15                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	35                              // DW_AT_decl_line
	.byte	16                              // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x100:0xc DW_TAG_member
	.long	.Linfo_string16                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	36                              // DW_AT_decl_line
	.byte	20                              // DW_AT_data_member_location
	.byte	0                               // End Of Children Mark
	.byte	10                              // Abbrev [10] 0x10d:0xb DW_TAG_typedef
	.long	280                             // DW_AT_type
	.long	.Linfo_string11                 // DW_AT_name
	.byte	3                               // DW_AT_decl_file
	.byte	13                              // DW_AT_decl_line
	.byte	10                              // Abbrev [10] 0x118:0xb DW_TAG_typedef
	.long	291                             // DW_AT_type
	.long	.Linfo_string10                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	48                              // DW_AT_decl_line
	.byte	7                               // Abbrev [7] 0x123:0x7 DW_TAG_base_type
	.long	.Linfo_string9                  // DW_AT_name
	.byte	7                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	10                              // Abbrev [10] 0x12a:0xb DW_TAG_typedef
	.long	309                             // DW_AT_type
	.long	.Linfo_string26                 // DW_AT_name
	.byte	4                               // DW_AT_decl_file
	.byte	18                              // DW_AT_decl_line
	.byte	11                              // Abbrev [11] 0x135:0x5d DW_TAG_structure_type
	.long	.Linfo_string26                 // DW_AT_name
	.byte	28                              // DW_AT_byte_size
	.byte	4                               // DW_AT_decl_file
	.byte	9                               // DW_AT_decl_line
	.byte	12                              // Abbrev [12] 0x13d:0xc DW_TAG_member
	.long	.Linfo_string19                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	10                              // DW_AT_decl_line
	.byte	0                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x149:0xc DW_TAG_member
	.long	.Linfo_string20                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	11                              // DW_AT_decl_line
	.byte	4                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x155:0xc DW_TAG_member
	.long	.Linfo_string21                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	12                              // DW_AT_decl_line
	.byte	8                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x161:0xc DW_TAG_member
	.long	.Linfo_string22                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	14                              // DW_AT_decl_line
	.byte	12                              // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x16d:0xc DW_TAG_member
	.long	.Linfo_string23                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	15                              // DW_AT_decl_line
	.byte	16                              // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x179:0xc DW_TAG_member
	.long	.Linfo_string24                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	16                              // DW_AT_decl_line
	.byte	20                              // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x185:0xc DW_TAG_member
	.long	.Linfo_string25                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	17                              // DW_AT_decl_line
	.byte	24                              // DW_AT_data_member_location
	.byte	0                               // End Of Children Mark
	.byte	13                              // Abbrev [13] 0x192:0x19 DW_TAG_enumeration_type
	.long	291                             // DW_AT_type
	.long	.Linfo_string3                  // DW_AT_name
	.byte	4                               // DW_AT_byte_size
	.byte	4                               // DW_AT_decl_file
	.byte	55                              // DW_AT_decl_line
	.byte	14                              // Abbrev [14] 0x19e:0x6 DW_TAG_enumerator
	.long	.Linfo_string29                 // DW_AT_name
	.byte	0                               // DW_AT_const_value
	.byte	14                              // Abbrev [14] 0x1a4:0x6 DW_TAG_enumerator
	.long	.Linfo_string30                 // DW_AT_name
	.byte	1                               // DW_AT_const_value
	.byte	0                               // End Of Children Mark
	.byte	9                               // Abbrev [9] 0x1ab:0x12 DW_TAG_variable
	.long	.Linfo_string32                 // DW_AT_name
	.long	445                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	25                              // DW_AT_decl_line
	.byte	8                               // DW_AT_alignment
	.byte	5                               // DW_AT_location
	.byte	3
	.long	DPU_RESULTS
	.byte	3                               // Abbrev [3] 0x1bd:0xc DW_TAG_array_type
	.long	457                             // DW_AT_type
	.byte	4                               // Abbrev [4] 0x1c2:0x6 DW_TAG_subrange_type
	.long	84                              // DW_AT_type
	.byte	11                              // DW_AT_count
	.byte	0                               // End Of Children Mark
	.byte	10                              // Abbrev [10] 0x1c9:0xb DW_TAG_typedef
	.long	468                             // DW_AT_type
	.long	.Linfo_string37                 // DW_AT_name
	.byte	4                               // DW_AT_decl_file
	.byte	63                              // DW_AT_decl_line
	.byte	15                              // Abbrev [15] 0x1d4:0x11 DW_TAG_structure_type
	.byte	8                               // DW_AT_byte_size
	.byte	4                               // DW_AT_decl_file
	.byte	61                              // DW_AT_decl_line
	.byte	12                              // Abbrev [12] 0x1d8:0xc DW_TAG_member
	.long	.Linfo_string33                 // DW_AT_name
	.long	485                             // DW_AT_type
	.byte	4                               // DW_AT_decl_file
	.byte	62                              // DW_AT_decl_line
	.byte	0                               // DW_AT_data_member_location
	.byte	0                               // End Of Children Mark
	.byte	10                              // Abbrev [10] 0x1e5:0xb DW_TAG_typedef
	.long	496                             // DW_AT_type
	.long	.Linfo_string36                 // DW_AT_name
	.byte	3                               // DW_AT_decl_file
	.byte	14                              // DW_AT_decl_line
	.byte	10                              // Abbrev [10] 0x1f0:0xb DW_TAG_typedef
	.long	507                             // DW_AT_type
	.long	.Linfo_string35                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	53                              // DW_AT_decl_line
	.byte	7                               // Abbrev [7] 0x1fb:0x7 DW_TAG_base_type
	.long	.Linfo_string34                 // DW_AT_name
	.byte	7                               // DW_AT_encoding
	.byte	8                               // DW_AT_byte_size
	.byte	2                               // Abbrev [2] 0x202:0x11 DW_TAG_variable
	.long	.Linfo_string13                 // DW_AT_name
	.long	531                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	28                              // DW_AT_decl_line
	.byte	5                               // DW_AT_location
	.byte	3
	.long	thresholds
	.byte	5                               // Abbrev [5] 0x213:0x5 DW_TAG_pointer_type
	.long	536                             // DW_AT_type
	.byte	10                              // Abbrev [10] 0x218:0xb DW_TAG_typedef
	.long	547                             // DW_AT_type
	.long	.Linfo_string40                 // DW_AT_name
	.byte	3                               // DW_AT_decl_file
	.byte	11                              // DW_AT_decl_line
	.byte	10                              // Abbrev [10] 0x223:0xb DW_TAG_typedef
	.long	558                             // DW_AT_type
	.long	.Linfo_string39                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	40                              // DW_AT_decl_line
	.byte	7                               // Abbrev [7] 0x22e:0x7 DW_TAG_base_type
	.long	.Linfo_string38                 // DW_AT_name
	.byte	8                               // DW_AT_encoding
	.byte	1                               // DW_AT_byte_size
	.byte	2                               // Abbrev [2] 0x235:0x11 DW_TAG_variable
	.long	.Linfo_string12                 // DW_AT_name
	.long	582                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	29                              // DW_AT_decl_line
	.byte	5                               // DW_AT_location
	.byte	3
	.long	order
	.byte	5                               // Abbrev [5] 0x246:0x5 DW_TAG_pointer_type
	.long	587                             // DW_AT_type
	.byte	10                              // Abbrev [10] 0x24b:0xb DW_TAG_typedef
	.long	598                             // DW_AT_type
	.long	.Linfo_string43                 // DW_AT_name
	.byte	3                               // DW_AT_decl_file
	.byte	12                              // DW_AT_decl_line
	.byte	10                              // Abbrev [10] 0x256:0xb DW_TAG_typedef
	.long	609                             // DW_AT_type
	.long	.Linfo_string42                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	44                              // DW_AT_decl_line
	.byte	7                               // Abbrev [7] 0x261:0x7 DW_TAG_base_type
	.long	.Linfo_string41                 // DW_AT_name
	.byte	7                               // DW_AT_encoding
	.byte	2                               // DW_AT_byte_size
	.byte	2                               // Abbrev [2] 0x268:0x11 DW_TAG_variable
	.long	.Linfo_string14                 // DW_AT_name
	.long	633                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	30                              // DW_AT_decl_line
	.byte	5                               // DW_AT_location
	.byte	3
	.long	hash_params
	.byte	10                              // Abbrev [10] 0x279:0xb DW_TAG_typedef
	.long	644                             // DW_AT_type
	.long	.Linfo_string46                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	44                              // DW_AT_decl_line
	.byte	11                              // Abbrev [11] 0x284:0x21 DW_TAG_structure_type
	.long	.Linfo_string46                 // DW_AT_name
	.byte	8                               // DW_AT_byte_size
	.byte	5                               // DW_AT_decl_file
	.byte	44                              // DW_AT_decl_line
	.byte	12                              // Abbrev [12] 0x28c:0xc DW_TAG_member
	.long	.Linfo_string44                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	5                               // DW_AT_decl_file
	.byte	44                              // DW_AT_decl_line
	.byte	0                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x298:0xc DW_TAG_member
	.long	.Linfo_string45                 // DW_AT_name
	.long	582                             // DW_AT_type
	.byte	5                               // DW_AT_decl_file
	.byte	44                              // DW_AT_decl_line
	.byte	4                               // DW_AT_data_member_location
	.byte	0                               // End Of Children Mark
	.byte	2                               // Abbrev [2] 0x2a5:0x11 DW_TAG_variable
	.long	.Linfo_string47                 // DW_AT_name
	.long	694                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	31                              // DW_AT_decl_line
	.byte	5                               // DW_AT_location
	.byte	3
	.long	filters
	.byte	10                              // Abbrev [10] 0x2b6:0xb DW_TAG_typedef
	.long	705                             // DW_AT_type
	.long	.Linfo_string48                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	45                              // DW_AT_decl_line
	.byte	11                              // Abbrev [11] 0x2c1:0x21 DW_TAG_structure_type
	.long	.Linfo_string48                 // DW_AT_name
	.byte	8                               // DW_AT_byte_size
	.byte	5                               // DW_AT_decl_file
	.byte	45                              // DW_AT_decl_line
	.byte	12                              // Abbrev [12] 0x2c9:0xc DW_TAG_member
	.long	.Linfo_string44                 // DW_AT_name
	.long	269                             // DW_AT_type
	.byte	5                               // DW_AT_decl_file
	.byte	45                              // DW_AT_decl_line
	.byte	0                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x2d5:0xc DW_TAG_member
	.long	.Linfo_string45                 // DW_AT_name
	.long	531                             // DW_AT_type
	.byte	5                               // DW_AT_decl_file
	.byte	45                              // DW_AT_decl_line
	.byte	4                               // DW_AT_data_member_location
	.byte	0                               // End Of Children Mark
	.byte	2                               // Abbrev [2] 0x2e2:0x11 DW_TAG_variable
	.long	.Linfo_string49                 // DW_AT_name
	.long	547                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	34                              // DW_AT_decl_line
	.byte	5                               // DW_AT_location
	.byte	3
	.long	__atomic_bit_barrier_reset_barrier
	.byte	2                               // Abbrev [2] 0x2f3:0x11 DW_TAG_variable
	.long	.Linfo_string50                 // DW_AT_name
	.long	547                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	35                              // DW_AT_decl_line
	.byte	5                               // DW_AT_location
	.byte	3
	.long	__atomic_bit_barrier_initialization_barrier
	.byte	16                              // Abbrev [16] 0x304:0x1 DW_TAG_pointer_type
	.byte	17                              // Abbrev [17] 0x305:0x28 DW_TAG_subprogram
	.long	.Lfunc_begin0                   // DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string88                 // DW_AT_name
	.byte	6                               // DW_AT_decl_file
	.byte	11                              // DW_AT_decl_line
                                        // DW_AT_prototyped
                                        // DW_AT_external
	.byte	18                              // Abbrev [18] 0x316:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0                    // DW_AT_location
	.long	.Linfo_string33                 // DW_AT_name
	.byte	6                               // DW_AT_decl_file
	.byte	11                              // DW_AT_decl_line
	.long	3290                            // DW_AT_type
	.byte	19                              // Abbrev [19] 0x325:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp1                          // DW_AT_low_pc
	.byte	0                               // End Of Children Mark
	.byte	20                              // Abbrev [20] 0x32d:0x33 DW_TAG_subprogram
	.long	.Lfunc_begin1                   // DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string89                 // DW_AT_name
	.byte	6                               // DW_AT_decl_file
	.byte	15                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	496                             // DW_AT_type
                                        // DW_AT_external
	.byte	18                              // Abbrev [18] 0x342:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1                    // DW_AT_location
	.long	.Linfo_string33                 // DW_AT_name
	.byte	6                               // DW_AT_decl_file
	.byte	15                              // DW_AT_decl_line
	.long	3290                            // DW_AT_type
	.byte	19                              // Abbrev [19] 0x351:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp5                          // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0x358:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp6                          // DW_AT_low_pc
	.byte	0                               // End Of Children Mark
	.byte	21                              // Abbrev [21] 0x360:0xc DW_TAG_subprogram
	.long	.Linfo_string51                 // DW_AT_name
	.byte	7                               // DW_AT_decl_file
	.byte	33                              // DW_AT_decl_line
	.long	876                             // DW_AT_type
	.byte	1                               // DW_AT_inline
	.byte	10                              // Abbrev [10] 0x36c:0xb DW_TAG_typedef
	.long	291                             // DW_AT_type
	.long	.Linfo_string52                 // DW_AT_name
	.byte	10                              // DW_AT_decl_file
	.byte	27                              // DW_AT_decl_line
	.byte	22                              // Abbrev [22] 0x377:0x18 DW_TAG_subprogram
	.long	.Linfo_string53                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	76                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	531                             // DW_AT_type
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x383:0xb DW_TAG_formal_parameter
	.long	.Linfo_string54                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	76                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	22                              // Abbrev [22] 0x38f:0x18 DW_TAG_subprogram
	.long	.Linfo_string55                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	78                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	582                             // DW_AT_type
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x39b:0xb DW_TAG_formal_parameter
	.long	.Linfo_string54                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	78                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	24                              // Abbrev [24] 0x3a7:0x2a DW_TAG_subprogram
	.long	.Linfo_string56                 // DW_AT_name
	.byte	9                               // DW_AT_decl_file
	.byte	33                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x3af:0xb DW_TAG_formal_parameter
	.long	.Linfo_string57                 // DW_AT_name
	.byte	9                               // DW_AT_decl_file
	.byte	33                              // DW_AT_decl_line
	.long	977                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x3ba:0xb DW_TAG_formal_parameter
	.long	.Linfo_string58                 // DW_AT_name
	.byte	9                               // DW_AT_decl_file
	.byte	33                              // DW_AT_decl_line
	.long	772                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x3c5:0xb DW_TAG_formal_parameter
	.long	.Linfo_string59                 // DW_AT_name
	.byte	9                               // DW_AT_decl_file
	.byte	33                              // DW_AT_decl_line
	.long	291                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	5                               // Abbrev [5] 0x3d1:0x5 DW_TAG_pointer_type
	.long	982                             // DW_AT_type
	.byte	25                              // Abbrev [25] 0x3d6:0x1 DW_TAG_const_type
	.byte	24                              // Abbrev [24] 0x3d7:0x2a DW_TAG_subprogram
	.long	.Linfo_string60                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	48                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x3df:0xb DW_TAG_formal_parameter
	.long	.Linfo_string57                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	48                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x3ea:0xb DW_TAG_formal_parameter
	.long	.Linfo_string58                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	48                              // DW_AT_decl_line
	.long	582                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x3f5:0xb DW_TAG_formal_parameter
	.long	.Linfo_string54                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	48                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	24                              // Abbrev [24] 0x401:0x2a DW_TAG_subprogram
	.long	.Linfo_string61                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	57                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x409:0xb DW_TAG_formal_parameter
	.long	.Linfo_string62                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	57                              // DW_AT_decl_line
	.long	1067                            // DW_AT_type
	.byte	23                              // Abbrev [23] 0x414:0xb DW_TAG_formal_parameter
	.long	.Linfo_string63                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	57                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x41f:0xb DW_TAG_formal_parameter
	.long	.Linfo_string64                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	57                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	5                               // Abbrev [5] 0x42b:0x5 DW_TAG_pointer_type
	.long	633                             // DW_AT_type
	.byte	24                              // Abbrev [24] 0x430:0x2a DW_TAG_subprogram
	.long	.Linfo_string65                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	58                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x438:0xb DW_TAG_formal_parameter
	.long	.Linfo_string62                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	58                              // DW_AT_decl_line
	.long	1114                            // DW_AT_type
	.byte	23                              // Abbrev [23] 0x443:0xb DW_TAG_formal_parameter
	.long	.Linfo_string63                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	58                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x44e:0xb DW_TAG_formal_parameter
	.long	.Linfo_string64                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	58                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	5                               // Abbrev [5] 0x45a:0x5 DW_TAG_pointer_type
	.long	694                             // DW_AT_type
	.byte	24                              // Abbrev [24] 0x45f:0x2a DW_TAG_subprogram
	.long	.Linfo_string66                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	46                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x467:0xb DW_TAG_formal_parameter
	.long	.Linfo_string57                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	46                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x472:0xb DW_TAG_formal_parameter
	.long	.Linfo_string58                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	46                              // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x47d:0xb DW_TAG_formal_parameter
	.long	.Linfo_string54                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	46                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	24                              // Abbrev [24] 0x489:0x2a DW_TAG_subprogram
	.long	.Linfo_string67                 // DW_AT_name
	.byte	9                               // DW_AT_decl_file
	.byte	55                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x491:0xb DW_TAG_formal_parameter
	.long	.Linfo_string57                 // DW_AT_name
	.byte	9                               // DW_AT_decl_file
	.byte	55                              // DW_AT_decl_line
	.long	977                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x49c:0xb DW_TAG_formal_parameter
	.long	.Linfo_string58                 // DW_AT_name
	.byte	9                               // DW_AT_decl_file
	.byte	55                              // DW_AT_decl_line
	.long	772                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x4a7:0xb DW_TAG_formal_parameter
	.long	.Linfo_string59                 // DW_AT_name
	.byte	9                               // DW_AT_decl_file
	.byte	55                              // DW_AT_decl_line
	.long	291                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	24                              // Abbrev [24] 0x4b3:0x2a DW_TAG_subprogram
	.long	.Linfo_string68                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	62                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x4bb:0xb DW_TAG_formal_parameter
	.long	.Linfo_string57                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	62                              // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x4c6:0xb DW_TAG_formal_parameter
	.long	.Linfo_string58                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	62                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x4d1:0xb DW_TAG_formal_parameter
	.long	.Linfo_string54                 // DW_AT_name
	.byte	8                               // DW_AT_decl_file
	.byte	62                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	26                              // Abbrev [26] 0x4dd:0x7d DW_TAG_subprogram
	.long	.Linfo_string69                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	56                              // DW_AT_decl_line
                                        // DW_AT_prototyped
                                        // DW_AT_external
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x4e5:0xb DW_TAG_formal_parameter
	.long	.Linfo_string70                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	56                              // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x4f0:0xb DW_TAG_formal_parameter
	.long	.Linfo_string71                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	56                              // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x4fb:0xb DW_TAG_formal_parameter
	.long	.Linfo_string20                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	56                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x506:0xb DW_TAG_formal_parameter
	.long	.Linfo_string13                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	56                              // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x511:0xb DW_TAG_formal_parameter
	.long	.Linfo_string54                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	56                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	27                              // Abbrev [27] 0x51c:0xb DW_TAG_variable
	.long	.Linfo_string72                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	57                              // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	28                              // Abbrev [28] 0x527:0x32 DW_TAG_lexical_block
	.byte	27                              // Abbrev [27] 0x528:0xb DW_TAG_variable
	.long	.Linfo_string73                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	58                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	28                              // Abbrev [28] 0x533:0x25 DW_TAG_lexical_block
	.byte	27                              // Abbrev [27] 0x534:0xb DW_TAG_variable
	.long	.Linfo_string74                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	59                              // DW_AT_decl_line
	.long	536                             // DW_AT_type
	.byte	27                              // Abbrev [27] 0x53f:0xb DW_TAG_variable
	.long	.Linfo_string75                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	60                              // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	28                              // Abbrev [28] 0x54a:0xd DW_TAG_lexical_block
	.byte	27                              // Abbrev [27] 0x54b:0xb DW_TAG_variable
	.long	.Linfo_string76                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	61                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	26                              // Abbrev [26] 0x55a:0x42 DW_TAG_subprogram
	.long	.Linfo_string77                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	70                              // DW_AT_decl_line
                                        // DW_AT_prototyped
                                        // DW_AT_external
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x562:0xb DW_TAG_formal_parameter
	.long	.Linfo_string70                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	70                              // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x56d:0xb DW_TAG_formal_parameter
	.long	.Linfo_string71                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	70                              // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x578:0xb DW_TAG_formal_parameter
	.long	.Linfo_string12                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	70                              // DW_AT_decl_line
	.long	582                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x583:0xb DW_TAG_formal_parameter
	.long	.Linfo_string54                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	70                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	28                              // Abbrev [28] 0x58e:0xd DW_TAG_lexical_block
	.byte	27                              // Abbrev [27] 0x58f:0xb DW_TAG_variable
	.long	.Linfo_string73                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	71                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	26                              // Abbrev [26] 0x59c:0x4d DW_TAG_subprogram
	.long	.Linfo_string78                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	78                              // DW_AT_decl_line
                                        // DW_AT_prototyped
                                        // DW_AT_external
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x5a4:0xb DW_TAG_formal_parameter
	.long	.Linfo_string70                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	78                              // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x5af:0xb DW_TAG_formal_parameter
	.long	.Linfo_string71                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	78                              // DW_AT_decl_line
	.long	582                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x5ba:0xb DW_TAG_formal_parameter
	.long	.Linfo_string79                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	78                              // DW_AT_decl_line
	.long	582                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x5c5:0xb DW_TAG_formal_parameter
	.long	.Linfo_string54                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	78                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	27                              // Abbrev [27] 0x5d0:0xb DW_TAG_variable
	.long	.Linfo_string80                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	79                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	28                              // Abbrev [28] 0x5db:0xd DW_TAG_lexical_block
	.byte	27                              // Abbrev [27] 0x5dc:0xb DW_TAG_variable
	.long	.Linfo_string81                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	81                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	29                              // Abbrev [29] 0x5e9:0x46 DW_TAG_subprogram
	.long	.Linfo_string82                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	91                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	536                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x5f5:0xb DW_TAG_formal_parameter
	.long	.Linfo_string70                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	91                              // DW_AT_decl_line
	.long	582                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x600:0xb DW_TAG_formal_parameter
	.long	.Linfo_string83                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	91                              // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x60b:0xb DW_TAG_formal_parameter
	.long	.Linfo_string54                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	91                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	27                              // Abbrev [27] 0x616:0xb DW_TAG_variable
	.long	.Linfo_string80                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	92                              // DW_AT_decl_line
	.long	536                             // DW_AT_type
	.byte	28                              // Abbrev [28] 0x621:0xd DW_TAG_lexical_block
	.byte	27                              // Abbrev [27] 0x622:0xb DW_TAG_variable
	.long	.Linfo_string81                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	93                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	29                              // Abbrev [29] 0x62f:0x39 DW_TAG_subprogram
	.long	.Linfo_string84                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	46                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	536                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x63b:0xb DW_TAG_formal_parameter
	.long	.Linfo_string45                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	46                              // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x646:0xb DW_TAG_formal_parameter
	.long	.Linfo_string85                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	46                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	27                              // Abbrev [27] 0x651:0xb DW_TAG_variable
	.long	.Linfo_string86                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	47                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	27                              // Abbrev [27] 0x65c:0xb DW_TAG_variable
	.long	.Linfo_string87                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	48                              // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	20                              // Abbrev [20] 0x668:0x655 DW_TAG_subprogram
	.long	.Lfunc_begin2                   // DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string90                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	108                             // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	77                              // DW_AT_type
                                        // DW_AT_external
	.byte	30                              // Abbrev [30] 0x67d:0xf DW_TAG_variable
	.long	.Ldebug_loc2                    // DW_AT_location
	.long	.Linfo_string97                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	109                             // DW_AT_decl_line
	.long	291                             // DW_AT_type
	.byte	30                              // Abbrev [30] 0x68c:0xf DW_TAG_variable
	.long	.Ldebug_loc3                    // DW_AT_location
	.long	.Linfo_string98                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	131                             // DW_AT_decl_line
	.long	298                             // DW_AT_type
	.byte	30                              // Abbrev [30] 0x69b:0xf DW_TAG_variable
	.long	.Ldebug_loc4                    // DW_AT_location
	.long	.Linfo_string7                  // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	133                             // DW_AT_decl_line
	.long	177                             // DW_AT_type
	.byte	30                              // Abbrev [30] 0x6aa:0xf DW_TAG_variable
	.long	.Ldebug_loc5                    // DW_AT_location
	.long	.Linfo_string27                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	135                             // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	30                              // Abbrev [30] 0x6b9:0xf DW_TAG_variable
	.long	.Ldebug_loc6                    // DW_AT_location
	.long	.Linfo_string99                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	137                             // DW_AT_decl_line
	.long	177                             // DW_AT_type
	.byte	30                              // Abbrev [30] 0x6c8:0xf DW_TAG_variable
	.long	.Ldebug_loc25                   // DW_AT_location
	.long	.Linfo_string102                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	226                             // DW_AT_decl_line
	.long	633                             // DW_AT_type
	.byte	30                              // Abbrev [30] 0x6d7:0xf DW_TAG_variable
	.long	.Ldebug_loc26                   // DW_AT_location
	.long	.Linfo_string103                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	222                             // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	30                              // Abbrev [30] 0x6e6:0xf DW_TAG_variable
	.long	.Ldebug_loc27                   // DW_AT_location
	.long	.Linfo_string104                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	217                             // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	30                              // Abbrev [30] 0x6f5:0xf DW_TAG_variable
	.long	.Ldebug_loc28                   // DW_AT_location
	.long	.Linfo_string105                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	230                             // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	30                              // Abbrev [30] 0x704:0xf DW_TAG_variable
	.long	.Ldebug_loc29                   // DW_AT_location
	.long	.Linfo_string106                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	223                             // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	30                              // Abbrev [30] 0x713:0xf DW_TAG_variable
	.long	.Ldebug_loc30                   // DW_AT_location
	.long	.Linfo_string70                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	220                             // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	30                              // Abbrev [30] 0x722:0xf DW_TAG_variable
	.long	.Ldebug_loc31                   // DW_AT_location
	.long	.Linfo_string107                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	218                             // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	31                              // Abbrev [31] 0x731:0x10 DW_TAG_inlined_subroutine
	.long	864                             // DW_AT_abstract_origin
	.long	.Ltmp9                          // DW_AT_low_pc
	.long	.Ltmp11-.Ltmp9                  // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	109                             // DW_AT_call_line
	.byte	31                              // DW_AT_call_column
	.byte	32                              // Abbrev [32] 0x741:0x213 DW_TAG_lexical_block
	.long	.Ltmp36                         // DW_AT_low_pc
	.long	.Ltmp88-.Ltmp36                 // DW_AT_high_pc
	.byte	30                              // Abbrev [30] 0x74a:0xf DW_TAG_variable
	.long	.Ldebug_loc7                    // DW_AT_location
	.long	.Linfo_string72                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	180                             // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	30                              // Abbrev [30] 0x759:0xf DW_TAG_variable
	.long	.Ldebug_loc8                    // DW_AT_location
	.long	.Linfo_string100                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	181                             // DW_AT_decl_line
	.long	536                             // DW_AT_type
	.byte	33                              // Abbrev [33] 0x768:0x19 DW_TAG_inlined_subroutine
	.long	887                             // DW_AT_abstract_origin
	.long	.Ltmp36                         // DW_AT_low_pc
	.long	.Ltmp39-.Ltmp36                 // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	178                             // DW_AT_call_line
	.byte	22                              // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0x778:0x8 DW_TAG_formal_parameter
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	80
	.long	899                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	32                              // Abbrev [32] 0x781:0x32 DW_TAG_lexical_block
	.long	.Ltmp41                         // DW_AT_low_pc
	.long	.Ltmp55-.Ltmp41                 // DW_AT_high_pc
	.byte	30                              // Abbrev [30] 0x78a:0xf DW_TAG_variable
	.long	.Ldebug_loc9                    // DW_AT_location
	.long	.Linfo_string81                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	182                             // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	32                              // Abbrev [32] 0x799:0x19 DW_TAG_lexical_block
	.long	.Ltmp49                         // DW_AT_low_pc
	.long	.Ltmp55-.Ltmp49                 // DW_AT_high_pc
	.byte	30                              // Abbrev [30] 0x7a2:0xf DW_TAG_variable
	.long	.Ldebug_loc10                   // DW_AT_location
	.long	.Linfo_string101                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	183                             // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	33                              // Abbrev [33] 0x7b3:0x19 DW_TAG_inlined_subroutine
	.long	911                             // DW_AT_abstract_origin
	.long	.Ltmp55                         // DW_AT_low_pc
	.long	.Ltmp58-.Ltmp55                 // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	190                             // DW_AT_call_line
	.byte	17                              // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0x7c3:0x8 DW_TAG_formal_parameter
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	80
	.long	923                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	33                              // Abbrev [33] 0x7cc:0x55 DW_TAG_inlined_subroutine
	.long	983                             // DW_AT_abstract_origin
	.long	.Ltmp59                         // DW_AT_low_pc
	.long	.Ltmp62-.Ltmp59                 // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	191                             // DW_AT_call_line
	.byte	9                               // DW_AT_call_column
	.byte	35                              // Abbrev [35] 0x7dc:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc13                   // DW_AT_location
	.long	991                             // DW_AT_abstract_origin
	.byte	35                              // Abbrev [35] 0x7e5:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc14                   // DW_AT_location
	.long	1002                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0x7ee:0x8 DW_TAG_formal_parameter
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	80
	.long	1013                            // DW_AT_abstract_origin
	.byte	33                              // Abbrev [33] 0x7f6:0x2a DW_TAG_inlined_subroutine
	.long	935                             // DW_AT_abstract_origin
	.long	.Ltmp59                         // DW_AT_low_pc
	.long	.Ltmp62-.Ltmp59                 // DW_AT_high_pc
	.byte	8                               // DW_AT_call_file
	.byte	48                              // DW_AT_call_line
	.byte	1                               // DW_AT_call_column
	.byte	35                              // Abbrev [35] 0x806:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc11                   // DW_AT_location
	.long	943                             // DW_AT_abstract_origin
	.byte	35                              // Abbrev [35] 0x80f:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc12                   // DW_AT_location
	.long	954                             // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0x818:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	100
	.long	965                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	32                              // Abbrev [32] 0x821:0x19 DW_TAG_lexical_block
	.long	.Ltmp62                         // DW_AT_low_pc
	.long	.Ltmp67-.Ltmp62                 // DW_AT_high_pc
	.byte	30                              // Abbrev [30] 0x82a:0xf DW_TAG_variable
	.long	.Ldebug_loc15                   // DW_AT_location
	.long	.Linfo_string81                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	194                             // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	36                              // Abbrev [36] 0x83a:0x3a DW_TAG_inlined_subroutine
	.long	1025                            // DW_AT_abstract_origin
	.long	.Ldebug_ranges0                 // DW_AT_ranges
	.byte	1                               // DW_AT_call_file
	.byte	199                             // DW_AT_call_line
	.byte	9                               // DW_AT_call_column
	.byte	35                              // Abbrev [35] 0x846:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc16                   // DW_AT_location
	.long	1033                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0x84f:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	99
	.long	1044                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0x856:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	98
	.long	1055                            // DW_AT_abstract_origin
	.byte	33                              // Abbrev [33] 0x85d:0x16 DW_TAG_inlined_subroutine
	.long	911                             // DW_AT_abstract_origin
	.long	.Ltmp70                         // DW_AT_low_pc
	.long	.Ltmp72-.Ltmp70                 // DW_AT_high_pc
	.byte	5                               // DW_AT_call_file
	.byte	57                              // DW_AT_call_line
	.byte	1                               // DW_AT_call_column
	.byte	37                              // Abbrev [37] 0x86d:0x5 DW_TAG_formal_parameter
	.long	923                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	36                              // Abbrev [36] 0x874:0x4e DW_TAG_inlined_subroutine
	.long	983                             // DW_AT_abstract_origin
	.long	.Ldebug_ranges1                 // DW_AT_ranges
	.byte	1                               // DW_AT_call_file
	.byte	200                             // DW_AT_call_line
	.byte	9                               // DW_AT_call_column
	.byte	35                              // Abbrev [35] 0x880:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc20                   // DW_AT_location
	.long	991                             // DW_AT_abstract_origin
	.byte	37                              // Abbrev [37] 0x889:0x5 DW_TAG_formal_parameter
	.long	1002                            // DW_AT_abstract_origin
	.byte	35                              // Abbrev [35] 0x88e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc17                   // DW_AT_location
	.long	1013                            // DW_AT_abstract_origin
	.byte	33                              // Abbrev [33] 0x897:0x2a DW_TAG_inlined_subroutine
	.long	935                             // DW_AT_abstract_origin
	.long	.Ltmp73                         // DW_AT_low_pc
	.long	.Ltmp76-.Ltmp73                 // DW_AT_high_pc
	.byte	8                               // DW_AT_call_file
	.byte	48                              // DW_AT_call_line
	.byte	1                               // DW_AT_call_column
	.byte	35                              // Abbrev [35] 0x8a7:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc18                   // DW_AT_location
	.long	943                             // DW_AT_abstract_origin
	.byte	35                              // Abbrev [35] 0x8b0:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc19                   // DW_AT_location
	.long	954                             // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0x8b9:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	96
	.long	965                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	33                              // Abbrev [33] 0x8c2:0x41 DW_TAG_inlined_subroutine
	.long	1072                            // DW_AT_abstract_origin
	.long	.Ltmp77                         // DW_AT_low_pc
	.long	.Ltmp83-.Ltmp77                 // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	203                             // DW_AT_call_line
	.byte	9                               // DW_AT_call_column
	.byte	35                              // Abbrev [35] 0x8d2:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc21                   // DW_AT_location
	.long	1080                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0x8db:0x8 DW_TAG_formal_parameter
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	88
	.long	1091                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0x8e3:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	80
	.long	1102                            // DW_AT_abstract_origin
	.byte	33                              // Abbrev [33] 0x8ea:0x18 DW_TAG_inlined_subroutine
	.long	887                             // DW_AT_abstract_origin
	.long	.Ltmp80                         // DW_AT_low_pc
	.long	.Ltmp82-.Ltmp80                 // DW_AT_high_pc
	.byte	5                               // DW_AT_call_file
	.byte	58                              // DW_AT_call_line
	.byte	1                               // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0x8fa:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	96
	.long	899                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	33                              // Abbrev [33] 0x903:0x50 DW_TAG_inlined_subroutine
	.long	1119                            // DW_AT_abstract_origin
	.long	.Ltmp83                         // DW_AT_low_pc
	.long	.Ltmp88-.Ltmp83                 // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	204                             // DW_AT_call_line
	.byte	9                               // DW_AT_call_column
	.byte	37                              // Abbrev [37] 0x913:0x5 DW_TAG_formal_parameter
	.long	1127                            // DW_AT_abstract_origin
	.byte	35                              // Abbrev [35] 0x918:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc23                   // DW_AT_location
	.long	1138                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0x921:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	96
	.long	1149                            // DW_AT_abstract_origin
	.byte	33                              // Abbrev [33] 0x928:0x2a DW_TAG_inlined_subroutine
	.long	935                             // DW_AT_abstract_origin
	.long	.Ltmp83                         // DW_AT_low_pc
	.long	.Ltmp88-.Ltmp83                 // DW_AT_high_pc
	.byte	8                               // DW_AT_call_file
	.byte	46                              // DW_AT_call_line
	.byte	1                               // DW_AT_call_column
	.byte	35                              // Abbrev [35] 0x938:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc24                   // DW_AT_location
	.long	943                             // DW_AT_abstract_origin
	.byte	35                              // Abbrev [35] 0x941:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc22                   // DW_AT_location
	.long	954                             // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0x94a:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	96
	.long	965                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	33                              // Abbrev [33] 0x954:0x19 DW_TAG_inlined_subroutine
	.long	887                             // DW_AT_abstract_origin
	.long	.Ltmp88                         // DW_AT_low_pc
	.long	.Ltmp90-.Ltmp88                 // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	217                             // DW_AT_call_line
	.byte	20                              // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0x964:0x8 DW_TAG_formal_parameter
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	80
	.long	899                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	33                              // Abbrev [33] 0x96d:0x19 DW_TAG_inlined_subroutine
	.long	887                             // DW_AT_abstract_origin
	.long	.Ltmp90                         // DW_AT_low_pc
	.long	.Ltmp92-.Ltmp90                 // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	218                             // DW_AT_call_line
	.byte	20                              // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0x97d:0x8 DW_TAG_formal_parameter
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	80
	.long	899                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	38                              // Abbrev [38] 0x986:0x2d4 DW_TAG_lexical_block
	.long	.Ldebug_ranges10                // DW_AT_ranges
	.byte	39                              // Abbrev [39] 0x98b:0xd DW_TAG_variable
	.byte	1                               // DW_AT_location
	.byte	97
	.long	.Linfo_string108                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	239                             // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	38                              // Abbrev [38] 0x998:0x2c1 DW_TAG_lexical_block
	.long	.Ldebug_ranges9                 // DW_AT_ranges
	.byte	30                              // Abbrev [30] 0x99d:0xf DW_TAG_variable
	.long	.Ldebug_loc32                   // DW_AT_location
	.long	.Linfo_string109                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	244                             // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	40                              // Abbrev [40] 0x9ac:0x10 DW_TAG_variable
	.long	.Ldebug_loc37                   // DW_AT_location
	.long	.Linfo_string110                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	271                             // DW_AT_decl_line
	.long	582                             // DW_AT_type
	.byte	40                              // Abbrev [40] 0x9bc:0x10 DW_TAG_variable
	.long	.Ldebug_loc38                   // DW_AT_location
	.long	.Linfo_string111                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	272                             // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	40                              // Abbrev [40] 0x9cc:0x10 DW_TAG_variable
	.long	.Ldebug_loc44                   // DW_AT_location
	.long	.Linfo_string115                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	304                             // DW_AT_decl_line
	.long	531                             // DW_AT_type
	.byte	41                              // Abbrev [41] 0x9dc:0x47 DW_TAG_inlined_subroutine
	.long	1203                            // DW_AT_abstract_origin
	.long	.Ldebug_ranges2                 // DW_AT_ranges
	.byte	1                               // DW_AT_call_file
	.short	315                             // DW_AT_call_line
	.byte	9                               // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0x9e9:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	101
	.long	1211                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0x9f0:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	80
	.long	1222                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0x9f7:0x8 DW_TAG_formal_parameter
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	88
	.long	1233                            // DW_AT_abstract_origin
	.byte	36                              // Abbrev [36] 0x9ff:0x23 DW_TAG_inlined_subroutine
	.long	1161                            // DW_AT_abstract_origin
	.long	.Ldebug_ranges3                 // DW_AT_ranges
	.byte	8                               // DW_AT_call_file
	.byte	62                              // DW_AT_call_line
	.byte	1                               // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0xa0b:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	101
	.long	1169                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xa12:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	80
	.long	1180                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xa19:0x8 DW_TAG_formal_parameter
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	88
	.long	1191                            // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	33                              // Abbrev [33] 0xa23:0x4c DW_TAG_inlined_subroutine
	.long	1119                            // DW_AT_abstract_origin
	.long	.Ltmp108                        // DW_AT_low_pc
	.long	.Ltmp109-.Ltmp108               // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	245                             // DW_AT_call_line
	.byte	9                               // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0xa33:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	80
	.long	1127                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xa3a:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	101
	.long	1138                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xa41:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	95
	.long	1149                            // DW_AT_abstract_origin
	.byte	33                              // Abbrev [33] 0xa48:0x26 DW_TAG_inlined_subroutine
	.long	935                             // DW_AT_abstract_origin
	.long	.Ltmp108                        // DW_AT_low_pc
	.long	.Ltmp109-.Ltmp108               // DW_AT_high_pc
	.byte	8                               // DW_AT_call_file
	.byte	46                              // DW_AT_call_line
	.byte	1                               // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0xa58:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	80
	.long	943                             // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xa5f:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	101
	.long	954                             // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xa66:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	95
	.long	965                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	33                              // Abbrev [33] 0xa6f:0x68 DW_TAG_inlined_subroutine
	.long	1245                            // DW_AT_abstract_origin
	.long	.Ltmp111                        // DW_AT_low_pc
	.long	.Ltmp121-.Ltmp111               // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	246                             // DW_AT_call_line
	.byte	9                               // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0xa7f:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	101
	.long	1253                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xa86:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	100
	.long	1264                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xa8d:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	94
	.long	1275                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xa94:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	95
	.long	1297                            // DW_AT_abstract_origin
	.byte	42                              // Abbrev [42] 0xa9b:0x7 DW_TAG_variable
	.byte	1                               // DW_AT_location
	.byte	80
	.long	1308                            // DW_AT_abstract_origin
	.byte	32                              // Abbrev [32] 0xaa2:0x34 DW_TAG_lexical_block
	.long	.Ltmp111                        // DW_AT_low_pc
	.long	.Ltmp121-.Ltmp111               // DW_AT_high_pc
	.byte	42                              // Abbrev [42] 0xaab:0x7 DW_TAG_variable
	.byte	1                               // DW_AT_location
	.byte	81
	.long	1320                            // DW_AT_abstract_origin
	.byte	38                              // Abbrev [38] 0xab2:0x23 DW_TAG_lexical_block
	.long	.Ldebug_ranges5                 // DW_AT_ranges
	.byte	43                              // Abbrev [43] 0xab7:0x5 DW_TAG_variable
	.long	1332                            // DW_AT_abstract_origin
	.byte	44                              // Abbrev [44] 0xabc:0x9 DW_TAG_variable
	.long	.Ldebug_loc33                   // DW_AT_location
	.long	1343                            // DW_AT_abstract_origin
	.byte	38                              // Abbrev [38] 0xac5:0xf DW_TAG_lexical_block
	.long	.Ldebug_ranges4                 // DW_AT_ranges
	.byte	44                              // Abbrev [44] 0xaca:0x9 DW_TAG_variable
	.long	.Ldebug_loc34                   // DW_AT_location
	.long	1355                            // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	45                              // Abbrev [45] 0xad7:0x44 DW_TAG_inlined_subroutine
	.long	1370                            // DW_AT_abstract_origin
	.long	.Ltmp122                        // DW_AT_low_pc
	.long	.Ltmp127-.Ltmp122               // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.short	261                             // DW_AT_call_line
	.byte	9                               // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0xae8:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	100
	.long	1378                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xaef:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	101
	.long	1389                            // DW_AT_abstract_origin
	.byte	35                              // Abbrev [35] 0xaf6:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc35                   // DW_AT_location
	.long	1400                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xaff:0x8 DW_TAG_formal_parameter
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	80
	.long	1411                            // DW_AT_abstract_origin
	.byte	32                              // Abbrev [32] 0xb07:0x13 DW_TAG_lexical_block
	.long	.Ltmp122                        // DW_AT_low_pc
	.long	.Ltmp127-.Ltmp122               // DW_AT_high_pc
	.byte	44                              // Abbrev [44] 0xb10:0x9 DW_TAG_variable
	.long	.Ldebug_loc36                   // DW_AT_location
	.long	1423                            // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	32                              // Abbrev [32] 0xb1b:0x90 DW_TAG_lexical_block
	.long	.Ltmp127                        // DW_AT_low_pc
	.long	.Ltmp147-.Ltmp127               // DW_AT_high_pc
	.byte	40                              // Abbrev [40] 0xb24:0x10 DW_TAG_variable
	.long	.Ldebug_loc39                   // DW_AT_location
	.long	.Linfo_string112                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	273                             // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	38                              // Abbrev [38] 0xb34:0x76 DW_TAG_lexical_block
	.long	.Ldebug_ranges7                 // DW_AT_ranges
	.byte	40                              // Abbrev [40] 0xb39:0x10 DW_TAG_variable
	.long	.Ldebug_loc40                   // DW_AT_location
	.long	.Linfo_string113                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	278                             // DW_AT_decl_line
	.long	582                             // DW_AT_type
	.byte	32                              // Abbrev [32] 0xb49:0x60 DW_TAG_lexical_block
	.long	.Ltmp135                        // DW_AT_low_pc
	.long	.Ltmp147-.Ltmp135               // DW_AT_high_pc
	.byte	46                              // Abbrev [46] 0xb52:0xe DW_TAG_variable
	.byte	1                               // DW_AT_location
	.byte	85
	.long	.Linfo_string114                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	279                             // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	41                              // Abbrev [41] 0xb60:0x48 DW_TAG_inlined_subroutine
	.long	1436                            // DW_AT_abstract_origin
	.long	.Ldebug_ranges6                 // DW_AT_ranges
	.byte	1                               // DW_AT_call_file
	.short	280                             // DW_AT_call_line
	.byte	17                              // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0xb6d:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	83
	.long	1444                            // DW_AT_abstract_origin
	.byte	35                              // Abbrev [35] 0xb74:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc43                   // DW_AT_location
	.long	1455                            // DW_AT_abstract_origin
	.byte	35                              // Abbrev [35] 0xb7d:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc42                   // DW_AT_location
	.long	1466                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xb86:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	98
	.long	1477                            // DW_AT_abstract_origin
	.byte	44                              // Abbrev [44] 0xb8d:0x9 DW_TAG_variable
	.long	.Ldebug_loc41                   // DW_AT_location
	.long	1488                            // DW_AT_abstract_origin
	.byte	32                              // Abbrev [32] 0xb96:0x11 DW_TAG_lexical_block
	.long	.Ltmp143                        // DW_AT_low_pc
	.long	.Ltmp147-.Ltmp143               // DW_AT_high_pc
	.byte	42                              // Abbrev [42] 0xb9f:0x7 DW_TAG_variable
	.byte	1                               // DW_AT_location
	.byte	88
	.long	1500                            // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	38                              // Abbrev [38] 0xbab:0xad DW_TAG_lexical_block
	.long	.Ldebug_ranges8                 // DW_AT_ranges
	.byte	40                              // Abbrev [40] 0xbb0:0x10 DW_TAG_variable
	.long	.Ldebug_loc45                   // DW_AT_location
	.long	.Linfo_string112                // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.short	305                             // DW_AT_decl_line
	.long	269                             // DW_AT_type
	.byte	45                              // Abbrev [45] 0xbc0:0x97 DW_TAG_inlined_subroutine
	.long	1513                            // DW_AT_abstract_origin
	.long	.Ltmp155                        // DW_AT_low_pc
	.long	.Ltmp166-.Ltmp155               // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.short	306                             // DW_AT_call_line
	.byte	44                              // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0xbd1:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	82
	.long	1525                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xbd8:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	80
	.long	1536                            // DW_AT_abstract_origin
	.byte	34                              // Abbrev [34] 0xbdf:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	99
	.long	1547                            // DW_AT_abstract_origin
	.byte	44                              // Abbrev [44] 0xbe6:0x9 DW_TAG_variable
	.long	.Ldebug_loc47                   // DW_AT_location
	.long	1558                            // DW_AT_abstract_origin
	.byte	33                              // Abbrev [33] 0xbef:0x2b DW_TAG_inlined_subroutine
	.long	1583                            // DW_AT_abstract_origin
	.long	.Ltmp156                        // DW_AT_low_pc
	.long	.Ltmp159-.Ltmp156               // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	92                              // DW_AT_call_line
	.byte	17                              // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0xbff:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	80
	.long	1595                            // DW_AT_abstract_origin
	.byte	35                              // Abbrev [35] 0xc06:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc46                   // DW_AT_location
	.long	1606                            // DW_AT_abstract_origin
	.byte	43                              // Abbrev [43] 0xc0f:0x5 DW_TAG_variable
	.long	1617                            // DW_AT_abstract_origin
	.byte	43                              // Abbrev [43] 0xc14:0x5 DW_TAG_variable
	.long	1628                            // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	32                              // Abbrev [32] 0xc1a:0x3c DW_TAG_lexical_block
	.long	.Ltmp160                        // DW_AT_low_pc
	.long	.Ltmp166-.Ltmp160               // DW_AT_high_pc
	.byte	42                              // Abbrev [42] 0xc23:0x7 DW_TAG_variable
	.byte	1                               // DW_AT_location
	.byte	84
	.long	1570                            // DW_AT_abstract_origin
	.byte	33                              // Abbrev [33] 0xc2a:0x2b DW_TAG_inlined_subroutine
	.long	1583                            // DW_AT_abstract_origin
	.long	.Ltmp161                        // DW_AT_low_pc
	.long	.Ltmp163-.Ltmp161               // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	94                              // DW_AT_call_line
	.byte	19                              // DW_AT_call_column
	.byte	34                              // Abbrev [34] 0xc3a:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	80
	.long	1595                            // DW_AT_abstract_origin
	.byte	35                              // Abbrev [35] 0xc41:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc48                   // DW_AT_location
	.long	1606                            // DW_AT_abstract_origin
	.byte	43                              // Abbrev [43] 0xc4a:0x5 DW_TAG_variable
	.long	1617                            // DW_AT_abstract_origin
	.byte	43                              // Abbrev [43] 0xc4f:0x5 DW_TAG_variable
	.long	1628                            // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	19                              // Abbrev [19] 0xc5a:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp12                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0xc61:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp13                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0xc68:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp38                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0xc6f:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp40                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0xc76:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp52                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0xc7d:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp57                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0xc84:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp69                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0xc8b:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp72                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0xc92:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp79                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0xc99:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp81                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0xca0:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp89                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0xca7:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp91                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0xcae:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp93                         // DW_AT_low_pc
	.byte	19                              // Abbrev [19] 0xcb5:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp106                        // DW_AT_low_pc
	.byte	0                               // End Of Children Mark
	.byte	20                              // Abbrev [20] 0xcbd:0x1d DW_TAG_subprogram
	.long	.Lfunc_begin3                   // DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string91                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	102                             // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	77                              // DW_AT_type
                                        // DW_AT_external
	.byte	19                              // Abbrev [19] 0xcd2:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp173                        // DW_AT_low_pc
	.byte	0                               // End Of Children Mark
	.byte	5                               // Abbrev [5] 0xcda:0x5 DW_TAG_pointer_type
	.long	3295                            // DW_AT_type
	.byte	10                              // Abbrev [10] 0xcdf:0xb DW_TAG_typedef
	.long	3306                            // DW_AT_type
	.long	.Linfo_string96                 // DW_AT_name
	.byte	6                               // DW_AT_decl_file
	.byte	9                               // DW_AT_decl_line
	.byte	11                              // Abbrev [11] 0xcea:0x2d DW_TAG_structure_type
	.long	.Linfo_string96                 // DW_AT_name
	.byte	24                              // DW_AT_byte_size
	.byte	6                               // DW_AT_decl_file
	.byte	4                               // DW_AT_decl_line
	.byte	12                              // Abbrev [12] 0xcf2:0xc DW_TAG_member
	.long	.Linfo_string92                 // DW_AT_name
	.long	3351                            // DW_AT_type
	.byte	6                               // DW_AT_decl_file
	.byte	5                               // DW_AT_decl_line
	.byte	0                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0xcfe:0xc DW_TAG_member
	.long	.Linfo_string94                 // DW_AT_name
	.long	3351                            // DW_AT_type
	.byte	6                               // DW_AT_decl_file
	.byte	6                               // DW_AT_decl_line
	.byte	8                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0xd0a:0xc DW_TAG_member
	.long	.Linfo_string95                 // DW_AT_name
	.long	3351                            // DW_AT_type
	.byte	6                               // DW_AT_decl_file
	.byte	7                               // DW_AT_decl_line
	.byte	16                              // DW_AT_data_member_location
	.byte	0                               // End Of Children Mark
	.byte	10                              // Abbrev [10] 0xd17:0xb DW_TAG_typedef
	.long	496                             // DW_AT_type
	.long	.Linfo_string93                 // DW_AT_name
	.byte	11                              // DW_AT_decl_file
	.byte	22                              // DW_AT_decl_line
	.byte	0                               // End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Ltmp67
	.long	.Ltmp68
	.long	.Ltmp70
	.long	.Ltmp73
	.long	0
	.long	0
.Ldebug_ranges1:
	.long	.Ltmp69
	.long	.Ltmp70
	.long	.Ltmp73
	.long	.Ltmp76
	.long	0
	.long	0
.Ldebug_ranges2:
	.long	.Ltmp101
	.long	.Ltmp102
	.long	.Ltmp103
	.long	.Ltmp104
	.long	0
	.long	0
.Ldebug_ranges3:
	.long	.Ltmp101
	.long	.Ltmp102
	.long	.Ltmp103
	.long	.Ltmp104
	.long	0
	.long	0
.Ldebug_ranges4:
	.long	.Ltmp114
	.long	.Ltmp115
	.long	.Ltmp117
	.long	.Ltmp121
	.long	0
	.long	0
.Ldebug_ranges5:
	.long	.Ltmp112
	.long	.Ltmp113
	.long	.Ltmp114
	.long	.Ltmp121
	.long	0
	.long	0
.Ldebug_ranges6:
	.long	.Ltmp135
	.long	.Ltmp136
	.long	.Ltmp140
	.long	.Ltmp147
	.long	0
	.long	0
.Ldebug_ranges7:
	.long	.Ltmp129
	.long	.Ltmp130
	.long	.Ltmp131
	.long	.Ltmp132
	.long	.Ltmp135
	.long	.Ltmp147
	.long	0
	.long	0
.Ldebug_ranges8:
	.long	.Ltmp147
	.long	.Ltmp148
	.long	.Ltmp150
	.long	.Ltmp166
	.long	0
	.long	0
.Ldebug_ranges9:
	.long	.Ltmp100
	.long	.Ltmp102
	.long	.Ltmp103
	.long	.Ltmp104
	.long	.Ltmp105
	.long	.Ltmp166
	.long	0
	.long	0
.Ldebug_ranges10:
	.long	.Ltmp94
	.long	.Ltmp95
	.long	.Ltmp98
	.long	.Ltmp166
	.long	0
	.long	0
.Ldebug_ranges11:
	.long	.Lfunc_begin0
	.long	.Lfunc_end0
	.long	.Lfunc_begin1
	.long	.Lfunc_end1
	.long	.Lfunc_begin2
	.long	.Lfunc_end2
	.long	.Lfunc_begin3
	.long	.Lfunc_end3
	.long	0
	.long	0
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 12.0.0 (https://github.com/upmem/llvm-project.git 846fdda8285dcc9b20ee5d2fec9e54dfea6a8928)" // string offset=0
.Linfo_string1:
	.asciz	"dpu/task.c"                    // string offset=106
.Linfo_string2:
	.asciz	"/mnt/host_cwd/BIM"             // string offset=117
.Linfo_string3:
	.asciz	"kernels"                       // string offset=135
.Linfo_string4:
	.asciz	"int"                           // string offset=143
.Linfo_string5:
	.asciz	"__ARRAY_SIZE_TYPE__"           // string offset=147
.Linfo_string6:
	.asciz	"DPU_INPUT_ARGUMENTS"           // string offset=167
.Linfo_string7:
	.asciz	"size_bytes"                    // string offset=187
.Linfo_string8:
	.asciz	"model"                         // string offset=198
.Linfo_string9:
	.asciz	"unsigned int"                  // string offset=204
.Linfo_string10:
	.asciz	"uint32_t"                      // string offset=217
.Linfo_string11:
	.asciz	"u32"                           // string offset=226
.Linfo_string12:
	.asciz	"order"                         // string offset=230
.Linfo_string13:
	.asciz	"thresholds"                    // string offset=236
.Linfo_string14:
	.asciz	"hash_params"                   // string offset=247
.Linfo_string15:
	.asciz	"inputs"                        // string offset=259
.Linfo_string16:
	.asciz	"outputs"                       // string offset=266
.Linfo_string17:
	.asciz	"components_t"                  // string offset=274
.Linfo_string18:
	.asciz	"model_params"                  // string offset=287
.Linfo_string19:
	.asciz	"raw_block_size"                // string offset=300
.Linfo_string20:
	.asciz	"num_bits"                      // string offset=315
.Linfo_string21:
	.asciz	"block_size"                    // string offset=324
.Linfo_string22:
	.asciz	"num_filters"                   // string offset=335
.Linfo_string23:
	.asciz	"filter_inputs"                 // string offset=347
.Linfo_string24:
	.asciz	"filter_entries"                // string offset=361
.Linfo_string25:
	.asciz	"filter_hashes"                 // string offset=376
.Linfo_string26:
	.asciz	"dpu_model_params_t"            // string offset=390
.Linfo_string27:
	.asciz	"num_inputs"                    // string offset=409
.Linfo_string28:
	.asciz	"kernel"                        // string offset=420
.Linfo_string29:
	.asciz	"kernel1"                       // string offset=427
.Linfo_string30:
	.asciz	"nr_kernels"                    // string offset=435
.Linfo_string31:
	.asciz	"dpu_params_t"                  // string offset=446
.Linfo_string32:
	.asciz	"DPU_RESULTS"                   // string offset=459
.Linfo_string33:
	.asciz	"count"                         // string offset=471
.Linfo_string34:
	.asciz	"long unsigned int"             // string offset=477
.Linfo_string35:
	.asciz	"uint64_t"                      // string offset=495
.Linfo_string36:
	.asciz	"u64"                           // string offset=504
.Linfo_string37:
	.asciz	"dpu_results_t"                 // string offset=508
.Linfo_string38:
	.asciz	"unsigned char"                 // string offset=522
.Linfo_string39:
	.asciz	"uint8_t"                       // string offset=536
.Linfo_string40:
	.asciz	"u8"                            // string offset=544
.Linfo_string41:
	.asciz	"unsigned short"                // string offset=547
.Linfo_string42:
	.asciz	"uint16_t"                      // string offset=562
.Linfo_string43:
	.asciz	"u16"                           // string offset=571
.Linfo_string44:
	.asciz	"stride"                        // string offset=575
.Linfo_string45:
	.asciz	"data"                          // string offset=582
.Linfo_string46:
	.asciz	"mat_u16"                       // string offset=587
.Linfo_string47:
	.asciz	"filters"                       // string offset=595
.Linfo_string48:
	.asciz	"mat_u8"                        // string offset=603
.Linfo_string49:
	.asciz	"__atomic_bit_barrier_reset_barrier" // string offset=610
.Linfo_string50:
	.asciz	"__atomic_bit_barrier_initialization_barrier" // string offset=645
.Linfo_string51:
	.asciz	"me"                            // string offset=689
.Linfo_string52:
	.asciz	"sysname_t"                     // string offset=692
.Linfo_string53:
	.asciz	"wram_alloc_u8"                 // string offset=702
.Linfo_string54:
	.asciz	"len"                           // string offset=716
.Linfo_string55:
	.asciz	"wram_alloc_u16"                // string offset=720
.Linfo_string56:
	.asciz	"mram_read"                     // string offset=735
.Linfo_string57:
	.asciz	"from"                          // string offset=745
.Linfo_string58:
	.asciz	"to"                            // string offset=750
.Linfo_string59:
	.asciz	"nb_of_bytes"                   // string offset=753
.Linfo_string60:
	.asciz	"mram_read_u16"                 // string offset=765
.Linfo_string61:
	.asciz	"mat_u16_init"                  // string offset=779
.Linfo_string62:
	.asciz	"mat"                           // string offset=792
.Linfo_string63:
	.asciz	"rows"                          // string offset=796
.Linfo_string64:
	.asciz	"cols"                          // string offset=801
.Linfo_string65:
	.asciz	"mat_u8_init"                   // string offset=806
.Linfo_string66:
	.asciz	"mram_read_u8"                  // string offset=818
.Linfo_string67:
	.asciz	"mram_write"                    // string offset=831
.Linfo_string68:
	.asciz	"mram_write_u8"                 // string offset=842
.Linfo_string69:
	.asciz	"encode_buffer"                 // string offset=856
.Linfo_string70:
	.asciz	"input"                         // string offset=870
.Linfo_string71:
	.asciz	"output"                        // string offset=876
.Linfo_string72:
	.asciz	"thresholds_chunk"              // string offset=883
.Linfo_string73:
	.asciz	"it"                            // string offset=900
.Linfo_string74:
	.asciz	"input_el"                      // string offset=903
.Linfo_string75:
	.asciz	"output_ptr"                    // string offset=912
.Linfo_string76:
	.asciz	"bit_it"                        // string offset=923
.Linfo_string77:
	.asciz	"reorder"                       // string offset=930
.Linfo_string78:
	.asciz	"h3_hash"                       // string offset=938
.Linfo_string79:
	.asciz	"params"                        // string offset=946
.Linfo_string80:
	.asciz	"result"                        // string offset=953
.Linfo_string81:
	.asciz	"i"                             // string offset=960
.Linfo_string82:
	.asciz	"and_reduce"                    // string offset=962
.Linfo_string83:
	.asciz	"lookup_table"                  // string offset=973
.Linfo_string84:
	.asciz	"get_bit"                       // string offset=986
.Linfo_string85:
	.asciz	"index"                         // string offset=994
.Linfo_string86:
	.asciz	"byte"                          // string offset=1000
.Linfo_string87:
	.asciz	"bit"                           // string offset=1005
.Linfo_string88:
	.asciz	"counter_start"                 // string offset=1009
.Linfo_string89:
	.asciz	"counter_stop"                  // string offset=1023
.Linfo_string90:
	.asciz	"fused_kernel"                  // string offset=1036
.Linfo_string91:
	.asciz	"main"                          // string offset=1049
.Linfo_string92:
	.asciz	"start"                         // string offset=1054
.Linfo_string93:
	.asciz	"perfcounter_t"                 // string offset=1060
.Linfo_string94:
	.asciz	"end"                           // string offset=1074
.Linfo_string95:
	.asciz	"end2"                          // string offset=1078
.Linfo_string96:
	.asciz	"perfcounter_count"             // string offset=1083
.Linfo_string97:
	.asciz	"tasklet_id"                    // string offset=1101
.Linfo_string98:
	.asciz	"p"                             // string offset=1112
.Linfo_string99:
	.asciz	"addresses"                     // string offset=1114
.Linfo_string100:
	.asciz	"thresh_per_skew"               // string offset=1124
.Linfo_string101:
	.asciz	"j"                             // string offset=1140
.Linfo_string102:
	.asciz	"hashes"                        // string offset=1142
.Linfo_string103:
	.asciz	"encoded"                       // string offset=1149
.Linfo_string104:
	.asciz	"pbuffer1"                      // string offset=1157
.Linfo_string105:
	.asciz	"filter_reductions"             // string offset=1166
.Linfo_string106:
	.asciz	"reordered"                     // string offset=1184
.Linfo_string107:
	.asciz	"pbuffer2"                      // string offset=1194
.Linfo_string108:
	.asciz	"sample_it"                     // string offset=1203
.Linfo_string109:
	.asciz	"input_addr"                    // string offset=1213
.Linfo_string110:
	.asciz	"hash_ptr"                      // string offset=1224
.Linfo_string111:
	.asciz	"input_chunk"                   // string offset=1233
.Linfo_string112:
	.asciz	"filter_it"                     // string offset=1245
.Linfo_string113:
	.asciz	"hash_param_row"                // string offset=1255
.Linfo_string114:
	.asciz	"hash_it"                       // string offset=1270
.Linfo_string115:
	.asciz	"filter_ptr"                    // string offset=1278
	.addrsig
	.addrsig_sym fused_kernel
	.addrsig_sym reset_barrier
	.addrsig_sym DPU_INPUT_ARGUMENTS
	.addrsig_sym __sys_used_mram_end
	.addrsig_sym initialization_barrier
	.addrsig_sym DPU_RESULTS
	.section	.debug_line,"",@progbits
.Lline_table_start0:
