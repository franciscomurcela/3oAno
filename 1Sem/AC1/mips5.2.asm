# $t0: p
# $a0: *p
# $t1: lista+SIZE

	.data
lista:	.word 8,-4,3,5,124,-15,87,9,27,15
str1:	.asciiz "\nConteudo do array:\n"
str2:	.asciiz "; "
	.eqv SIZE, 10
	.eqv print_int10, 1
	.eqv print_str, 4
	.text
	.globl main
					# void main(void){
					
main:	la $a0, str1
 	li $v0, print_str 			# print_string(str);
 	syscall
	
	la $t0, lista				# p=lista;
	li $t1, SIZE				#
	sll $t1,$t1,2
	addu $t1,$t0,$t1
	

while: 	bgeu $t0, $t1, endw
	lw $a0,0($t0)
	li $v0, print_int10
	syscall
	la $a0, str2
	li $v0, print_str
	syscall
	addi $t0,$t0,4

	j	while
endw:	
	jr $ra	#termina