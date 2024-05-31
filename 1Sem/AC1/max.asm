	.data
max_grade: .float -20.0
sum:	.float 0.0
	.text
	
#st -> $a0; ns -> $a1; media -> $a2; p -> $t0; pmax -> $v0; (st+ns) -> $t1
#max_grade -> $f0; sum -> $f2   só indice par!!!
max:	
	#não ha syscalls então posso usar $a
	
	la	$t9,max_grade
	l.s	$f0,0($t9)			#max_grade=-20.0
	la	$t9,sum
	l.s	$f2,0($t9)			#sum=0.0
	move 	$t0,$a0				#p=st
	mul 	$t1,$a1,44
	addu	$t1,$t1,$a0			#student *pf = (st+ns)
	
max_wh:
	bgeu	$t0,$t1,max_ew 			#while(p<pf){		#comparamos ponteiros -> BGEU!!!
	l.s	$f4,grade($t1)
	add.s	$f2,$f2,$f4			#sum+=p->grade;
max_if:
	c.le.s	$f4,$f0
	bc1t	max_endif			#if(p->grade > max_grade) {
	mov.s	$f0,$f4				#max_grade = p->grade;
	move	$v0,$t0				#pmax=p;
	
max_endif:
	
	addiu	$t0,$t0,44			#p++
	j	max_wh				#}
max_ew:
	mtc1	$a1,$f6
	cvt.s.w $f6,$f6
	div.s	$f6,$f2,$f6			#ftmp=sum/(float)ns;
	s.s	$f6,0($a2)			#*media = ftmp;
	jr	$ra
