# Mapa de registos:
# value: $t0
# bit: $t1
# i: $t2

	.data
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nO valor em binário e': "
	.eqv print_str,4
	.eqv read_int,5
	.eqv print_int10,1	
	
	
	.text
	.globl main
	
main:
	la	$a0,str1
	li	$v0, print_str
	syscall
	
	li	$v0, read_int
	syscall
	move	$t0,$v0 
	
	la	$a0,str2
	li	$v0, print_str
	syscall
	
	li $t2,0 	

while:
	bge	$t2,32,	endw
	
	li $t3,0x80000000
	and $t1,$t0,$t3


if:
	beq 	$t1,0, else
	li $a0, '1'
	li $v0, 11
	syscall
	#printa 1
	j	endif
else:
	li $a0, '0'
	li $v0, 11
	syscall
	#printa 0
endif:

	sll	$t0,$t0,1
	addi 	$t2,$t2,1				#	i++
	
	
	
	
	j	while			
endw:	
	jr	$ra
	
	
	
	
	
	
	
	
	
	