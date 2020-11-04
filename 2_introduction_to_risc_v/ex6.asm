.data
	string: .string "ABCDEFGH"
	string_length: .space 4

.globl main
.text
main:
	la a0, string
	mv s0, zero
loop:
	lb t0, 0(a0)
	beqz t0, end
	addi s0, s0, 1
	addi a0, a0, 1
	j loop
end:
	sb s0, string_length, a1 
