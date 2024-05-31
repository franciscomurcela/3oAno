#include <detpic32.h>

void delay(unsigned int us){
    resetCoreTimer();
    while(readCoreTimer()<us*20);
}

void setDutyCicle(unsigned int dc){
    OCxRS = ((PRx+1)*dc)/100; // OC = enunciado   PRx=20000000 / (freq*65536)
}

int main(void){
    TRISB = TRISB | 0x0005; // Portas RB

    TxCONbits.TCKPS = 2; // Tx -> enunciado
    PRx = 46667; // PRx = ((20000000 / 4) / freq) - 1 = 33332.333333333
    TMRx = 0;
    TxCONbits.TON = 1;

    OCxCONbits.OCM = 6;
    OCxCONbits.OCTSEL = 0;
    setDutyCicle(xx);
    OCxCONbits.ON = 1; 

    while(1){
        if (PORTBbits.RBx = 0 && PORTBbits.RBx == 1){
            setDutyCicle(25); //enunciado
        }
        else if (PORTBbits.RBx == 1 && PORTBbits.RBx == 1){
            setDutyCicle(75); //enunciado
        }
        delay(360); // enunciado
    } 
    return 0;

}


// Prescaler = 20000000/(freq*65536)= x
// x ~= para cima -> 1=(0) 2=(1) 4=(2) ... 
// Prescaler = 20000000/x/150
//