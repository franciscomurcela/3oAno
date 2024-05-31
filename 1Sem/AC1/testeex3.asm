# typedef struct
# { Alignment Size Offset
# int acc; 4 4 0
# unsigned char nm; 1 1 4
# double grade; 8 8 5->8
# char quest[14]; 1 14 16
# int cq; 4 4 30->32
# } t_kvd; 8 36

#Mapa de registos
#nv: $t0
#pt: $t1
#i: $t2
#j: $t3
#sum: $f0

   	.data
sum:
	.double 0.0
    	.eqv acc,0
    	.eqv nm,4
    	.eqv grade,8
    	.eqv quest,16
    	.eqv cq,32
    	.text
    	.globl main

main: 
	move $t0,$a0
      	move $t1,$a1
      	li $t2,0
      	la $t4,sum
      	l.d $f0,0($t4) #sum =0.0  
for: 	
	bge $t2,$t0,endfor
    	li $t3,0
    	lb $t5,nm($t1) #$t5 = pt -> nm
while:  
    	lb $t4,quest($t1) #$t3 = pt->quest
    	add $t4,$t4,$t3 #$t4 = pt->quest + j === pt->quest[j]
    	mtc1 $t4,$f4 # $f4 = pt->quest[j]
    	cvt.d.w $f4,$f4 # $f4 = (double) pt->quest[j]
    	add.d $f0,$f0,$f4  # sum += (double) pt->quest[j]
	addi $t3,$t3,1 #j++
endw: 
	blt $t5,$t3,while
      	l.d $f4,grade($t1) # $f4 = pt->grade
      	div.d $f4,$f0,$f4 # $f4 = sum / pt->grade
      	cvt.w.d $f4,$f4
      	mfc1 $t4,$f4
      	sw $t4,acc($t1)
      	addi $t2,$t2,1
      	addi $t1,$t1,36
      	j for
endfor: 
	lw $t4,cq($t1) # $t4 = pt -> cq
    	mtc1 $t4,$t4 # $f4 = pt -> cq
    	cvt.d.w $f4,$f4 #$f4 = (double) pt->cq
    	l.d $f6,grade($t1) #$f6 = pt -> grade
    	mul.d $f12,$f4,$f6 # return(pt->cq * (double)pt->grade)
    	
    	jr $ra