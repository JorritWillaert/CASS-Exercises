.text
.globl list_create
list_create:
	addi sp, sp, -4
	sw ra, 0(sp)
	li a0, 4 #Allocate only 4 bytes
	jal malloc
	lw ra, 0(sp)
	addi sp, sp, 4
	ret #a0 contains the pointer to the first element, or is 0 if there was not enough space
