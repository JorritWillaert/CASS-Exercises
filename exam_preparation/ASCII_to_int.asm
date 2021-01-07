.data
	ASCII_string: .string "-187"
	plus: .byte 43
	minus: .byte 45
	lower: .byte 48
	upper: .byte 57
.globl main
.text
main:
	la a0, ASCII_string
	mv a3, a0
	lb t0, plus
	lb t1, minus
	lb t2, lower
	lb t3, upper
	lb t4, 0(a0)
	li t5, 1 #Positive 
	li t6, 1 #Multiples of ten
	li s0, 10 #Constant
	li s2, 1
	mv a1, zero
	addi a0, a0, 1
	beq t4, t0, positive
	beq t4, t1, negative
	j length
negative:
	li t5, -1 #Negative
positive:
	mv a3, a0
	addi a0, a0, 1
length:
	lb t4, 0(a0)
	beqz t4, next_start
	addi a0, a0, 1
	mul t6, t6, s0
	j length
next_start:
	mv a0, a3
next:
	lb t4, 0(a0)
	blt t4, t2, fault
	bgt t4, t3, fault	
	sub t4, t4, t2
	mul s1, t6, t4
	add a1, a1, s1
	beq t6, s2, end
	div t6, t6, s0
	addi a0, a0, 1
	j next
fault:
	li a1, -1
	j stop
end:
	mul a1, a1, t5
stop:

	
