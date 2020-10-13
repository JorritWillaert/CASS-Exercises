.data
	a:	.word	5
	b:	.word	6
	c:	.space	4
.globl main
.text
main:
	la	a0, a
	sw	a0, c, t3
	la	a1, b
	lw	t0, 0(a0)
	lw	t1, 0(a1)
	slt	t2, t0, t1
	beqz	t2, else
	sub	t1, t1, t0
	sw	t1, b, t3
	j	endif
else:
	sub	t0, t0, t1
	sw	t0, a, t3
endif:
	lw	a0, c
	addi	t0, zero, 10
	sw	t0, 0(a0)
