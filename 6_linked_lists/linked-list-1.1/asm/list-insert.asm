.eqv OK 1
.eqv UNINITIALIZED_LIST -1
.eqv OUT_OF_MEMORY -2
.eqv INDEX_OUT_OF_BOUNDS -3
.eqv UNINITIALIZED_RETVAL -4

.text
.globl list_insert
list_insert:
	#INPUT: a0: list; a1: index; a2: value
	#OUTPUT: a0: Either OK(-1), UNINITIALIZED_LIST(-1), OUT_OF_MEMORY(-2) or INDEX_OUT_OF_BOUNDS(-3)
	#t0: node; t1: new_node; t2: counter
	beqz a0, uninitialized_list
	bltz a1, index_out_of_bounds
	addi sp, sp, -16
	sw a0, 12(sp)
	sw a1, 8(sp)
	sw a2, 4(sp)
	sw ra, 0(sp)
	li a0, 8 #Allocate 8 bytes of space, 4 for the value and 4 for the 'next' value
	jal malloc
	mv t1, a0 #t1 = new_node
	lw ra, 0(sp)
	lw a2, 4(sp)
	lw a1, 8(sp)
	lw a0, 12(sp)
	addi sp, sp, 16
	beqz t1, out_of_memory
	lw t0, 0(a0) #t0 = node
	sw a2, 0(t1)
	bnez a1, no_front_append
	sw t1, 0(a0)
	beqz t0, ok
	sw t0, 4(t1)
	j ok
no_front_append:
	addi a1, a1, -1 #Because we use index - 1 in the loop
	li t2, 0 #t2 = counter
loop:
	bge t2, a1, end_loop
	beqz t0, free_and_out_of_bounds
	lw t0, 4(t0)
	addi t2, t2, 1
	j loop
end_loop:
	beqz t0, free_and_out_of_bounds
	lw t3, 4(t0)
	bnez t3, no_back_append #Check if 'next' value is NULL
	lw zero, 4(t1) #Not really needed, but better readable
	j change_node_next
 no_back_append: 
	sw t3, 4(t1)
change_node_next:
	sw t1, 4(t0)
ok:
	li a0, OK
	ret
uninitialized_list:
	li a0, UNINITIALIZED_LIST
	ret
out_of_memory:
	li a0, OUT_OF_MEMORY
	ret
free_and_out_of_bounds:
	mv a0, t1
	addi sp, sp, -4
	sw ra, 0(sp)
	jal free
	lw ra, 0(sp)
	addi sp, sp, 4
index_out_of_bounds:
	li a0, INDEX_OUT_OF_BOUNDS
	ret
