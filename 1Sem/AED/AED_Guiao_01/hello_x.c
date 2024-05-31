#include <stdio.h>
int main ( void )
{
    printf("Bem vindo!\n");
    printf("Insira o seu nome proprio: ");
    char nomeprop[20];
    char apelido[20];
    scanf("%s", nomeprop);
    printf("Insira o seu apelido: ");
    scanf("%s", apelido);
    printf("Ola %s %s!\n", nomeprop, apelido);
}