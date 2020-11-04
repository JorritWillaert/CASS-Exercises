.data
	array1: .word 1, 2, 3, 4, 5
	array2: .word 6, 7, 8, 9, 10
	array3: .space 20
	n: .word 5
.globl main
.text
sum_array_elements:
	lw t1, 0(a0)
	lw t2, 0(a1)
	add t3, t1, t2
	sw t3, 0(a2)
	addi a0, a0, 4
	addi a1, a1, 4
	addi a2, a2, 4
	addi a3, a3, -1
	bnez a3, sum_array_elements
	ret
main:
	la a0, array1
	la a1, array2
	la a2, array3
	lw a3, n
	beqz a3, end
	jal sum_array_elements
end: