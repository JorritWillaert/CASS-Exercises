.data
	a: .word 5
	b: .word 8
	c: .space 4

 .globl main
 .text
 main:
 	la a0, a
 	lw t0, 0(a0)
 	#These two lines could even be executed in one instruction --> lw t0, a
 	
 	la a1, b
 	lw t1, 0(a1)
 	
 	mul t0, t0, t0
 	mul t1, t1, t1
 	add t2, t0, t1
 	sw t2, 4(a1)
