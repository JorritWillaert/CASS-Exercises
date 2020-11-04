#Note: the solution of the TA's is totally differnt, but this works as well
.data
	n: .word 6
	result: .space 4
.globl main
.text
fact:
	bgt a0, s0, continue
	li a0, 1
	ret
continue:
	addi sp, sp, -8
	sw ra, 4(sp)
	sw a0, 0(sp)
	addi a0, a0, -1
	jal fact
	mv t0, a0
	lw a0, 0(sp)
	lw ra, 4(sp)
	mul a0, a0, t0
	addi sp, sp, 8
	ret

main:
	li s0, 1
	lw a0, n
	jal fact
	sw a0, result, t0