#include <stdio.h>
#include <string.h>


// Functions
void quickSort(int *numbers, int size){
    int temp[size];

    for(int i = 0; i < size; i++){
        temp[i] = *numbers;
        numbers++;
    }

    int lastIndex = sizeof(temp) / sizeof(int) - 1; 

    printf("%d\n", lastIndex);
    int pivot = temp[lastIndex];

    int j = lastIndex;

    for(int i = 0; i < j; i++){
        if(temp[i] > pivot){
            int t = temp[i];
            for(int k = i; i < lastIndex - 1; k++){
                temp[k] = temp[k+1];
            }
            temp[lastIndex] = t;
        }
    }

    for(int i = 0; i <= lastIndex; i++){
        printf("%d ", temp[i]);
    }
    printf("\n");
}

int main(){
    int numbers[] = {9, 3, 1, 8 ,6, 4, 7, 0, 2};

    quickSort(numbers, sizeof(numbers) / sizeof(int));

    return 0;
}