#Guiao 1 Ex3

	.data
 # nada a colocar aqui, de momento
 	.text
 	.globl main
main: 	ori $v0,$0,5 # a system call read_int() �
 		     # identificada com o n�mero 5 (ver
		     # tabela de instru��es)
 	syscall # a system call read_int() � chamada 
 	or $t5, $0, $v0
 	or $a0,$0,$t5 # copia o registo $t5 para o registo $a0
 	ori $v0,$0,1 # a system call print_int10() �
		     # identificada com o n�mero 1 (ver
 		     # tabela de instru��es)
 	syscall # a system call print_int10() � chamada