.eqv OK 1
.eqv UNINITIALIZED_LIST -1
.eqv OUT_OF_MEMORY -2
.eqv INDEX_OUT_OF_BOUNDS -3
.eqv UNINITIALIZED_RETVAL -4

.text
.globl list_get
list_get:
	#INPUT: a0: list; a1: index; a2: value
	#OUTPUT: a0: Either OK (-1), UNINITIALIZED_LIST(-1), INDEX_OUT_OF_BOUNDS(-3) or UNINITIALIZED_VALUE (-4)
	beqz a0, uninitialized_list
	lw t0, 0(a0) #t0 = node
	beqz t0, index_out_of_bounds
	bltz a1, index_out_of_bounds
	li t1, 0 #t1 = i (counter)
loop:
	beq t1, a1, end_loop
	lw t0, 4(t0)
	beqz t0, index_out_of_bounds
	addi t1, t1, 1
	j loop
end_loop:
	beqz a2, uninitialized_retval
	lw t2, 0(t0) #node->val
	sw t2, 0(a2)
	li a0, OK
	ret
uninitialized_list:
	li a0, UNINITIALIZED_LIST
	ret
index_out_of_bounds:
	li a0, INDEX_OUT_OF_BOUNDS
	ret
uninitialized_retval:
	li a0, UNINITIALIZED_RETVAL
	ret