#include <stdio.h>
#include <stdbool.h>

int main(){
    unsigned int n;
    unsigned int done = 0;

    if(1 != scanf("%d", &n))
        return 1;
    
    for(unsigned int i = 2; done < n; i++){
        bool i_is_prime = true;

        for(unsigned int k = 2; k < i/2; k++){
            if(i%k == 0){
                i_is_prime = false;
            }
        }

        if(i_is_prime){
            printf("%i\n", i);
            done++;
        }
    }

    return 0;
}