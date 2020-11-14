.data
input:
	.string "Please input your name below "
welcome:
	.string "Welcome "
error_msg:
	.string "Input error"
user:
	.space 10

.text
main:
	la a0, input
	la a1, user
	li a2, 10
	li a7, 54
	ecall
	bnez a1, error
     la a0, welcome
     la a1, user
	li a7, 59
	ecall
	b exit
error:  
     la a0, error_msg
     li a1, 0
     li a7, 55
     ecall
exit:   
	li a7, 10
     ecall