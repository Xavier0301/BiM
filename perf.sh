#!/bin/bash

declare -a DPUS=(1 2 4 8 16 32 64 128 192)
declare -a TASKLETS=(1 2 3 4 5 6 9 12 16 20 24)
declare -a SAMPLES=(500 1000 2500 5000 10000 20000 40000)

samples_min=40000
samples_total=$(($samples_min * 64))

echo "DPU weak scaling: 1-64 dpus, 16 tasklets, ${samples_min} samples per dpu"
for i in $(seq 7 8); do
    make clean &> /dev/null
    NR_DPUS=${DPUS[$i]} NR_TASKLETS=16 PRINT=0 PERF=CYCLES CHECK_RES=0 FORMAT=CSV make &> /dev/null
    WORK=$((${DPUS[$i]} * $samples_min))
    ./bin/host_code -i $WORK 2> /dev/null | grep -a "results_and_timings"
done

echo "DPU strong scaling: 1-64 dpus, 16 tasklets, 40k samples total"
for i in $(seq 7 8); do
    make clean &> /dev/null
    NR_DPUS=${DPUS[$i]} NR_TASKLETS=16 PRINT=0 PERF=CYCLES CHECK_RES=0 FORMAT=CSV make &> /dev/null
    ./bin/host_code -i $samples_min 2> /dev/null | grep -a "results_and_timings"
done

# Scale the number of tasklets while keeping the number of samples 40k
echo "Tasklet scaling: 1 dpu, 1-24 tasklets, 40k samples"
for i in $(seq 0 10); do
    make clean &> /dev/null
    NR_DPUS=1 NR_TASKLETS=${TASKLETS[$i]} PRINT=0 PERF=CYCLES CHECK_RES=0 FORMAT=CSV make &> /dev/null
    ./bin/host_code -i 40000 2> /dev/null | grep -a "results_and_timings"
done

# # Scale the number of samples while keeping the tasklet count 16
echo "Sample scaling: 1 dpu, 16 tasklets, 500-40k samples"
for i in $(seq 0 6); do
    make clean &> /dev/null
    NR_DPUS=1 NR_TASKLETS=16 PRINT=0 PERF=CYCLES CHECK_RES=0 FORMAT=CSV make &> /dev/null
    ./bin/host_code -i ${SAMPLES[$i]} 2> /dev/null | grep -a "results_and_timings"
done

# NR_DPUS=1 NR_TASKLETS=16 PRINT=1 PERF=INSTRUCTION CHECK_RES=1 make
