.eqv OK 1
.eqv UNINITIALIZED_LIST -1
.eqv OUT_OF_MEMORY -2
.eqv INDEX_OUT_OF_BOUNDS -3
.eqv UNINITIALIZED_RETVAL -4

.text
.globl list_print
list_print:
	#INPUT: a0: list
	#OUTPUT: a0: Either OK (-1) or UNINITIALIZED_LIST(-1)
	beqz a0, uninitialized_list
	lw t0, 0(a0) #t0 = node
	li a7, 1 #Always printing
loop:
	lw a0, 0(t0) #t2 = node->value
	ecall
	lw t0, 4(t0)
	bnez t0, loop
	li a0, OK
	ret
uninitialized_list:
	li a0, UNINITIALIZED_LIST
	ret
