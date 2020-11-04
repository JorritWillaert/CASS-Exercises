.data
	f: .space 4
	g: .word 9
	h: .word 5
	i: .word 7
	j: .word 6 
	k: .word 3 #Case
	
.globl main
.text
main:
	la a0, k
	la a1, f
	lw t0, 0(a0)
	bnez t0, case1
#Case 0 starts from here
	la a2, i
	lw t1, 0(a2)
	la a3, j
	lw t2, 0(a3)
	add t3, t1, t2
	sw t3, 0(a1)
	j end
case1:	
	addi t1, zero, 1 #Also possible with li
	bne t0, t1, case2
	la a2, g
	lw t2, 0(a2)
	la a3, h
	lw t3, 0(a3)
	add t3, t2, t3
	sw t3, 0(a1)
	j end
case2: 
	addi t1, zero, 2
	bne t0, t1, case3
	la a2, g
	lw t2, 0(a2)
	la a3, h
	lw t3, 0(a3)
	sub t3, t2, t3
	sw t3, 0(a1)
	j end
case3:
	addi t1, zero, 3
	bne t0, t1, end
	la a2, i
	lw t2, 0(a2)
	la a3, j
	lw t3, 0(a3)
	sub t3, t2, t3
	sw t3, 0(a1)
end:
