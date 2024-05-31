# p: $t1
# pultimo: $t2

	.eqv SIZE,3
	.eqv print_str, 4
	.data
array:	.word str1,str2,str3
str1:	.asciiz "Array"
str2: 	.asciiz "de"
str3:	.asciiz "ponteiros"
str4:	.asciiz "\n"
	.text
 	.globl main
main:
 	la $t1, array
 	li $t0, SIZE
 	sll $t0,$t0,2
	addu $t2,$t1,$t0
	
for: 
	bgeu $t1, $t2, endfor
 	lw $a0, 0($t1)
 	li $v0, print_str
 	syscall
 	la $a0,str4
 	li $v0, print_str
 	syscall
 	addi $t1,$t1,4 		# i++
 	j for
 	
endfor:	jr 	$ra
 	