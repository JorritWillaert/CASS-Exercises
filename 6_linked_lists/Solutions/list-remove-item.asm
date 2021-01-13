.globl list_remove_item
.eqv OK 1
.eqv UNINITIALIZED_LIST -1
.eqv OUT_OF_MEMORY -2
.eqv INDEX_OUT_OF_BOUNDS -3
.eqv UNINITIALIZED_RETVAL -4

.text
list_remove_item:
#<
	#Register allocation
	# a0: list
	# a1: index
	# t0: removed_node
	# t1: current
	# t2: i
	beqz a0, .Luninitialized_list
	
	# save caller-save registers
	addi sp, sp, -12
	sw ra, (sp)
	sw a0, 4(sp)
	sw a1, 8(sp)
	
	
	# if (index < 0 ...
	blt a1, zero, .Lindex_out_of_bounds
	
	# ... || index >= list_length(list))
	# call list_length -> list is already in the right register
	jal list_length
	mv t0, a0
	
	lw a0, 4(sp)
	lw a1, 8(sp)
	
	bge a1, t0, .Lindex_out_of_bounds
	
	# if (index == 0)
	beqz a1, .Llist_remove_first_item
	
	# } else {

	# current = list->first
	lw t1, (a0)
	
	# for (int i = 0; ...; ...)
	li t2, 0
	
	# store index - 1 in $t3
	addi t3, a1, -1
	
	# for (...; i < index - 1; ...)
.Lremove_for_loop:
	beq t2, t3, .Llist_remove_for_loop_end
	
	# current = current->next
	lw t1, 4(t1)
	
	# for (...; ...; i++)
	addi t2, t2, 1
	j .Lremove_for_loop
.Llist_remove_for_loop_end:
	# removed_node = current->next
	lw t0, 4(t1)
	
	# current->next = removed_node->next
	lw t2, 4(t0)
	sw t2, 4(t1)
	j .Llist_remove_item_ret
.Llist_remove_first_item:
	# removed_node = list->first
	lw t0, (a0)
	
	# list->first = removed_node->next
	lw t1, 4(t0)
	sw t1, (a0)
.Llist_remove_item_ret:
	#free(removed_node)
	mv a0, t0
	jal free
	
	# return OK
	li a0, OK
	j .Ldone
.Lindex_out_of_bounds:
	# return 0
	li a0, INDEX_OUT_OF_BOUNDS
.Ldone:
	lw ra, (sp)
	addi sp, sp, 12
	ret
.Luninitialized_list:
	li a0, UNINITIALIZED_LIST
	ret
#>
