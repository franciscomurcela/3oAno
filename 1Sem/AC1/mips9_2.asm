	.data
sum:	.float 0.0




average:
	
for:
	blt $t1,0,endfor
	
	
	sub $t1,$t1,1
	j	for
endfor:
	