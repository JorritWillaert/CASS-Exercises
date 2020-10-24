.data
	n: .word 5
	r: .space 4
.globl main
.text
fact_tail:
	bgt a0, s0, continue
	mv a0, a1
	ret
continue:
	mul a1, a0, a1
	addi a0, a0, -1
	j fact_tail #Note, NO jal here --> ra is not overwritten. There is no code after this statement, so no need to return to here!
fact:
	li a1, 1
	addi sp, sp, -4
	sw ra, 0(sp)
	jal fact_tail
	lw ra, 0(sp)
	addi sp, sp, 4
	ret
main:
	lw a0, n
	li s0, 1
	jal fact
	la t0, r
	sw a0, 0(t0)