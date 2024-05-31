#include <detpic32.h>

void delay(unsigned int us) {
    resetCoreTimer();
    while(readCoreTimer()<20*us);
}       

void setDutyCicle(unsigned int dc){
    OC3RS = ((PR3 + 1)*dc)/100;
}

int main(void){

    TRISB = TRISB | 0x0005;

    T3CONbits.TCKPS = 2;
    PR3 = 41667;
    TMR3 = 0;
    T3CONbits.TON = 1;

    OC1CONbits.OCM = 6;
    OC1CONbits.OCTSEL = 0;
    setDutyCicle(75);
    OC1CONbits.ON = 1;

    while(1){
        if(PORTBbits.RB2 == 0 && PORTBbits.RB0 == 0){
            setDutyCicle(30);
        }else if(PORTBbits.RB2==1 && PORTBbits.RB0 == 1){
            setDutyCicle(55);
        }
        delay(360);
    }
    return 0;
}

// 0000 0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 1101 1110 1111
//  0     1    2    3    4    5    6    7    8   9    A    B    C     D    E    F

//RB2 e RB0
//0000 0000 0000 0101       0x0005

//Prescaler = 20000000 / (120*65536) = 2.54313151
//Prescaler = 4 => 2 o 4 é o  3 registo, ou seja 0,1,(2)
//PR3 = (20000000 / 4) / 120 = 41666.666666667

//Importante
//freq do clk é 20MHZ (20*10^6)
// T1 -> Tipo A  divisão por 1,8,64,256 (4 registos)
// T2,T3,T4,T5 -> Tipo B 1,2,4,8,16,32,64 ou 256 (8 registos)
// Modulo de presecales é configuravél no TCKPS se for T2 é T2CONbits.TCKPS =  modulo prescale
//k prescale = freq do clk / 65535+1 * freq do enunciado
//prescale calcula-se primeiro fazendo  frequencia do sinal á saida do prescaler (enunci) (fout) é (freq do clk/K prescaler) / (PRX+1)