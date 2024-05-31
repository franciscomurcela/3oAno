#include <stdio.h>
#include <math.h>
// Programa que gera uma tabela de angulos, senos e cossenos e grava em um arquivo
int main(void){
    FILE *fp;
    fp = fopen("tabela_ang.txt", "w");
    printf("Bem vindo!\n");
    printf("Insira o angulo min (em graus): ");
    int min;
    scanf("%d", &min);
    printf("Insira o angulo max (em graus): ");
    int max;
    scanf("%d", &max);
    printf("Insira o incremento: ");
    int inc;
    scanf("%d", &inc);
    fputs("ang\t sin(ang)\t cos(ang)\t \n", fp);
    fputs("---\t --------\t --------\t \n", fp);
    fprintf(fp, "%d\t %lf\t %lf\t \n", min, sin(min*M_PI/180), cos(min*M_PI/180));
    min=min+inc;
    while(min<=max){
        fprintf (fp, "%d\t %lf\t %lf\t \n", min, sin(min*M_PI/180), cos(min*M_PI/180));
        min=min+inc;
    }
    fclose(fp);
    }
