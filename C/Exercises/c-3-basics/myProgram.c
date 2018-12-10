#include <stdio.h>

#include "math.h"

int main(){
    long a = 100;
    long b = 364;
    int v = 3;

    printf("%d", *(&v));

    puts("Enter two numbers:");

    if(1 != scanf("%ld", &a)){
        puts("Error");
        return 1;
    }
    if(1 != scanf("%ld", &b)){
        puts("Error");
        return 1;
    }

    printf("Square of %ld is: %ld\n", a, square(a));
    printf("GCD of %ld and %ld is: %ld\n", a, b, gcd(a, b));

    return 0;
}