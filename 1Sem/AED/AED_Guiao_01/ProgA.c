#include <stdio.h>
void printArray(char s,int a[]){
    printf(s+":");
    for(int i=0; i<12; i++){
        printf("%d  ", a[i]);
    }
}
void cumSum(int a[], int b[]){
    int c = 0;
    for(int i=0; i<12; i++){
        c+=a[i];
        b[i]=c;
    }
}

int main(void){
    int a[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
    printArray("a : ",a);
    printf("\n");
    int b[12];
    cumSum(a,b);
    printArray("b : ",b);

}

