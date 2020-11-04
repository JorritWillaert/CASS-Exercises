.globl main
.data
	n:	.word	5

# Register allocations
# a0: return value
# t0: keeps the constant 2 for the comparison
# t1: loop variable

.text
main:
	li	a0, 1
	li	t0, 2
	lw	t1, n
loop:
	bgt	t0, t1, end
	mul	a0, a0, t0
	addi	t0, t0, 1
	j	loop
end:
