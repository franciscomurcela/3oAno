 .data 
 .text 
 .globl main 
main: #ori $t0,$0,6 
 #srl $t1,$t0,1  
 #xor $t1,$t0,$t1
 ori $t0,$0,13
 srl $t1,$t0,4
 xor $t1,$t0,$t1
 
 srl $t2,$t1,2
 xor $t2,$t1,$t2
  
 srl $t3,$t2,1
 xor $t3,$t2,$t3
 
 
