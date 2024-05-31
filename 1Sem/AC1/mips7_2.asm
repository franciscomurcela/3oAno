# Mapa de registos:
# str: $a0 -> $s0 (argumento é passado em $a0)
# p1: $s1 (registo callee-saved)
# p2: $s2 (registo callee-saved)
#
strrev: addiu $sp,$sp,-16 # reserva espaço na stack
 	sw $ra,0($sp) # guarda endereço de retorno
 	sw $s0,4($sp) # guarda valor dos registos
 	sw $s1,8($sp) # $s0, $s1 e $s2
 	sw $s2,12($sp) #
 	move $s0,$a0 # registo "callee-saved"
 	move $s1,$a0 # p1 = str
 	move $s2,$a0 # p2 = str
while1: # while( *p2 != '\0' ) {
 	beq $s2, '\0',endw
 	addi $s2,$s2,1 # p2++;
 	j	while # }
endw:	li $t6,1
	sub $s2,$s2,$t6 # p2--;
while2: # while(p1 < p2) {
 	bge $s1,$s2,endw2
 	move $a0,$s1 #
 	move $a1,$s2 #
 	jal exchange # exchange(p1,p2)
 	addi $a0,$a0,1
 	sub $a1,$a1,$t6
 	j	while2 # }
endw2:
 	move $v0,$s0 # return str
 	lw $ra,0($sp) # repõe endereço de retorno
 	lw $s0,4($sp) # repõe o valor dos registos
 	lw $s1,8($sp) #s0, $s1 e $s2
 	lw $s2,12($sp) #
 	addiu $sp,$s0,16 # liberta espaço da stack
 	jr $ra # termina a sub-rotina 
 	
 	
 	.include "exchange.asm"