.text
.globl list_create
list_create:
	#INPUT: Nothing
	#OUTPUT: a0: Pointer to the first element, 0 if there is was not enough space
	addi sp, sp, -4
	sw ra, 0(sp)
	li a0, 4 #Allocate only 4 bytes
	jal malloc
	lw ra, 0(sp)
	addi sp, sp, 4
	ret
