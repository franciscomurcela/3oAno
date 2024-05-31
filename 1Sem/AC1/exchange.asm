# void exchange(char *c1, char *c2)
# {
# 	char aux = *c1;
# 	*c1 = *c2;
# 	*c2 = aux;
# }
# 

 	
exchange:	
	lb $t0,0($a0)
	move $a0,$a1
	move $a1,$t0

	