#include "distributions.h"

/************* UNIFORM ***********/
// return a random number between 0 and max inclusive.
u32 unif_rand(u32 max) {
    u32 divisor = RAND_MAX / (max + 1);
    u32 retval;

    do { 
        retval = rand() / divisor;
    } while (retval > max);

    return retval;
}

u32 unif_rand_range(u32 min, u32 max) {
    return unif_rand(max - min) + min;
}

void swap(u16* a, u16* b) {
    u16 tmp = *a;
    *a = *b;
    *b = tmp;
}

void shuffle_array(u16* array, u32 length) {
    for(u32 i = length - 1; i >= 1; --i) {
        u32 j = unif_rand(i);
        swap(array + i, array + j);
    }
}

/************* GAUSSIAN ***********/
// From TAOCP Knuth
double gauss_rand() {
    static double V1, V2, S;
    static int phase = 0;
    double X;

    if(phase == 0) {
        do {
            double U1 = (double) rand() / RAND_MAX;
            double U2 = (double) rand() / RAND_MAX;

            V1 = 2 * U1 - 1;
            V2 = 2 * U2 - 1;
            S = V1 * V1 + V2 * V2;
        } while(S >= 1 || S == 0);

        X = V1 * sqrt(-2 * log(S) / S);
    } else {
        X = V2 * sqrt(-2 * log(S) / S);
    }

    phase = 1 - phase;

    return X;
}

#define erfinv_a3 -0.140543331
#define erfinv_a2 0.914624893
#define erfinv_a1 -1.645349621
#define erfinv_a0 0.886226899

#define erfinv_b4 0.012229801
#define erfinv_b3 -0.329097515
#define erfinv_b2 1.442710462
#define erfinv_b1 -2.118377725
#define erfinv_b0 1

#define erfinv_c3 1.641345311
#define erfinv_c2 3.429567803
#define erfinv_c1 -1.62490649
#define erfinv_c0 -1.970840454

#define erfinv_d2 1.637067800
#define erfinv_d1 3.543889200
#define erfinv_d0 1

#include "stdio.h"

// From math.c of the libit C library: https://libit.sourceforge.net/math_8c-source.html
double erf_inv(double x) {
    double x2, r, y;
    int  sign_x;

    if (x < -1 || x > 1) return NAN;

    if (x == 0) return 0;

    if (x > 0) {
        sign_x = 1;
    } else {
        sign_x = -1;
        x = -x;
    }

    if (x <= 0.7) {
        x2 = x * x;
        r =
        x * (((erfinv_a3 * x2 + erfinv_a2) * x2 + erfinv_a1) * x2 + erfinv_a0);
        r /= (((erfinv_b4 * x2 + erfinv_b3) * x2 + erfinv_b2) * x2 +
        erfinv_b1) * x2 + erfinv_b0;
    } else {
        y = sqrt (-log ((1 - x) / 2));
        r = (((erfinv_c3 * y + erfinv_c2) * y + erfinv_c1) * y + erfinv_c0);
        r /= ((erfinv_d2 * y + erfinv_d1) * y + erfinv_d0);
    }

    r = r * sign_x;
    x = x * sign_x;

    r -= (erf (r) - x) / (2 / sqrt (M_PI) * exp (-r * r));
    r -= (erf (r) - x) / (2 / sqrt (M_PI) * exp (-r * r));

    return r;
}

// https://statproofbook.github.io/P/norm-qf.html
double gauss_inv(double p) {
    return sqrt(2) * erf_inv(2 * p - 1);
}
