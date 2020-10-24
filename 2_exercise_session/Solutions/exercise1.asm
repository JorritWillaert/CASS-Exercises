# This will cause the simulator to start your MIPS program at the defined main label
# Don't forget to go to settings and activate "Initialize program counter to global main if defined"
.globl main

# Start the data section of your program, where intial memory can be reserved
.data

	# Reserve one word of memory (4 bytes) and store the value 2
	a:	.word	2

	# Reserve one word of memory and store the value 3
	b:	.word	3

	# Reserve 4 bytes of memory
	c:	.space	4

# Start the text (code) section of your program
.text

# Define a label main. This is used by RARS to execute your program from this label.
main:

	# Load the value of a into t0 and b into t1
	lw	t0, a
	lw	t1, b

	# Mutliply t0 (a) with itself and store the result in t0 again. Same for t1 (b)
	mul	t0, t0, t0
	mul	t1, t1, t1

	# Add t0 and t1 (a^2 + b ^2) and store result in t0
	add	t0, t0, t1

	# Store the above result (currently in t0) in the memory reserved for c.
	# t1 is used as a temp register to resolve the address of c.
	sw	t0, c, t1
