#!/bin/bash

declare -a DPU_COUNTS=(1 2 4 8 16 32 64)
declare -a TYPES=("CHAR" "SHORT" "INT32" "INT64" "FLOAT" "DOUBLE")
declare -a SIZES=(8388608 4194304 2097152 1048576 2097152 1048576)

for k in "${!DPU_COUNTS[@]}"; do
    for i in $(seq 1 24); do
        for j in "${!SIZES[@]}"; do
            echo "#tasklets: $i, #dpu: ${DPU_COUNTS[$k]}, type: ${TYPES[$j]}, size: ${SIZES[$j]}"
            make clean &> /dev/null
            NR_DPUS=${DPU_COUNTS[$k]} NR_TASKLETS=$i BLOCK=9 TYPE=${TYPES[$j]} TRANSFER=PARALLEL PRINT=0 PERF=NO make &> /dev/null
            ./bin/host_code -w 0 -e 1 -i ${SIZES[$j]} -a 20 2> /dev/null | grep "Outputs"
        done
    done
done
