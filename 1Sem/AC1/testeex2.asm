#Mapa de registos
#a: $t0
#t: $f0
#n: $t1
#oldg: $f2
#g: $f4
#s: $f6
#k: #t2
    	.data
oldg:   .float -1.0
g:    	.float 1.0
s:    	.float 0.0
    	.text
    	.globl main

main:
    	move $t0,$a0 #t0 = a
    	move $t1,$a1 # $t1 = n
    	la $t0,oldg #$t0 = &oldg
    	l.s $f2,0($t0) #f2 = oldg
    
    	la $t0,g #$t0 = &g
    	l.s $f4,0($t0) #f4 = g
    
    	la $t0,s #$t0 = &s
    	l.s $f6,0($t0) #f6 = s
    
    	li $t2,0
    				
for: 
	bge $t2,$t1,endf
    
while: 
	sub.s $f8,$f4,$f2 # g - oldg
    	c.le.s $f0,$f8 # (t<= g-oldg)
    	bc1f endw
    	mov.s $f2,$f4 #oldg = g
    	add $t0,$t0,$t2 # &a[k]
    	l.s $f10,0($t0) #$f10 = a[k]
    	add.s $f14,$f4,$f10 # $f14 = g + a[k]
    	div.s $f4,$f14,$f0 # g = /(g + a[k]) / t
    	
endw:   
	add.s $f6,$f6,$f4
    	add $t0,$t0,$t2 # &a[k]
    	l.s $f10,0($t0) # $f10 = a[k]
    	mov.s $f10,$f4 # a[k] = g
    	s.s $f10,0($t0) # a[k] = g
    	addi $t2,$t2,1 #k++

endf: 
	mtc1 $t1,$f16 #$f16 = (int)n
      	cvt.s.w $f16,$f16 #$f16 = (float)n
      	div.s $f12,$f6,$f16 #s/ (float)
    	jr $ra
