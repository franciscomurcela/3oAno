#mapa
#i: $t0
#v: $t1
#&(val[0]): $t2

	.data
	.eqv SIZE,8
	.eqv print_int10,1
	.eqv print_char,11
	.eqv print_str,4
val:	.word 8,4,15,-1987,327,-9,27,16
str:	.asciiz "Result is: "
	.text
	.globl main

main:	
	li $t0,0
	li $t5,0
	
while:	
	li $t3,SIZE
	div $t3,$t3,2
	addi $t0,$t0,1
	bge $t0,$t3,endw
	la $t1,val
	sll $t5,$t5,2	
	addu $t1,$t1,$t5		# val[i]
	lw $t2,0($t1)			# v=val[i]
	addu $t1,$t1,$t3
	lw $t3,0($t1)			#val[i+SIZE/2]
	sw $t2,0($t1)			#"" = v
	sub $t1,$t1,$t3
	sw $t3,0($t1)
	addi $t5,$t5,1
	
	j	while
	
	
endw:
	la $a0,str
	li $v0,print_str
	syscall
	li $t0,0
	
while2:
	bge $t0,SIZE,end
	sll $t0,$t0,2
	addu $t1,$t1,$t0
	lw $a0,0($t1)
	li $v0,print_int10
	syscall
	
	li $a0,','
	li $v0,print_char
	syscall
	j 	while2
	
end: 	jr	$ra


	

	