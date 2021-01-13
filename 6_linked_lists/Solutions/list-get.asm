.eqv OK 1
.eqv UNINITIALIZED_LIST -1
.eqv OUT_OF_MEMORY -2
.eqv INDEX_OUT_OF_BOUNDS -3
.eqv UNINITIALIZED_RETVAL -4

.text
.globl list_get
list_get:
#<
	#Register allocation:
	# a0: list
	# a1: index
	# a2: value (address!)
	# t0: current
	# t1: i
	
	# if (list == NULL) return UNINITIALIZED_LIST
	bnez a0, .L_list_not_null
	li a0, UNINITIALIZED_LIST
	ret
	
	# if(
.L_list_not_null:
	bnez a2, .L_value_not_null
	li a0, UNINITIALIZED_RETVAL
	ret

.L_value_not_null:
	# ... || index >= list_length(list))
	# save caller-save registers since we are calling a function
	addi sp, sp, -16
	sw ra, (sp)
	sw a0, 4(sp)
	sw a1, 8(sp)
	sw a2, 12(sp)
	
	# if (index < 0 ...
	blt a1, zero, .Llist_get_out_of_bounds
	
	# call list_length -> list is already in the right register
	jal list_length
	
	# restore return address and index
	lw ra, (sp)
	lw a1, 8(sp)
	
	# index >= list_length(list) ?
	bge a1, a0, .Llist_get_out_of_bounds
	
	# restore arguments list and value
	lw a0, 4(sp)
	lw a2, 12(sp)
	addi sp, sp, 16
	
	# current = list->first
	lw t0, (a0)
	
	# for (int i = 0; ...; ...)
	li t1, 0
	
.Llist_get_loop:
	# for (...; i < index; ...)
	beq t1, a1, .Llist_get_ret
	
	# current = current->next
	lw t0, 4(t0)
	
	# for (...; ...; i++)
	addi t1, t1, 1
	j .Llist_get_loop
.Llist_get_ret:
	# *value = current->value
	lw t0, (t0)
	sw t0, (a2)
	
	# return 1
	li a0, OK
	ret
.Llist_get_out_of_bounds:
	# return 0
	li a0, INDEX_OUT_OF_BOUNDS
	addi sp, sp, 16
	ret
#>
