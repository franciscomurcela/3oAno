#MAPA DE REGISTOS
#i:$t0
#max1:$t1
#max2:$t2

	.data
array:	.word 5,27,56,11,3
	.eqv SIZE, 5
	.eqv print_int10,1
	.text
	.globl main

main:	
	li $t0,0
	li $t1,1
	sll $t1,$t1,31
	move $t2,$t1
	la $t3, array
	li $t4,0
while:	
	bge $t0,SIZE, endw
	mul $t4,$t0,4
	addu $t3,$t3,$t4		#array[i]
	lw $t5, 0($t3)			#*array[i]
if:	
	ble $t5, $t1, else
	move $t2, $t1
	move $t1, $t5
	j	endif
else:
	ble $t5, $t2, endif
	bge $t5, $t1, endif
	move $t2, $t5

	
endif:	
	addi $t0,$t0,1	

	j	while
	
endw:	
	move $a0,$t1
	li $v0,print_int10
	syscall
	jr	$ra