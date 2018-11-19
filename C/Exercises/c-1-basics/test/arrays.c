#include <stdio.h>

int arrayLength(int *array){

    return sizeof(array);
}

int main(){
    int array[] = {0, 1, 2, 3, 4, 5};

    int length = arrayLength(array);

    printf("%d\n", length);

    return 0;
}