.eqv OK 1
.eqv UNINITIALIZED_LIST -1
.eqv OUT_OF_MEMORY -2
.eqv INDEX_OUT_OF_BOUNDS -3
.eqv UNINITIALIZED_RETVAL -4

.globl list_length
.text
list_length:
	#Register allocation:
	# a0: list
	# t0: current
	# t1: length
#<
	# if(list == NULL) return UNINITIALIZED_LIST
	bnez a0, .L_a0_not_null
	li a0, UNINITIALIZED_LIST
	ret
	
.L_a0_not_null:
	# length = 0
	li t1, 0
	# current = list->first
	lw t0, (a0)
	
	# while (current != NULL)
.Llist_length_loop:
	beq t0, zero, .Llist_length_ret
	
	# length++
	addi t1, t1, 1
	
	# current = current->next
	lw t0, 4(t0)
	j .Llist_length_loop
.Llist_length_ret:
	# return length
	mv a0, t1
	ret
#>
