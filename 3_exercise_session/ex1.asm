.data
	x: .word 10
	y: .word 20
	z: .space 4
.globl main
.text
doubleIt:
	add a0, a0, a0
	ret
sum:
	addi sp, sp, -4
	sw a0, 0(sp)
	addi sp, sp, -4
	sw ra, 0(sp)
	mv a0, a1
	jal doubleIt
	mv a1, a0
	lw ra, 0(sp)
	addi sp, sp, 4
	lw a0, 0(sp)
	addi sp, sp, 4
	add a0, a0, a1
	ret
main:
	lw a0, x
	lw a1, y
	jal sum
	sw a0, z, t0
	