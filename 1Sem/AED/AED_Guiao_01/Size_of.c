#include <stdio.h>
int main(void){
    char* type[9] = {"void *", "void", "char", "short", "int", "long", "long long", "float", "double"};
    int sizes[9] = {sizeof(void *), sizeof(void), sizeof(char), sizeof(short), sizeof(int), sizeof(long), sizeof(long long), sizeof(float), sizeof(double)};

    for (int i = 0; i < 11; i++){
        printf("sizeof(%s)\t\t %d\n", type[i], sizes[i]);
    }

}