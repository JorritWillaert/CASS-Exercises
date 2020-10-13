.data
	result:	.word	5
.globl main
.text
main:
	la	a0, result
	lw	t0, 0(a0)
	addi	t1, zero, 1
	addi	t2, zero, 1
loop:
	add	t3, t1, t2
	mv	t1, t2
	mv	t2, t3
	addi	t0, t0, -1
	bnez	t0, loop
	sw	t3, 0(a0)
