#include <stdio.h>

int main(){
    char x[30];
    char y[30];

    scanf("%29s", x);
    scanf("%29s", y);

    fprintf(stdout, 
            "%s - %s\n",
            x,
            y);

    return 0;
}