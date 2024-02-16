#Guiao 3 Ex2

# Mapa de registos:
# value: $t0
# bit: $t1
# i: $t2

      	.data
str1: 	.asciiz "Introduza um numero: "
str2: 	.asciiz "\nO valor em bin�rio e': "
	.eqv print_string,4
 	.eqv read_int,5
	.eqv print_char, 11
 	.text
 	.globl main

main: 	la $a0,str1
 	li $v0,print_string # (instru��o virtual)
 	syscall # print_string(str1);
 	li $v0, read_int # value=read_int();
 	syscall
 	move $t0, $v0 # Value recebe o valor lido
 	la $a0,str2
 	li $v0,print_string # print_string("...");
 	syscall1
 	li $t2,0 # i = 0

for: 	bge $t2,32,endfor # while(i < 32) 
	li $t3,0x80000000 #
 	and $t1,$t0,$t3 # bit=value & 0x80000000
 	
if: 	beq $t1,$0,else # if(bit != 0)
 	li $a0, '1' 
 	li $v0, print_char # print_char('1');
 	syscall
 	j endif
 	
else: 	# else
	li $a0, '0' 
 	li $v0, print_char # print_char('0');
 	syscall
 	j endif # }

endif: 	#endif
	sll $t0, $t0, 1# value = value << 1;
 	addi $t2,$t2,1
 	j for
	
endfor: #
 	jr $ra # fim do programa