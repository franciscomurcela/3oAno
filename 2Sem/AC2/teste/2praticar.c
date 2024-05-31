#include <detpic32.h>

void delay(unsigned int us){
    resetCoreTimer();
    while(readCoreTimer()<20*us);
}


unsigned char toBcd(unsigned char value) {
    return ((value / 10) << 4) + value % 10;
}

void send2displays(unsigned char value){
    static const char display7Scodes[] = { 0x3F, 0x06, 0x5B, 0x4F, 
                                    0x66, 0x6D, 0x7D, 0x07, 
                                    0x7F, 0x6F, 0x77, 0x7C, 
                                    0x39, 0x5E, 0x79, 0x71};

}


void configTimerT2(){
    T2CONbits.TCKPS = 2;
    PR2 = 41667;
    TMR2 = 0;
    T2CONbits.TON = 1;

    IPC2bits.T2IP = 2;
    IEC0bits.T2IE = 1;
    IFS0bits.T2IF = 0;
}


void configADC(){
    TRISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4= 0; 
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1; 
    AD1CON3bits.SAMC = 16; 
    AD1CON2bits.SMPI = 1; //A ADC deve fazer duas (2) conversões por cada amostra.  2-1
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;
}

volatile int temp = 0;

int main(void){

    TRISD = TRISD & 0x80FF;
    TRISB = TRISB & 0xF9FF;

    configADC();
    configTimerT2();
    EnableInterrupts();

    while(1){
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0); 
    
        int i,media=0;
        int *p = (int*)(&ADC1BUF0);
        for(i=0;i<2;i++){
            media+=p[i*4];
        }
        media=media/2;
        media=((media*50+511)/1023)+15;
        temp=toBcd(temp);
        IFS1bits.AD1IF = 0;
        delay(100);
    }
    return 0;
}


void _int_(8) isr_T2(void){
    send2displays(temp);
    IFS0bits.T2IF = 0;
}





