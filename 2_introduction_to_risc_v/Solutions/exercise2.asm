.globl main
main:
	# Set some test values
	li	s1, 20  # g
	li	s2, 30  # h
	li	s3, 40  # i
	li	s4, 50  # j
	li	s5, 3   # k

# case0:
	# Jump to case1 if s5 is not equal to t0
	bne	s5, zero, case1
	add	s0, s3, s4  # f = i + j
	j	end

case1:
	li	t0, 1
	bne	s5, t0, case2
	add	s0, s1, s2  # f = g + h
	j	end

case2:
	li	t0, 2
	bne	s5, t0, case3
	sub	s0, s1, s2  # f = g - h
	j	end

case3:
	li	t0, 3
	bne	s5, t0, end
	sub	s0, s3, s4  # f = i - j
	j	end

end:
