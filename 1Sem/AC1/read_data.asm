	.data
str2:	.asciiz "N.Mec: "
str3:	.asciiz "Primeiro Nome: "
str4:	.asciiz "Ultimo Nome: "
str5:	.asciiz "Nota: "
	.text
#i->$t0; cst -> $t1; cns -> $t2; &(st[1]) -> $t3
read_data:	
	move 	$t1,$a0				# cst= st;
	move 	$t2,$a1				# cns=ns;
	li	$t0,0				# i=0;
read_wh:
	bge	$t0, $t2, read_ew		# while (i<ns){
	mul	$t3,$t0,44
	addu	$t3,$t3,$t1			#	student *pt = &(st[i]);
	
	
	li	$v0,4
	la 	$a0,str2
	syscall					# print_str(str2)
	
	
	li	$v0,5
	syscall
	sw	$v0,id_number($t3)		#st[i].id_number = read_int
	
	
	li	$v0,4
	la 	$a0,str3
	syscall					# print_str(str3)
	
	
	li	$v0,8
	addiu	$a0, $t3, first_name
	li	$a1,17
	syscall					#read_string(st[i].first_name,17)    17 porque temos de reservar 1 espaço para \0
	
	
	li	$v0,4
	la 	$a0,str4
	syscall					# print_str(str4)
	
	
	li	$v0,8
	addiu 	$a0,$t3,last_name
	li	$a1,14
	syscall					#read_string(st[i].last_name,14)
	
	
	li	$v0,4
	la	$a0,str4
	syscall					#print_Str(str4)
	
	
	li	$v0,6
	syscall
	s.s	$f0,grade($t3)			#read_float()
	
			
	
	addi 	$t0,$t0,1			#	i++;
	j	read_wh				#  }
read_ew:
	jr	$ra				#}