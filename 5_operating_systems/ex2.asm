.data
	welcome: .string "Welcome "
	error: .string "Error"
	enter_string: .string "Please enter your name"
	name: .space 32 #Max 31 bytes of letters (+ 1 zero byte)
.globl main
.text
fault: 
	li a7, 55
	la a0, error
	li a1, 1
	ecall
	li a7, 93
	mv a0, s0 #Exit code = error code
	ecall
main:
	li a7, 54
	la a0, enter_string
	la a1, name
	li a2, 32
	ecall
	mv s0, a1
	bnez s0, fault
	li a7, 59
	la a0, welcome
	la a1, name
	ecall
	li a7, 10
	ecall
	