.data
	number: .word 6
	solution: .space 4
.globl main
.text
recursive_factorial: #Also possible to implement with a tail call and without jal's
	beqz a0, tail_call
	addi sp, sp, -8
	sw ra, 0(sp)
	sw a0, 4(sp)
	addi a0, a0, -1
	jal recursive_factorial
	lw t0, 4(sp)
	lw ra, 0(sp)
	addi sp, sp, 8
	mul a0, a0, t0
	ret
tail_call:
	li a0, 1
	ret
main:
	lw a0, number
	jal recursive_factorial
	sw a0, solution, t0