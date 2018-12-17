#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

long factorial(int input) {
    long result = 1;
    for(long i = 1; i <= input; i++){
        result *= i;
    }
    
    return result;
}

int main( int argc, char *argv[] ){
    float x;
    if( argc != 2) {
        return 1;
    }

    x = atof(argv[1]);
    printf("%lf\n", log10(x));
    printf("%ld\n", factorial(x));
   return 0;
}

