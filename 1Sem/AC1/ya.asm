	.data
    .eqv print_string,4
str:    .asciiz "Teste-Pratico-1"
    .text
    .globl main

main:
    la $t1, str
    li $t5, 0x20  # Value to subtract to convert to uppercase

while:
    lb $t0, 0($t1)  # Load byte
    beq $t0, '\0', endw  # Exit loop if null terminator

    # Convert lowercase letters to uppercase
    blt $t0, 'a', not_lowercase
    bgt $t0, 'z', not_lowercase
    sub $t0, $t0, $t5
    sb $t0, 0($t1)  # Store back the uppercase character

not_lowercase:
    addi $t1, $t1, 1  # Move to next character
    j while

endw:
    la $a0, str      # Load address of string to $a0
    li $v0, print_string
    syscall          # Print the entire modified string
    jr $ra