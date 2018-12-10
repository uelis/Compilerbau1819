	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$8:
	PUSH 12
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH 10
	PUSH %eax
	CALL LF$compute
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$7:
	MOV %esp, %ebp
	POP %ebp
	RET
LF$compute:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$10:
	CMP DWORD PTR [%ebp+12], 1
	JGE L$$5
L$$4:
	MOV %eax, 1
L$$6:
L$$2:
	JMP L$$9
L$$5:
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp+12]
	SUB %eax, 1
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LF$compute
	ADD %esp, 8
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp-4]
	IMUL %eax, %ecx
	JMP L$$6
L$$9:
	MOV %esp, %ebp
	POP %ebp
	RET
