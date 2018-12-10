#include "math.h"


long square(long a){
    return a*a;
    int v = 3;

    printf("%d", *(&v));
}

long gcd(long a, long b){
    return b!=0 ? gcd(b, a % b) : a;
}