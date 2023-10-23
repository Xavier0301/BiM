#ifndef _PARAMS_H_
#define _PARAMS_H_

#include "common.h"

typedef struct Params {
    unsigned int   num_samples;
    int   n_warmup;
    int   n_reps;
    int n_models;
}Params;

static void usage() {
    fprintf(stderr,
        "\nUsage:  ./program [options]"
        "\n"
        "\nGeneral options:"
        "\n    -h        help"
        "\n    -w <W>    # of untimed warmup iterations (default=0)"
        "\n    -e <E>    # of timed repetition iterations (default=1)"
        "\n"
        "\nWorkload-specific options:"
        "\n    -i <I>    number of MNIST samples to be processed per DPU transfer (default=1 elements)"
        "\n");
}

struct Params input_params(int argc, char **argv) {
    struct Params p;
    p.num_samples    = 1;
    p.n_warmup      = 0;
    p.n_reps        = 1;
    p.n_models        = 1;

    int opt;
    while((opt = getopt(argc, argv, "h:i:w:e:m:")) >= 0) {
        switch(opt) {
        case 'h':
        usage();
        exit(0);
        break;
        case 'i': p.num_samples    = atoi(optarg); break;
        case 'w': p.n_warmup      = atoi(optarg); break;
        case 'e': p.n_reps        = atoi(optarg); break;
        case 'm': p.n_models        = atoi(optarg); break;
        default:
            fprintf(stderr, "\nUnrecognized option!\n");
            usage();
            exit(0);
        }
    }
    assert(p.n_models > 0 && "Invalid # of dpus!");

    return p;
}
#endif
