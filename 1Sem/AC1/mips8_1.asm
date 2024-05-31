# Mapa de registos
# res: $v0
# s: $a0
# *s: $t0
# digit: $t1
# Sub-rotina terminal: não devem ser usados registos $sx
atoi: li $v0,0 # res = 0;
while: lb $t0,endw # while(*s >= ...)
 blt $t0,'0' #
 bgt $t0,'9' # {
 li $t2,'0'
 addu $t0,$t0,1
 subu $t1,$t0,'0'
 mulu $v0,$v0,10 # res = 10 * res;
 addu $v0,$v0,$t1 # res = 10 * res + digit;
endw:
 
 jr $ra # termina sub-rotina 
