.data
	str:	.word	1, 2, 3, 4, 5, 0
	substr:	.word	2, 3, 0

.text

# Register allocations:
# a0: Return value
# t0: Address of the current character in the string (for the OUTER loop)
# t1: Address of the current charcter in the substring (for the INNER loop)
# t2: Address of the current character in the string (for the INNER loop)
# t3: Holds character from the string for comparison
# t4: Holds character from the substring for comparison

main:
	# Set the t0 pointer to the start of the string
	la	t0, str

outer_loop:

	# (Re)set the t1 pointer to the start of the substring
	la	t1, substr

	# Copy the current string pointer from the outer loop to the inner loop pointer
	mv	t2, t0

inner_loop:

	# Load the string characters (represented as full words instead of single bytes)
	lw	t3, 0(t2)
	lw	t4, 0(t1)

	# Iterate through the strings by moving the inner loop pointers (step of 1 word equal to 4 bytes)
	addi	t1, t1, 4
	addi	t2, t2, 4

	# If we reach the end of the substring all characters were matched successfully
	beq	t4, zero, success

	# Else, if the current character from the string and the substring match, check the next one
	beq	t3, t4, inner_loop

	# If the characters didn't match no substring found at this position.
	# If we have not reached the end of the string, check the next position in the outer loop (step 4 bytes)
	addi	t0, t0, 4
	bnez	t3, outer_loop

	# End of the string was reached without finding a substring -> return zero
	mv	a0, zero
	j	end

success:
	# Substring found -> return 1
	li	a0, 1

end:
