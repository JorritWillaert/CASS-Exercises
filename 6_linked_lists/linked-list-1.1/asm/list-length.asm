.eqv OK 1
.eqv UNINITIALIZED_LIST -1
.eqv OUT_OF_MEMORY -2
.eqv INDEX_OUT_OF_BOUNDS -3
.eqv UNINITIALIZED_RETVAL -4

.globl list_length
.text
list_length:
	beqz a0, uninitialized_list
	lw t0, 0(a0)
	li a0, 0 #Counter
loop:
	beqz t0, return_length
	addi a0, a0, 1
	lw t0, 4(t0)
	j loop
return_length:
	ret
uninitialized_list:
	li a0, UNINITIALIZED_LIST
	ret