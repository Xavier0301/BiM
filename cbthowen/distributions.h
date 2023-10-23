#pragma once

#include <stdlib.h>
#include <math.h>
#include <stdint.h>

#include "tensor.h"
#include "types.h"

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

/************* UNIFORM ***********/
u32 unif_rand(u32 max);

u32 unif_rand_range(u32 min, u32 max);

void shuffle_array(u16* array, u32 length);

/************* GAUSSIAN ***********/
// Returns a random number sampled from N(0,1)
double gauss_rand();

// Inverse of the error function erf
double erf_inv(double x);

// Quantile of Gaussian distribution  
double gauss_inv(double p);
