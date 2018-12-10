#include <stdio.h>
#include <stdlib.h>

#define new_array(n, t)     (t*)malloc(n*sizeof(t))

void minmax(int *a, int size, int *min, int *max){
    *min = *a;
    *max = *a;

    for(int *b = a; a-b < size; a++){
        if(*a < *min){
            *min = *a;
        }
        else if(*a > *max){
            *max = *a;
        }
    }
}

int main(){
    int *array = new_array(5, int);

    *(array) = 34; 
    *(array + 1) = 54;
    *(array + 2) = 2;
    *(array + 3) = 42;
    *(array + 4) = 78;

    int min;
    int max;


    minmax(array, 5, &min, &max);

    printf("Min: %d, Max: %d\n", min, max);

}