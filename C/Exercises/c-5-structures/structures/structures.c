#include <stdio.h>
#include <stdlib.h>

#define new_struct(t) (t*) malloc(sizeof(t))

struct Car {
    char brand[50];
    char type[50];
    long id;
    double price;
    struct Car *next;
};

int main(){
    puts("Enter new cars:");

    struct Car *first = NULL;

    int res;

    for(;;){
        struct Car *newFirst = new_struct(struct Car);

        res = scanf("%49s %49s %ld %lf", newFirst->brand, newFirst->type, &newFirst->id, &newFirst->price);
        if(res == EOF) break;

        newFirst->next = first;
        first = newFirst;
    }

    struct Car *backup = first;

    while(first != NULL){
        printf("\nbrand: %s, type: %s, id: %ld, price: %lf\n", first->brand, first->type, first->id, first->price);
        first = first->next;
    }

    while(backup != NULL){
        struct Car *temp = backup;
        backup = backup->next;
        free(temp);
    }

    return 0;
}