#include <stdio.h>

int main(){

    signed int number;
do{
    printf("Type a number: ");
    scanf("%d", &number);

    int factors[100];
    int factor = 0;
    signed int ref = number;

    if(ref < 0){
        factors[factor++] = -1;
        ref *= -1;
        number *= -1;
    }

    while(number % 2 == 0){
        number /= 2;
        factors[factor++] = 2;
    }

    for(unsigned int i = 3; i <= ref; i += 2){
        if(number % i == 0){
            factors[factor++] = i;
            number /= i;
            i -= 2;
        }
    }
    
    int l = sizeof(factors);

    for(unsigned int i = 0; i < factor; i++){
        printf("%d\n", factors[i]);
    }
}while(number != 0);

    return 0;
}