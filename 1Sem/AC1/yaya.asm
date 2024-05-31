 .data
 .eqv print_str,4
 .eqv print_int10,1
 .eqv print_char,11
 .eqv read_int,5
str1: .asciiz "Digite ate 20 inteiros (zero para terminar):"
str2: .asciiz "Máximo/mínimo são: "
char: .asciiz ":"
 .text
 .globl main

main: 
     li $t1,0
     li $t2,0x7FFFFFFF
     li $t3,0x80000000
     la $a0, str1
     li $v0, print_str
     syscall

     li $v0, read_int
     syscall
     or $t0,$0,$v0

while: 
     bge $t1, 20, endw
     beq $t0, 0, endw

if1: beq $t0,0, endif
if2: ble $t0,$t3,endif
     or $t3,$0,$t0
     j  endif
if3: bge $t0,$t2,endif
     or $t2,$0,$t0
     j endif


endif:
     addi $t0,$t0,1
     j while

endw:
     la $a0, str2
     li $v0, print_str
     syscall

     or $a0,$0,$t3
     li $v0, print_int10
     syscall

     la $a0,char
     li $v0,print_char
     syscall

     or $a0,$0,$t2
     li $v0, print_int10
     syscall

     jr $ra