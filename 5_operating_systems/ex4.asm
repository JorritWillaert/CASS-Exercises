.data
	back_up_registers: .space 100
	first_text: .string "Exception with cause "
	second_text: .string " occured at address 0x"
.globl main
.text
handler: #Store all registers we will use in back_up_registers, with t0 the address it. Use uscratch to store the original value of t0.
	csrrw zero, uscratch, t0
	la t0, back_up_registers
	sw a7, 0(t0)
	li a7, 4
	sw a0, 4(t0)
	la a0, first_text
	ecall
	li a7, 1
	csrrw a0, ucause, zero
	ecall
	li a7, 4
	la a0, second_text
	ecall
	li a7, 1
	csrrw a0, uepc, zero
	ecall
	addi a0, a0, 4 #a0 still contains uepc, so instead of restoring first in uepc and then using t0, directly use a0.
	csrrw zero, uepc, a0
	lw a0, 4(t0)
	lw a7, 0(t0)
	csrrw t0, uscratch, zero
	uret
main:
	la t0, handler
	csrrw zero, utvec, t0
	csrrsi zero, ustatus, 1
	lw t0, 1 #Trigger trap
	li a7, 10
	ecall #This would exit with a normal exit code 0. (This will happen because we just jump over the wrong instruction)
	
