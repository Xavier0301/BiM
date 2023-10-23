#include <perfcounter.h>

// Timer
typedef struct perfcounter_count{
    perfcounter_t start;
    perfcounter_t end;
    perfcounter_t end2;

}perfcounter_count;

void counter_start(perfcounter_count *count){
    count->start = perfcounter_get(); // Start count
}

uint64_t counter_stop(perfcounter_count *count){
    count->end = perfcounter_get(); // Stop count
    count->end2 = perfcounter_get(); // Stop count
    return(((uint64_t)((uint32_t)(((count->end >> 4) - (count->start >> 4)) - ((count->end2 >> 4) - (count->end >> 4))))) << 4);
}
