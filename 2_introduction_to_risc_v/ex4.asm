.data
	a: .word 5
	b: .word 4 #Assumption: b >= 0
	c: .space 4

.globl main
.text
main:
	lw t0, a
	lw t1, b
	li t2, 1
loop:
	beq zero, t1, end
	mul t2, t2, t0
	addi t1, t1, -1
	j loop
end:
	sw t2, c, t1

	
