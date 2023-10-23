# About

Implementation of the BTHOWeN Weightless Neural Network architecture on an UpMem Processing-in-Memory system. 

# What is going on during BTHOWeN inference?

For now, let's focus on inference, assuming we have a pre-trained model. In BTHOWeN, inference can be discretized in multiple steps:

1. The input is binarized.
2. Input remapping to a pre-defined random order.
3. The whole input is being forwarded to each discriminator.
4. Each discriminator decomposes the input into a number of chunks equal to the number of filters they contain.
5. Each chunk is being hashed k times, producing k hashes (k is predefined, it is 2 in MNIST-Small for example).
6. Each filter is probed k times (once for each has produced), and we take the minimum of these probes to be the result.
7. A popcount is performed on all hash output for each discriminator.
8. The discriminator with the highest popcount is taken to be the correct class.

# Naive PiM implementation

The problem we need to solve is how to divide the work between Host and DPU, and how to divide the work within a DPU. Before we do any smart division of work, we need to establish a naive baseline implementation:

1. Host: input binarization and remapping.

Host -> DPU transfer of the input, or multiple inputs.

2. DPU: Have a number of tasklets that correspond to the number of inputs received. Have each tasklet work on the whole inference.

# Considerations for a PiM implementation

1. MRAM is 64 MB
2. WRAM is 64 KB

## MNIST-Small

If we take the MNIST-Small model of 70 KiB as a reference:

3. Each input is 1500 bits, or 1500 B if we don't pack it
4. Each input is decomposed into around 50 chunks of 28b (or B, easy division if we don't pack)
5. Each of these 50 chunks is hashed into 2 different numbers in the [0; 1023] range
6. 500 filters process each of these 2 numbers one by one, applying a min-reduction to the output
7. Each discriminator take these 50 results and apply a popcount
8. The model take these 10 popcounts and outputs the argmax

## MNIST-Large

If we take the MNIST-Large model of 960 KiB as a reference:

3. Each input is 5000 bits, or 5000 B if we don't pack it
4. Each input is decomposed into around 100 chunks of 49b (or B, easy division if we don't pack)
5. Each of these 100 chunks is hashed into 4 different numbers in the [0; 8191] range
6. 1000 filters process each of these 4 numbers one by one, applying a min-reduction to the output
7. Each discriminator take these 100 results and apply a popcount
8. The model take these 10 popcounts and outputs the argmax

# PiM implementation: targeted for MNIST-Small

The whole model almost fits into the WRAM. 
I am not sure what is the load of hashing vs. filters, but a pool of tasklets will be reserved for hashing and another will be reserved for filters.

1. Host: input binarization and remapping.
2. (Host: hashing, or do it in the DPUs)

Host -> DPU transfer of the input, or multiple inputs.

2. (DPU: hashing. We can divide the hashing work in the following way: each tasklet takes charge of hashing (#Chunks / #Hashing_Tasklets) chunks. 
It is best if the work is done in a consistently predictible pattern (like from chunk 0 to the last chunk), so that tasklets working on filters can start working in parallel).
3. DPU: we need to do around 2*500 filter probes for each input. We can divide it by first considering that a tasklet can do work across all discriminators and across only a subset of filters. The exact amount of chunks each tasklet needs to be preocupied with is: (#Discriminators * (#Chunks / #Filter_Tasklets)).
4. DPU: we can distribute popcounts among filter tasklets as well.

# PiM implementation: targeted for MNIST-Large

Each discriminator almost fits into the WRAM. It's more advantageous to do hashing in the host to reuse the results

1. Host: input binarization and remapping.
2. Host: input hashing.

Host -> 10 parallel DPU transfer of hashed input, or multiple hashed inputs.

3. DPU: we can simply and elegantly divide the work to be done: each tasklets takes charge of (#Filters / #Tasklets) filters.
4. DPU: we can distribute the popcount between tasklets as well.

DPU -> Host transfer of the result, or a batch of results.

5. Host: compute the argmax
