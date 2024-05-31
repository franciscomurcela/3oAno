# i: $t0
#
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
 	li $t0, 0
for: 
	bge $t0, SIZE, endfor
 	la $t1,array 		# $t1 = &array[0]
 	sll $t2,$t0,2 		#
 	addu $t2,$t1,$t2	# $t2 = &array[i]
 	lw $a0,0($t2) 		# $a0 = array[i]
 	li $v0, print_str
 	syscall
 	la $a0,str4
 	li $v0, print_str
 	syscall
 	addi $t0,$t0,1 		# i++
 	j for
 	
endfor:	jr 	$ra
 	