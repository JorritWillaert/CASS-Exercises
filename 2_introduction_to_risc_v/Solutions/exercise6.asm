.globl main
.data
	# Reserve enough memory to store the null-terminated string Hello (at least 6 bytes, 1 byte per character)
	# Store the corresponding ASCII characters in those bytes (in little endian order)
	str:	.string	"Hello"

.text
main:
	la	t0, str
	li	a0, 0
loop:
	# Load the byte at the address t0 + 0 in t1
	lb	t1, 0(t0)

	beqz	t1, end
	addi	t0, t0, 1
	addi	a0, a0, 1
	j	loop
end:
