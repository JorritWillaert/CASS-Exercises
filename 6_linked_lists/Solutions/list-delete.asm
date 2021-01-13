.eqv OK 1
.eqv UNINITIALIZED_LIST -1
.eqv OUT_OF_MEMORY -2
.eqv INDEX_OUT_OF_BOUNDS -3
.eqv UNINITIALIZED_RETVAL -4

.text
.globl list_delete
list_delete:
#<
	# Register allocation
	#	a0; list
	#	t0: current
	#	t1: previous
	bnez a0, .L_list_not_null
	li a0, UNINITIALIZED_LIST
	ret	
	
.L_list_not_null:
	addi sp, sp, -12
	sw ra, (sp)
	sw a0, 4(sp)
	
	# current = list->first
	lw t0, (a0)
	
	# while (current != NULL)
.Llist_delete_loop:
	beq t0, zero, .Llist_delete_ret
	
	# previous = current
	mv t1, t0
	
	# current = current->next
	lw t0, 4(t0)
	
	# free(previous)
	mv a0, t1
	
	sw t0, 4(sp)
	sw t1, 8(sp)
	jal free
	lw t0, 4(sp)
	lw t1, 8(sp)
	j .Llist_delete_loop
.Llist_delete_ret:
	# free(list)
	lw a0, 4(sp)
	jal free
	
	lw ra, (sp)
	addi sp, sp, 12
	li a0, OK
	ret
#>	
