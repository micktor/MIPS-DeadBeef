# Mark Mileyev

.data
	prompt: .asciiz "Please enter a number N: "
	DEAD: .asciiz "DEAD\n"
	BEEF: .asciiz "BEEF\n"
	DEADBEEF: .asciiz "DEADBEEF\n"
	newl: .asciiz "\n"
	backspace: .asciiz "\b"
.text
main:
	addi $v0, $zero, 4
   	la $a0, prompt
   	syscall
 	addi $v0, $zero, 5
  	syscall
 	move $s0, $v0
	# Output N
	li $v0, 1
     move $a0, $s0
     #syscall
	
	# Check if 4 or 9
   	addi $t0, $zero, 4
   	addi $t1, $zero, 9
   	addi $t2, $zero, 36
     	
     addi $t3, $zero, 1 # Set i = 1 for while loop
     while:
     	bgt $t3, $s0, exit # Loop until N
     	jal printNum
     	addi $t3, $t3, 1 # i++
     	
     	j while	
     exit:
   
	li $v0, 10 # Terminate
	syscall
	
printNum:
	# Rem
	rem $t4, $t3, $t0 
   	mfhi $s1
   	rem $t4, $t3, $t1 
   	mfhi $s2
   	rem $t4, $t3, $t2 
   	mfhi $s3
   	#li $v0, 1
	add $a0, $s1, $zero
	beqz $s3, deadbeef
	beqz $s1, dead
	beqz $s2, beef
	#syscall
	#Display num
	li $v0, 1
	add $a0, $t3, $zero
	syscall
	
	# Newl
	li $v0, 4
	la $a0, newl
	syscall

	jr $ra
	
	
deadbeef:
		li $v0, 4
		la $a0, DEADBEEF
		syscall
		jr $ra
dead:
		li $v0, 4
		la $a0, DEAD
		syscall
		jr $ra
beef:
		li $v0, 4
		la $a0, BEEF
		syscall
		jr $ra
end_if:
