#include <stdio.h>
//Tabela com loop de numeros, quadrados e raizes
int main(void){
    printf("Bem vindo!\n");
    printf("Insira o numero de linhas: ");
    int linhas;
    scanf("%d", &linhas);
    int counter = 1;
    int sqr;
    float root;
    printf("Numero\t Quadrado\t Raiz Quadrada\t \n");
    while(counter<=linhas){
        sqr = counter*counter;
        root = sqrt(counter);
        printf ("%d\t %d\t\t %f\t \n", counter, sqr, root);
        counter++;
    }
    }
