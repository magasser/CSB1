#include <stdio.h>

#define new_struct(t) (t*) malloc(sizeof(t))

struct Car {
    char brand[50];
    char type[50];
    long id;
    double price;
};

int main(){
    puts("Enter new cars:");

    struct Car car[10];
    int res;
    int i = 0;
    do{
        res = scanf("%s %s %ld %lf", car[i].brand, car[i].type, &car[i].id, &car[i].price);
        i++;
    }while(res != EOF);
    i--;

    for(int j = 0; j < i; j++){
        printf("\nbrand: %s, type: %s, id: %ld, price: %lf\n", car[j].brand, car[j].type, car[j].id, car[j].price);
    }

    return 0;
}