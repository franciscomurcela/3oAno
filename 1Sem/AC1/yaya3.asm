#mapa
# n_even: $t0
# n_odd: $t1
# p1: $t2
# p2: $t3
	
	.data
	.eqv read_int,5
	.eqv print_int10,1
	.eqv print_char,11
	.eqv N,5
	
a:	.space 20

b1:	.space 20
	

	.text
	.globl main
	
main:	
	
	la $t2,a		#p1=a
	li $t4,N
	sll $t4,$t4,2
	addu $t4,$t2,$t4

	
	
for1:
	bge $t2,$t4,endf1
	
	li $v0, read_int
	syscall
	sw $v0, 0($t2)
	
	addi $t2,$t2,4
	
	j	for1
	
endf1:	
	la $t2, a
	la $t3, b1
for2:	
	bge $t2,$t4,endf2
if:
	lw $t5, 0($t2)
	rem $t5,$t5,2
	beq $t5,$0,else
	lw $t5,0($t2)
	sw $t5,0($t3)
	addiu $t3,$t3,4
	addi $t1,$t1,1
	j	endif

else:	
	addi $t0,$t0,1
	j	endif
	
endif: 	
	
	addi $t2,$t2,4
	
	j	for2

endf2:
	la $t3,b1
	sll $t1,$t1,2
	addu $t4,$t3,$t1
	
for3:	
	bge $t3,$t4, endfor
	
	lw $a0, 0($t3)
	li $v0,print_int10
	syscall
	
	
	li $a0, ':'
	li $v0, print_char
	syscall
	
	addi $t3,$t3,4
	j	for3

endfor: 
	jr	$ra
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
