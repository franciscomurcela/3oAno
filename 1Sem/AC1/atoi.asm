# Mapa de registos
# res: $v0
# s: $a0
# *s: $t0
# digit: $t1
# Sub-rotina terminal: não devem ser usados registos $sx
atoi: li $v0,0 # res = 0;
 blt $a1,2,endw
 bgt $a1,10,endw
 addi $t3,$a1,-1
 addi $t3,$t3,'0'
while: lb $t0,endw # while(*s >= ...)
 lb $t1,0($a0)
 blt $t1,'0',endw #
 bgt $t1,$t3,endw# {
 li $t2,'0'
 subu $t1,$t0,$t2
 addiu $a0,$a0,1
 mulu $v0,$v0,$a1 # res = 10 * res;
 addu $v0,$v0,$t0 # res = 10 * res + digit;
 j	while
endw:
 jr $ra # termina sub-rotina 
