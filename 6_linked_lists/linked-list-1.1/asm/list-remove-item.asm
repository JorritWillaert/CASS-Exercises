.globl list_remove_item
.eqv OK 1
.eqv UNINITIALIZED_LIST -1
.eqv OUT_OF_MEMORY -2
.eqv INDEX_OUT_OF_BOUNDS -3
.eqv UNINITIALIZED_RETVAL -4

.text
list_remove_item:
	#INPUT: a0: list; a1: index
	#OUTPUT: a0: Either OK (-1), UNINITIALIZED_LIST(-1) or INDEX_OUT_OF_BOUNDS(-3)
	#t0: node; t1: prev_node; t2: next_node; t3: counter
	beqz a0, uninitialized_list
	lw t0, 0(a0)
	beqz t0, index_out_of_bounds
	bltz a1, index_out_of_bounds
	li t3, 0 #Counter
	bnez a1, index_greater_than_0
	lw t0, 4(t0)
	beqz t0, index_out_of_bounds
	sw t0, 0(a0)
	j free_and_ok
index_greater_than_0:
	mv t1, t0
	lw t0, 4(t0)
	beqz t0, index_out_of_bounds
	addi t3, t3, 1
	blt t3, a1, index_greater_than_0
	lw t2, 4(t0)
	bnez t2, prev_to_next_node
	sw zero, 4(t1)
	j free_and_ok
prev_to_next_node:
	sw t2, 4(t1)	
free_and_ok:
	addi sp, sp, -4
	sw ra, 0(sp)
	mv a0, t0
	jal free
	lw ra, 0(sp)
	addi sp, sp, 4
	li a0, OK
	ret
uninitialized_list:
	li a0, UNINITIALIZED_LIST
	ret
index_out_of_bounds:
	li a0, INDEX_OUT_OF_BOUNDS
	ret