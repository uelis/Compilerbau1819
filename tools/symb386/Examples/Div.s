	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$3:
	MOV %eax, 235345
	MOV %edx, %eax
	SAR %edx, 31
	MOV %ecx, 4658
	IDIV %ecx
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$2:
	MOV %esp, %ebp
	POP %ebp
	RET
