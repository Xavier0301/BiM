DPU_DIR := dpu
HOST_DIR := host
BUILDDIR ?= bin
CBTHOWEN_DIR := cbthowen
NR_DPUS ?= 1 # max nr of dpus. The model parallelism will scale accordingly
NR_TASKLETS ?= 11 # => 11 is the minimum recommended number of tasklets. Keeping it as low as possible helps with model sharing
PRINT ?= 0 # Can be 1
PERF ?= NO # Can be INSTRUCTIONS or CYCLES
CHECK_RES ?= 0 # Can be 1
FORMAT ?= NO # Can be CSV

HASH ?= FAST_HASH
ENCODING ?= STRIDED_ENCODING
REORDERING ?= REORDER_SECOND

define conf_filename
	${BUILDDIR}/.DPUS_$(0)_PRINT_$(1)_PERF_$(2)_CHECK_RES_$(3)_FORMAT_$(4).conf
endef
CONF := $(call conf_filename,${NR_DPUS},${PRINT},${PERF},${CHECK_RES},${FORMAT})

HOST_TARGET := ${BUILDDIR}/host_code
DPU_TARGET := ${BUILDDIR}/dpu_code

COMMON_INCLUDES := support

ALL_HOST_SOURCES := $(wildcard ${CBTHOWEN_DIR}/*.c ${HOST_DIR}/*.c) # collect all sources..
HOST_SOURCES := $(filter-out ${CBTHOWEN_DIR}/main.c, $(ALL_HOST_SOURCES)) # ..and exclude the unwanted main.c from libcbthowen
DPU_SOURCES := $(wildcard ${DPU_DIR}/*.c)

.PHONY: all clean test

__dirs := $(shell mkdir -p ${BUILDDIR})

COMMON_FLAGS := -Wall -Wextra -g -I${COMMON_INCLUDES}
HOST_FLAGS := ${COMMON_FLAGS} -std=c11 -O3 -lm `dpu-pkg-config --cflags --libs dpu` \
	-DNR_DPUS=${NR_DPUS} -DNR_TASKLETS=${NR_TASKLETS} -DPRINT=${PRINT} -D${PERF} -DCHECK_RES=${CHECK_RES} -D${FORMAT} \
	-D${HASH} -D${ENCODING} -D${REORDERING}
DPU_FLAGS := ${COMMON_FLAGS} -O2 -DNR_TASKLETS=${NR_TASKLETS} -DPRINT=${PRINT} -D${PERF} -DCHECK_RES=${CHECK_RES} -D${FORMAT}

DPU_PROFILING_FLAGS := 

all: ${HOST_TARGET} ${DPU_TARGET}

${CONF}:
	$(RM) $(call conf_filename,*,*)
	touch ${CONF}

${HOST_TARGET}: ${HOST_SOURCES} ${COMMON_INCLUDES} ${CONF}
	$(CC) -o $@ ${HOST_SOURCES} ${HOST_FLAGS}

${DPU_TARGET}: ${DPU_SOURCES} ${COMMON_INCLUDES} ${CONF}
	dpu-upmem-dpurte-clang ${DPU_FLAGS} ${DPU_PROFILING_FLAGS} -o $@ ${DPU_SOURCES}

profile:
	$(MAKE) ${HOST_TARGET} PERF=EXT_PROFILE
	$(MAKE) ${DPU_TARGET} PERF=EXT_PROFILE DPU_PROFILING_FLAGS=-pg

assembler: ${DPU_SOURCES} ${COMMON_INCLUDES} ${CONF}
	dpu-upmem-dpurte-clang ${DPU_FLAGS} ${DPU_PROFILING_FLAGS} -S -fverbose-asm -o $@.s ${DPU_SOURCES}

clean:
	$(RM) -r $(BUILDDIR)

test: all
	./${HOST_TARGET}

# rsync -a ./PIMbthowen2/ upmemcloud5:/home/upmem0013/xservot/PIMbthowen2
