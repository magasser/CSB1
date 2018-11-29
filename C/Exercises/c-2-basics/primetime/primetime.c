#include <stdio.h>
#include <stdbool.h>

int main(){
    unsigned int n;
    unsigned int done = 0;

    if(1 != scanf("%d", &n))
        return 1;
    
    if(n > 0){
        printf("%i\n", 2);
    }

    for(unsigned int i = 3; done < n; i += 2){
        bool i_is_prime = true;

        for(unsigned int k = 3; k*k <= i; k += 2){
            if(i%k == 0){
                i_is_prime = false;
                break;
            }
        }

        if(i_is_prime){
            printf("%i\n", i);
            done++;
        }
    }

    return 0;
}