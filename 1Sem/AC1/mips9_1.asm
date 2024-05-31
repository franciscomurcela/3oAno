#mapa
#$t1=res
#$t0=val
	.data
n1:	.float 2,59375
	.eqv read_int,5
	.eqv print_float,2
	.text
	.globl main
	
main:

do:	
	move $v0,read_int
	syscall
	move $t0,$v0
	mtc1 $t0,$f2
	cvt.s.w $t2,$f2 #Convert Integer to Float
	move $t1,n1
	l.s	$f4,0($t1)
	mul.s $f0,$f2,$f4
	move $v0,read_float
	syscall
	mtc1 $0,$t6
	cvt.s.w $t6,$f6
	c.eq.s $t0,$t6
	bc1f	do
	li $v0,0
	jr $ra
		