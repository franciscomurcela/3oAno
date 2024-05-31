# Mapa de registos
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0
# Sub-rotina intermédia
itoa: addiu $sp,$sp,-16 # reserva espaço na stack
 sw $s0, # guarda registos $sx e $ra
 (...)
 move $s0,$a0 # copia n, b e s para registos
 move $s1,$a1 # "callee-saved"
 move $s2,$a2
 move $s3,$a2 # p = s;
do: # do {
 rem $t0,$s0,$s1#
 bgt $s0,'0',do # } while(n > 0);
 sb $0,0($s3) # *p = 0;
 (...) #
 jal strrev # strrev( s );
 move $v0,$s0 # return str # return s;
 lw $s0,... # repõe registos $sx e $ra
 (...)
 addiu $sp,$sp,16 # liberta espaço na stack
 jr $ra # 


















	.include "mips7_2.asm"