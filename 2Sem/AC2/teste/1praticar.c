#include <detpic32.h>

void delay(unsigned int us){
    resetCoreTimer();
    while(readCoreTimer()<20*us);
}

void setDutyCicle(unsigned int dc){
    OC2RS = ((PR2+1)*dc)/100;
}

int main(void){
    TRISB = TRISB | 0x0009;

    T2CONbits.TCKPS = 2;
    PR2 = 33332;
    TMR2 = 0;
    T2CONbits.TON = 1;

    OC2CONbits.OCM = 6;
    OC2CONbits.OCTSEL = 0;
    setDutyCycle(25); //aqui a constante vao ser os 25% do duty cycle
    OC2CONbits.ON = 1;

    while(1){
        if (PORTBbits.RB3 = 0 && PORTBbits.RB0){
            setDutyCicle(20);
        } else if (PORTBbits.RB3 = 0 && PORTBbits.RB0){
            setDutyCicle(70);
        }
        delay(250);
    }   
    return 0;
}