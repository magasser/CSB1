#include <stdio.h>

#define PI 3.1415926

int main(){

    float radius;
    float area;
    float perimeter;

    puts("Enter radius:");
    scanf("%f", &radius);

    area = PI*(radius*radius);
    perimeter = 2*PI*radius;

    printf("Area: %f, Perimeter: %f\n", area, perimeter);

    return 0;
}