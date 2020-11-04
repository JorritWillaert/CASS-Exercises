.data
	input: .word 5
	output: .space 4
.globl main
.text
main:
	lw t1, input
	li t3, 1
	mv s0, t1
	addi t1, t1, -1
loop:
	mul s0, s0, t1
	addi t1, t1, -1
	bne t1, t3, loop
#end
	la t0, output
	sw s0, 0(t0)