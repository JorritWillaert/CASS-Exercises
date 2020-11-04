.globl main
.data
	a:	.word	2
	b:	.word	5
	c:	.space	4

.text
main:
	lw	t1, a
	lw	t2, b

	# Load the value 1 in t3
	li	t3, 1

loop:
	# If the value in the zero-register (always zero) is equal to the value in the t2-register,
	# jump to label end. If not, continue as normal.
	beq	zero, t2, end

	mul	t3, t3, t1
	addi	t2, t2, -1

	# Jump to label loop
	j	loop

end:
	sw	t3, c, t1
