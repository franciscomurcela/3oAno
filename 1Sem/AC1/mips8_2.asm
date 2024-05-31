int main(void)
{
 static char str[]="2020 e 2024 sao anos bissextos";
 print_int10( atoi(str) );
 return 0;
}


	.data
str:	.asciiz "2020 e 2024 sao anos bissextos"
	.eqv print_int10,1
	.text
	.globl main
main:
	addiu $s0,$s0,-1
	la $a0,str
	
	
	.include "atoi.asm"
	