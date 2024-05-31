#Mapa de registos
#f1 : $a0 -> $s0
#k : $a1 -> $s1
#av : $a2 -> $s2
#i : $a3 -> $s3
# res : $t0

    	.data
    	.eqv SIZE,15
	.eqv print_int,1
    	.eqv print_string,4
str1:   .asciiz "Invalid argc"
    	.text
    	.globl main
    
main: 	addiu $sp,$sp,-20 #alocar espaço na stack
        sw $ra,0($sp) 
        sw $s0,4($sp)
        sw $s1,8($sp)
        sw $s2,12($sp)
        sw $s3,16($sp)
        li $t2,0 #res =0
        move $s0,$a0 # f1 = $a0
        move $s1,$a1 # k = $a1
        move $s2,$a2 # av = $a2
                    
	
if: 	blt $a1,2,else
    	bgt $a1,SIZE,else
    	li $s3,2
while: 	add  $t3,$s0,$s3 # $t3 = f1 + i -> f1[i]
       	add $t4,$s2,$s3 # $t4 = av + i -> av[i]
       	move $a0,$t4 # $a0 = av[i]
       	jal toi #toi(av[i])
       	sw $v0,0($t3) # f1[i] = toi(av[i])
       	addi $s3,$s3,1 #i++
       	blt $s3,$s1,while #while (i<k)
       	move $a0,$s0
       	move $a1,$s1
       	jal avz #avz(f1,k)
       	move $t2,$v0
       
       	move $a0,$t2
       	li $v0,print_int
       	syscall #print_int10(res)
       	j endif
else: 	la $a0,str1
      	li $v0,print_string
      	syscall
      	li $t2,-1 #res = -1
endif: 
    	move $v0,$t2 #return res
    	lw $ra,0($sp)
    	lw $s0,4($sp)
    	lw $s1,8($sp)
    	lw $s2,12($sp)
    	lw $s3,16($sp)
    	addi $sp,$sp,20

    	jr $ra