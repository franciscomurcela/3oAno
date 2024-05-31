#mapa de registos
#array -> $a0 -> $f0
#thd -> $a1 -> $f2
#val -> $a2 -> $f4
#n -> $a3 -> $t1
#i -> $t2
#aux -> $t3


	.data
sum:	.double 0.0
	.text
	.globl main

main:	
	move $f2,$a0 #array
	mov.d $f4,$a1 #thd
	mov.d $f6,$a2 #val
	move $t1,$a3 #n
	l.d $f8,sum
	li $t2,1 #i
	
for:
	bge $t2,$t1,endfor
	add $f2,$f2,$t2 #array[i]
	add.d $f10,$f2,$f6

if:	ble $f10,$f4,else
	move $f2,$f4
	add.d $f8,$f8,$f4
	
	j	endif
else:
	move $f2,$f6
	add.d $f8,$f8,$f6

endif:
	addi $t2,$t2,1
	j for
	
endfor:
	mtc1 $t1,$f8
	cvt.d.w $f8,$f12
	div.d $f12,$f6,$f12	
	
	
