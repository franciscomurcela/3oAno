#$t3 : aux 
#$t4 : houveTroca
#$t5 : i
#$t6 : lista
#$t7 : lista+i

	.data
lista:  .space 40
	.eqv SIZE,10
	.eqv TRUE,1
	.eqv FALSE,0
	.eqv read_int, 5
	.eqv print_int10, 1
	.eqv print_str, 4
	.text
	.globl main

main: 	
while: 	
	li $t0,0
	bge $t0, SIZE, do 	# while(i < SIZE) {
 	
 				# $v0 = read_int();
 	la $t1,lista 			# $t1 = lista (ou &lista[0])
 	sll $t2,$t0,2			# int tmp1 = i*4;
 	addu $t2,$t1,$t2		# $t2 = &lista[i];
 	li $v0,read_int
 	syscall 
 	sw $v0,0($t2) 			# lista[i] = read_int();
 	addi $t0,$t0,1 			# i++
 	j while
	

do:	
	 
	li	$t4, FALSE	#houvetroca=false;
	li	$t5, 0		#i=0;
for:	bge	$t5, 9, enddo

if:	la $t1,lista
	sll $t7,$t5,2 		# $t7 = i * 4
 	addu $t7,$t1,$t7 	# $t7 = &lista[i]
 	lw $t8,0($t7) 		# $t8 = lista[i]
 	lw $t9,4($t7) 		# $t9 = lista[i+1]
 	
 	ble $t8,$t9,endif 	# if(lista[i] > lista[i+1]){
 	sw $t8,4($t7) 		# lista[i+1] = $t8
 	sw $t9,0($t7) 		# lista[i] = $t9
 	li $t4,TRUE 

		
	
endif: 	addi $t5,$t5,1
	j 	for
	
	
enddo: 	beq $t4,TRUE,do
	la $t0, lista		# $t0 = &lista[0]
	li $t2, SIZE
	sll $t2,$t2,2
	addu $t2,$t2,$t0
	
for2:	bge $t0,$t2, endfor2

	lw $a0, 0($t0)
	li  $v0, print_int10
	syscall
	
	addiu $t0,$t0,4
	j	for2	
	
endfor2: jr	$ra
