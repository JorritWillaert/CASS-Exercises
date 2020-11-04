.data
	heap: .space 1000000
.text
.globl main
#Little problem with popping (because 'previous' pointer is not correctly working').
allocate_space:
	mv t0, a0
	mv a0, gp
	add gp, gp, t0
	ret
stack_create:
	li a0, 4 #We want to allocate 4 bytes of space, to store the top of the stack.
	addi sp, sp, -4
	sw ra, 0(sp)
	jal allocate_space
	lw ra, 0(sp)
	addi sp, sp, 4
	sw zero, 0(a0) #Stack is empty, so have the top pointer point to the address zero.
	ret #Address of stack pointer is still in a0
	
stack_push: #a0 = address of top stack pointer; a1 = value to be pushed
	addi sp, sp, -4
	sw a0, 0(sp)
	li a0, 12 #We need to allocate 12 bytes of memory (4 bytes for new element, 4 bytes for new 'next' pointer, 4 bytes for 'previous' pointer (for if popped again).)
	addi sp, sp, -4
	sw ra, 0(sp)
	jal allocate_space
	lw ra, 0(sp)
	addi sp, sp, 4
	lw t0, 0(sp)
	addi sp, sp, 4
	sw a0, 0(t0) #Store the 'next' pointer in the previous top pointer.
	sw zero, 0(a0) #Store 'zero' in the new 'next' pointer. This is the top element.
	sw a1, 4(a0) #Store the value in the next word.
	sw t0, 8(a0) #Store the previous pointer in the third of three fields.
	ret #Address of current stack pointer is in a0
stack_pop:
	lw t1, 8(a0) #'Previous' pointer
	lw t0, 4(a0) #Return the element in the top of the stack.
	sw zero, 8(a0)
	sw zero, 4(a0)
	sw zero, 0(a0)
	mv a1, t1
	mv a0, t0
	ret
main:
	la gp, heap
	jal stack_create
	li a1, 1 #We are going to push element 1 on the stack
	jal stack_push
	li a1, 2
	jal stack_push
	li a1, 1
	jal stack_push
	jal stack_pop
	mv a0, a1 #Because a0 contained the popped element and a1 contained the current stack pointer
	jal stack_pop