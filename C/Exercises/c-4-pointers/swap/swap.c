#include <stdio.h>


void swap(int *pi, int *pj){
    *pi = *pi ^ *pj;
    *pj = *pi ^ *pj;
    *pi = *pi ^ *pj;
}

int main(){

    int i;
    int j;

    puts("Enter two numbers:");
    scanf("%d %d", &i, &j);

    printf("\nBefore swap: i=%d, j=%d\n", i, j);

    swap(&i, &j);

    printf("After swap: i=%d, j=%d\n", i, j);

    return 0;
}