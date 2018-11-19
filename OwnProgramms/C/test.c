#include <stdio.h>

#define EXIT_0 0

#define DVB "Division by 0 !"

int main(){
    printf("Calculate:\n");

    int number1;
    int number2;
    char operand[1];

    printf("Number 1: ");
    scanf("%d", &number1);

    printf("Number 2: ");
    scanf("%d", &number2);

    printf("Operand: ");
    scanf("%s", &operand[0]);

    switch(operand[0]){
        case '+':
            printf("Result: %d\n", (number1+number2));
            break;

        case '-':
            printf("Result: %d\n", (number1+number2));
            break;

        case '/':
            if(number2 == 0){
                puts(DVB);
                break;
            }
            printf("Result: %d\n", (number1/number2));
            break;

        case '*':
            printf("Result: %d\n", (number1*number2));
            break;
        case '%':
            if(number2 == 0){
                puts(DVB);
                break;
            }
            printf("Result: %d\n", (number1%number2));
            break;
        default:
            printf("No correct operand: %s !\n", operand);
            break;
    }

    return EXIT_0;
}