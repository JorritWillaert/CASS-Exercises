.text
.globl main
main:
	# Write your own testing code here
	jal list_create
	mv s0, a0
	
	jal list_print
	
	mv a0, s0
	li a1, 5
	jal list_append
	
	mv a0, s0
	jal list_print
	
	mv a0, s0
	li a1, 6
	jal list_append
	
	mv a0, s0
	jal list_print	

	jal run_test_suite
	li a7, 10
	ecall