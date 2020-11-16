.eqv OK 1
.eqv UNINITIALIZED_LIST -1
.eqv OUT_OF_MEMORY -2
.eqv INDEX_OUT_OF_BOUNDS -3
.eqv UNINITIALIZED_RETVAL -4

.text
.globl list_append
list_append:
	#INPUT: a0: list; a1: value
	#OUTPUT: a0: Either OK (-1), UNINITIALIZED_LIST(-1) or OUT_OF_MEMORY(-2)
	beqz a0, uninitialized_list
	addi sp, sp, -12
	sw a1, 8(sp)
	sw a0, 4(sp)
	sw ra, 0(sp)
	li a0, 8 #Allocate 8 bytes of space, 4 for the value and 4 for the 'next' value
	jal malloc
	#From now on: a0: new_node; t0: list; a1: value;
	lw ra, 0(sp)
	lw t0, 4(sp)
	lw a1, 8(sp)
	addi sp, sp, 12
	beqz a0, out_of_memory
	sw a1, 0(a0) #Store value
	sw zero, 4(a0) #'Next' pointer is NULL
	lw t1, 0(t0)
	bnez t1, else
	sw a0, 0(t0)
	j end
else:
	mv t2, t1
	lw t1, 4(t1)
	bnez t1, else #While loop
	sw a0, 4(t2) #Store in the previous node we have, before reaching NULL
end:
	li a0, 1 #OK
	ret
uninitialized_list:
	li a0, -1 #UNINITIALIZED_LIST
	ret
out_of_memory:
	li a0, -2 #OUT_OF_MEMORY
	ret
