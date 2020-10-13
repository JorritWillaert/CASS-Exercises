#TODO

.data
	array: .string "ABCDEFGH"
	string_length: .space 4

.globl main
.text
main:
	la t0, array
	li s0, 0
loop:
	lb t1, 0(t0)
	beqz t1, end
	addi s0, s0, 1
	addi t1, t1, 1
	bnez t1, loop
end:
	la a0, string_length
	sw s0, 0(a0)