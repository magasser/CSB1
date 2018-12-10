#include <stdio.h>

void bubbleSort(char *array, int size){
    for(int i = 0; i < size; i++){
        for(int j = 0; j < size; j++){
            if(array[j] < array[i]){
                char temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
}

int main (){
    char stringArray[] = {"Bonjour", "Gruetzi", "Gruess Euch", 
    "Salut", "Guten Morgen", "Bienvenue en cours", "Hello"};

    int size = 7;
    bubbleSort(stringArray, size);

    for(int i = 0; i < size; i++){
        puts(stringArray[i]);
    }
}