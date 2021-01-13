.text
.globl list_create
list_create:
#<
	# list = malloc(sizeof(struct List)) (list in a0)
	addi sp, sp, -4
	sw ra, (sp)
	
	li a0, 4
	jal malloc
	#Don't crash if malloc returns 0 (out of memory)
	beqz a0, .L_skip
	# list->first = NULL
	sw zero, (a0)
.L_skip:
	lw ra, (sp)
	addi sp, sp, 4
	# return list
	ret
#>
