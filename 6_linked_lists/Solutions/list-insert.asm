.eqv OK 1
.eqv UNINITIALIZED_LIST -1
.eqv OUT_OF_MEMORY -2
.eqv INDEX_OUT_OF_BOUNDS -3
.eqv UNINITIALIZED_RETVAL -4

.text
.globl list_insert
list_insert:
	#Register allocation:
	# a0: list
	# a1: index
	# a2: value
	# t0: node
	# t1: current
	bnez a0, .L_list_not_null
	li a0, UNINITIALIZED_LIST
	ret
	
.L_list_not_null:	
	addi sp, sp, -16
	sw ra, (sp)
	sw a0, 4(sp)
	sw a1, 8(sp)
	sw a2, 12(sp)
	

	blt a1, zero, .L_out_of_bounds
	jal list_length
	
	lw a1, 8(sp)
	bgt a1, a0, .L_out_of_bounds
	
	li a0, 8
	jal malloc
	beqz a0, .L_out_of_memory
	mv t0, a0
	
	lw a0, 4(sp)
	lw a1, 8(sp)
	lw a2, 12(sp)
	
	#node->value = value
	sw a2, (t0)
	#node->next = NULL
	sw zero, 4(t0)
	
	beqz a1, .Lindex_zero
	
	# ELSE
	lw t1, (a0)
	addi a1, a1, -1
	beqz a1, .Lend_while
	
	#current = current->next
	lw t1, 4(t1)
	
.Lend_while:
	#node->next = current->next
	lw t2, 4(t1)
	sw t2, 4(t0)
	
	#current->next = node
	sw t0, 4(t1)
	li a0, OK
	j .L_clean
	
	
.Lindex_zero:
	#node->next = list->first
	lw t1, (a0)
	sw t1, 4(t0)
	
	#list->first = node
	sw t0, (a0)
	li a0, OK
	j .L_clean
	
	
.L_out_of_bounds:
	li a0, INDEX_OUT_OF_BOUNDS
	j .L_clean
	
.L_out_of_memory:
	li a0, OUT_OF_MEMORY
	j .L_clean
	
.L_clean:
	lw ra, (sp)
	addi sp, sp, 16
	ret