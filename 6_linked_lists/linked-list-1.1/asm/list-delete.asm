.eqv OK 1
.eqv UNINITIALIZED_LIST -1
.eqv OUT_OF_MEMORY -2
.eqv INDEX_OUT_OF_BOUNDS -3
.eqv UNINITIALIZED_RETVAL -4

.text
.globl list_delete
list_delete:
	#INPUT: a0: list
	#OUTPUT: a0: Either OK (-1) or UNINITIALIZED_LIST(-1)
	#t0: node; t1: next_node
	beqz a0, uninitialized_list
	lw t0, 0(a0)
	beqz t0, end_and_ok
loop:
	lw t1, 4(t0)
	beqz t1, end_and_ok
	addi sp, sp, -12
	sw ra, 0(sp)
	sw t1, 4(sp)
	sw a0, 8(sp)
	mv a0, t0
	jal free
	lw a0, 8(sp)
	lw t1, 4(sp)
	lw ra, 0(sp)
	addi sp, sp, 12
	mv t0, t1
	j loop
end_and_ok:
	addi sp, sp, -8
	sw ra, 0(sp)
	sw t0, 4(sp)
	jal free #Free list
	lw t0, 4(sp) 
	mv a0, t0 #Free node
	jal free
	lw ra, 0(sp)
	addi sp, sp, 8
	li a0, OK
	ret
uninitialized_list:
	li a0, UNINITIALIZED_LIST
	ret
