# Mapa de registos
# p: $t0
# pultimo:$t1
# *p $t2
# soma: $t3
	
	.data
str:    .word 7692,23,5,234
 	.eqv SIZE,4
    	.eqv print_int10, 1
    	.text
    	.globl main    		# int main() {
main: 	li $t3,0			# soma = 0;
 	li $t4,SIZE 		#
 	addi $t4,$t4,-1 		# $t4 = 3
 	sll $t4,$t4,2 			# ou "mul $t4,$t4,4"
 	la $t0,	str			# p = array;
 	addu $t1,$t0,$t4 		# pultimo = array + SIZE - 1;
while: 					# while(p <= pultimo)
 	bgtu $t0,$t1,endw 			# {
 	lw $t2,0($t0)		# $t2 = *p;
 	add $t3,$t3,$t2 		# soma = soma + (*p);
 	addiu $t0,$t0,4 		# p++;
 	j	while		# print_int10(soma);
endw:
	or	$a0,$0,$t3
	ori	$v0,$0,1
	syscall
 	jr $ra 			# termina o programa 