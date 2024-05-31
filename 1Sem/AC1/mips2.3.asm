#(0x12345678, 1) 
#(0x12345678, 4) 
#(0x12345678, 16) 
#(0x862A5C1B, 2) 
#(0x862A5C1B, 4) 

 .data 
 .text 
 .globl main 
main: li $t0,0x862A5C1B # instrução virtual (decomposta 
 # em duas instruções nativas) 
 sll $t2,$t0,4 # 
 srl $t3,$t0,4 # 
 sra $t4,$t0,4 # 
 jr $ra # fim do programa