#Guiao 6 Ex3

	.data
str1:	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "ponteiros"

array:	.word str1, str2, str3

stra1:	.asciiz  "\nString #"
stra2:	.asciiz  ": "

main:	li $t0,0

for:	bge $t0, SIZE, efor
	la $a0, stra1
	li $v0, print_string
#................N�o consegui copiar.........................#
	li $v0, print_int10
	syscall
	la $a0, stra2		#imprime string adicional 2
	li $v0, print_string
	syscall
	li $t1, 0		#j = 0
	
while: 	la $t2, array
	move $t3, $t0
	sll $t3, $t3, 2
	addu $t3, $t3, $tt2
	lw $t4, 0($t3)		#carrega array[i] que � um ponteiro para array de ...
	addu $t4, $t4, $t1	#&array[i][j], ou seja, endere�o do elemento j de ...
	lb $t5, 0($t4)		#$t5 = array[i][j]
	beq $t5, 0, ewhile
	move $a0, $t5		#print_char(array[i][j])
	li $v0, print_char
	syscall
	li $a0, '-'		#print_char('-')
	li $v0, print_char
	syscall
	addi $t1, $t1, 1	# j++
	j while
	
ewhile:	addi $t0, $t0, 1	# i++
	j for
	
efor:	jr $ra
