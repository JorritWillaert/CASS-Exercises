.data
	string1: .string "abcde"
	string2: .string "abcde"
	output: .space 4
.globl main
.text
main:
	la t0, string1
	la t1, string2
loop:
	lb t2, 0(t0)
	lb t3, 0(t1)
	beqz t2, end_of_string #End of string of string1
	bne t2, t3, end
	addi t0, t0, 1
	addi t1, t1, 1
	j loop
end_of_string:
	bnez t3, end
	li t4, 1
	sw t4, output, t5
end:
