#Mapa de regists
#num: $t0
#i: $t1
#order: $t2


	.data
	.eqv read_int,5
	.eqv print_int10,1
	.eqv print_str,4
	
str1:	.asciiz "Enter a number: "
str2:	.asciiz "\nNo set bits\n "

	.text
	.globl main

main:	
	li $t2, -1		#int order = -1;
	la $a0, str1		
	li $v0, print_str
	syscall			#print_string(str);
	
	
	li $v0, read_int	#num=read_int();
	syscall
	or $t0, $0, $v0		
	
	li $t1,0		#i=0;
	
while: 	bge $t1,32, endw		#while(i<32){
 	andi $t3,$t0,1		#num&1
if:	bne $t3,1, endif	#if (num&1)=1{
	or $t2,$0,$t1		#order = 1
	
	
endif:	srl $t0,$t0,1		#num=num>>1
	addi $t1,$t1,1		#i++

	j	while
endw:
	beq $t2,-1, else	#if(order != -1){
	or $a0,$0,$t2		#print_int10(order)
	li $v0, print_int10	
	syscall
	
	j	end
	
else:
	la $a0, str2		
	li $v0, print_str
	syscall			#print_str(str2)
	
end:	jr	$ra 
	
	