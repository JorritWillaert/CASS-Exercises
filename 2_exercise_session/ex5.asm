.data 
	array: .word 4, 7, 6, 2, 5, 9 #Better work with size too
	array_size: .word 6
	constant: .word 5

.globl main
.text
main:
	la a0, array
	lw t0, array_size
	lw t1, constant
	li t2, 1
	beqz t0, end
	beq t1, t2, end
	lw t3, 0(a0)
	beqz t1, multiply_by_zero
	mv t4, t1
multiply_loop:
	add t5, t5, t3
	addi t4, t4, -1
	bnez t4, multiply_loop
	sw t5, 0(a0)
	addi t0, t0, -1
	addi a0, a0, 4
	lw t3, 0(a0)
	mv t4, t1
	mv t5, zero
	bnez t0, multiply_loop
	j end
multiply_by_zero:
	sw zero, 0(a0)
	addi a0, a0, 4
	addi t0, t0, -1
	bnez t0, multiply_by_zero
end:
