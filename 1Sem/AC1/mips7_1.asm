# O argumento da função é passado em $a0
# O resultado é devolvido em $v0
# Sub-rotina terminal: não devem ser usados registos $sx
	.data
str:	.asciiz "Arquitetura de Computadores I"
	.eqv print_int10,1
	.text
	.globl main
main:
	la $a0, str
strlen: li $v0,0 # len = 0;
while: 	lb $t0,0($a0) # while(*s++ != '\0')
 	beq $t0,'\0',endw # {
 	addiu $v0,$v0,1 #
 	addi $a0,$a0,1 # len++;
 	j	while # }
endw: 
	move $a0, $v0
	li $v0, print_int10
	syscall
 	jr $ra 
