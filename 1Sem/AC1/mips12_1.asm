		.data
str1:		.asciiz "\nMedia: "
		.align 2
str_array:	.space 176
		.align 2
media:		.space 4
		
		.eqv id_number,0
		.eqv first_number,4
		.eqv last_name,22
		.eqv grade,40
		.eqv MAX_STUDENTS,4
		.eqv print_string, 4
		.eqv print_float, 2
		
		.text
		.globl main
		
# pmax ->$t0
main:						#int main(void){
		addi 	$sp, $sp, -4
		sw	$ra,0($sp)		#prologo
		
		la	$a0, str_array
		li	$a1, MAX_STUDENTS
		jal	read_data		#read_data(st_array, MAX_STUDENTS)
		
		la	$a0, str_array
		li	$a1, MAX_STUDENTS	#funções mudam $a, $v e $t
		la	$a2, media		# então temos de chamar outra vez
		jal 	max
		move	$t0,$v0			#pmax = max(st_array,MAX_STUDENTS,&media)
		
		li	$v0, 4
		la	$a0, str1
		syscall				#print_string(str1)
		
		la	$t1,media
		l.s	$f12, 0($t1)
		li	$v0, 2
		syscall				#print_float(media)
		
		la 	$a0, $t0
		jal	print_student		#print_student(pmax)
		
		
		li	$v0, 0
		lw	$ra, 0($sp)
		addi 	$sp, $sp, 4
		jr	$ra
		
		
		
		.include "read_data.asm"
		.include "max.asm"
		.include "print_student.asm"