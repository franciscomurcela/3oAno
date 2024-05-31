# Mapa de registos
# num: $t0
# p: $t1
# *p: $t2 (Registo temporário para guardar o valor armazenado na posição de memória p)
 	.data
 	.eqv print_int10,1
 	.text
 	.globl main
main: ... # ...
 	la $t1,str # p = str;
while: 	# while(*p != '\0')
 	lb $t2,0($t1) #
 	b?? $t2,0,endw # {
	b?? $t2,'0',endif # if(str[i] >='0' &&
 	b?? $t2,'9',endif # str[i] <= '9')
 	addi $t0,$t0,4 # num++;
endif:
 	addiu $t1,... # p++;
 	(...) # }
endw: 	(...) # print_int10(num);
 	jr $ra # termina o programa