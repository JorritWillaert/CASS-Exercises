.globl main
.data
	array:	.word	1, 2, 3, 4, 5
	const:	.word	3
	size:	.word	5

# Register allocations:
# t0 -> Temporary counter used in multiplication
# t1 -> Pointer within array
# t2 -> Loop counter
# t3 -> Current value in the array (pointed to by t1)
# t4 -> Intermediate and end result of the multiplication
# t5 -> Constant value

.text
main:
	# Load the address of array into t1
	la	t1, array

	lw	t2, size
	lw	t5, const

array_loop:
	# Move the value in t5 (constant) to t0 and set t4 to zero
	mv	t0, t5
	mv	t4, zero

	# Load the value stored at memory address t1 + 0 into t3
	lw	t3, 0(t1)

multiply_loop:
	add	t4, t4, t3
	addi	t0, t0, -1

	# Jump to multiply_loop if the value in t0 is greater than zero
	# The multiply loop will add the current array value x times to t4 with x being equal to the constant value
	bgtz	t0, multiply_loop

	sw	t4, 0(t1)

	# Iterate through the array with step of 1 word (4 bytes)
	addi	t1, t1, 4

	addi	t2, t2, -1
	bgtz	t2, array_loop
