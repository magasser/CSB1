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

    do{
        struct Car *newFirst = (struct Car*) malloc(sizeof(struct Car));

        res = scanf("%s %s %ld %lf", newFirst->brand, newFirst->type, &newFirst->id, &newFirst->price);
        if(res == EOF) break;

        newFirst->next = first;
        first = newFirst;
    }while(1);

    while(first != NULL){
        printf("\nbrand: %s, type: %s, id: %ld, price: %lf\n", first->brand, first->type, first->id, first->price);
        first = first->next;
    }

    return 0;
}