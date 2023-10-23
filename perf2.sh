#!/bin/bash

declare -a DPUS=(256 512 1024 1536 2000 2549)
declare -a SAMPLES=(500 1000 2500 5000 10000 20000 40000)

ss_samples=8000000

ws_samples_min=3138
ws_samples_total=$(($ws_samples_min * 2549))

echo "DPU weak scaling: 256-1856 dpus, 11 tasklets, ${ws_samples_min} samples per dpu"
for i in $(seq 0 5); do
    make clean &> /dev/null
    NR_DPUS=${DPUS[$i]} NR_TASKLETS=16 PRINT=0 PERF=CYCLES CHECK_RES=0 FORMAT=CSV make &> /dev/null
    WORK=$((${DPUS[$i]} * $ws_samples_min))
    ./bin/host_code -i $WORK 2> /dev/null | grep -a "results_and_timings"
done

echo "DPU strong scaling: 256-1856 dpus, 11 tasklets, ${ss_samples} samples total"
for i in $(seq 0 5); do
    make clean &> /dev/null
    NR_DPUS=${DPUS[$i]} NR_TASKLETS=16 PRINT=0 PERF=CYCLES CHECK_RES=0 FORMAT=CSV make &> /dev/null
    ./bin/host_code -i $ss_samples 2> /dev/null | grep -a "results_and_timings"
done

# NR_DPUS=1 NR_TASKLETS=11 PRINT=1 CHECK_RES=1 PERF=INSTRUCTION make

# NR_DPUS=2549 NR_TASKLETS=11 PRINT=0 PERF=INSTRUCTION CHECK_RES=0 make
