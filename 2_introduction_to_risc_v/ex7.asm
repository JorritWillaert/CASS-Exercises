.data
	string: .string "This is a test. There should be a substring0 in this text" #Substring start at pos 33 (start counting at 0)
	substring: .string "substring"
	place: .space 4
.globl main
.text
main:
	la a1, string
	mv a3, zero
	mv s0, zero
loop_through_letters_restart:
	la a2, substring
loop_through_letters_continue:
	lb t0, 0(a1)
	lb t1, 0(a2)
	beqz t1, substring_found
	beqz t0, end
	addi a1, a1, 1
	bne t0, t1, loop_through_letters_restart
	mv a3, a1
	addi a2, a2, 1
	j loop_through_letters_continue
length_of_string: #See ex6.asù
	mv a5, a2
	lb t4, 0(a5)
	beqz t4, end
	addi s0, s0, 1
	addi a5, a5, 1
	j length_of_string
substring_found:
	la a4, string
	addi a3, a3, -1 #The address is updated before saved --> Undo last update
	sub a3, a3, s0 #a3 contained last place of substring, correct this with the length of the string
	sub a0, a3, a4
	sb a0, place, t2 #Calculate relative position
end:
