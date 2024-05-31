#Mapa de registos
#cc: $t0
#ms: $t1
	.data
	.eqv print_char,11
	.eqv print_str,4
str:	.asciiz "Teste-Pratico-1"
	.text
	.globl main

main:	
	la $t1,str
	li $t5,0x20
		
while:	lb $t2,0($t1)
	beq $t2,'\0',endw
	lb $t0,0($t1)
	
if:	bge $t0,'0',else
	li $t3,' '
	sb $t3,0($t1)
	j	endif
	
else:	blt $t0,'a',endif
	bgt $t0,'z',endif
	lb $t4,0($t1)
	sub $t4,$t4,$t5
	sb $t4,0($t1)

endif:	
	addi $t1,$t1,1
	j	while
endw:
	or $a0,$0,$t1
	li $v0,print_char
	syscall
	jr	$ra
	
	

	
