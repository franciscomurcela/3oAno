	.data
str:    .space 21
    	.eqv read_str, 8
    	.eqv print_int10, 1
    	.text
    	.globl main    # int main() {
main:
    	li $v0, read_str
    	la $a0, str
    	li $a1,20
    	syscall 
	
    	li $t0,0
    	li $t1,0

while:
    	la $t2,    str
    	addu $t3,$t2,$t1
    	lb   $t4, 0($t3)
    	beq  $t4,$0, endw
if:
    	blt $t4,'0', endif
    	bgt $t4,'9', endif
    	addi $t0,$t0,1
endif:
    	addi $t1,$t1,1
    	j while
endw:
    	li $v0, print_int10
    	move $a0,$t0
    	syscall
    	li $v0,0
    	jr $ra