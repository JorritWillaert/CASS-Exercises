.globl main
.text
handler: #Handles may not mess with the registers --> Use uscratch instead.
	csrrw zero, uscratch, t0
	csrrw t0, uepc, zero
	addi t0, t0, 4 #Move to the next instruction.
	csrrw zero, uepc, t0
	csrrw t0, uscratch, zero
	uret
main:
	la t0, handler
	csrrw zero, utvec, t0
	csrrsi zero, ustatus, 1
	lw t0, 1 #Trigger trap
	li a7, 10
	ecall #This would exit with a normal exit code 0. (This will happen because we just jump over the wrong instruction)
	