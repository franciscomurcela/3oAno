# i: $t0
# lista: $t1
# lista + i: $t2
	.data
	.eqv SIZE,5
str: 	.asciiz "\nIntroduza um numero: "
 	.align 2	#OBRIGA O ENDEREÇO A SER MULTIPLO DE 4!!!!!!!! se lista estivesse antes de str nao era preciso
lista:	.space 20	 # SIZE * 4
 	.eqv read_int, 5	
 	.eqv print_str, 4
 	.text
 	.globl main
 			#void main(void){
main: 	li $t0,0 	# i = 0;

while: 	bge $t0, SIZE, endw 	# while(i < SIZE) {
 	
 	la $a0, str
 	li $v0, print_str 		# print_string(str);
 	syscall
 	li $v0,read_int
 	syscall 			# $v0 = read_int();
 	la $t1,lista 			# $t1 = lista (ou &lista[0])
 	sll $t2,$t0,2			# int tmp1 = i*4;
 	addu $t2,$t1,$t2		# $t2 = &lista[i];
 	sw $v0,0($t2) 			# lista[i] = read_int();
 	addi $t0,$t0,1 			# i++
 	j while			#}
 	
endw: 	jr $ra 		# termina programa
