.eqv OK 1
.eqv UNINITIALIZED_LIST -1
.eqv OUT_OF_MEMORY -2
.eqv INDEX_OUT_OF_BOUNDS -3
.eqv UNINITIALIZED_RETVAL -4

.text
.globl list_append
list_append:
	# Function register allocation
	# a0: list
	# a1: value
	# t0: node
	# t1: current
	# t2: old_current
#<
	bnez a0, .L_a0_not_null
	li a0, UNINITIALIZED_LIST
	ret

.L_a0_not_null:
	# Reserve space on call stack
	addi sp, sp, -12
	
	#Store caller-save regs
	sw ra, (sp)
	sw a0, 4(sp)
	sw a1, 8(sp)
	
	# node = malloc(sizeof(struct ListNode))
	li a0, 8
	jal malloc
	beqz a0, .L_out_of_memory
	
	mv t0, a0
	
	
	# Restore caller-save regs
	lw ra, (sp)
	lw a0, 4(sp)
	lw a1, 8(sp)
	addi sp, sp, 12
		
	# node->value = value
	# node->next = NULL
	sw a1, (t0)
	sw zero, 4(t0)
	
	# if (list->first == NULL)
	lw t1, (a0)
	beqz t1, .Llist_append_init_first
	
	# while (current->next != NULL)
.Llist_append_start_loop:
	# current = current->next
	mv t2, t1
	lw t1, 4(t1)
	beqz t1, .Llist_append_end_loop
	j .Llist_append_start_loop
.Llist_append_end_loop:
	# current->next = node
	sw t0, 4(t2)
	li a0, OK
	ret
.Llist_append_init_first:
	# list->first = node
	sw t0, (a0)
	li a0, OK
	ret
.L_out_of_memory:
	lw ra, (sp)
	addi sp, sp, 12
	li a0, OUT_OF_MEMORY
	ret
	
#>
