#include <stdio.h>
#include <stdlib.h>

int main(){

    char ch, file_name[30];

    FILE *fp;

    puts("Enter file name:");
    scanf("%s", file_name);

    fp = fopen(file_name, "r");

    printf("\nContent of %s are:\n", file_name);
    
    while((ch = fgetc(fp)) != EOF){
        printf("%c", ch);
    }

    fclose(fp);

    return 0;
}