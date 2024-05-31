#include <stdio.h>

void Permute(int* A, int* B, int* C){
    int temp = *A;
    *A = *B;
    *B = *C;
    *C = temp;    
}

int main(void){
    int a=1, b=2, c=3;
    printf("%d %d %d\n", a,b,c);
    Permute(&a,&b,&c);
    printf("%d, %d, %d");
    Permute(&a, &b, &c);
    
}
