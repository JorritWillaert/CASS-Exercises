.data
	myvalue:	.word	10
.globl main
.text
main:
	la	a0, myvalue
	lw	t0, 0(a0)
	add	t0, t0, t0
	sw	t0, 4(a0)
