	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$8:
	PUSH 4
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH 55
	PUSH %eax
	CALL LStckClass$stckme
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
LStckClass$stckme:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %ebx
L$$10:
	MOV %ebx, DWORD PTR [%ebp+12]
	CMP DWORD PTR [%ebp+12], 1
	JGE L$$5
L$$4:
L$$6:
L$$2:
	MOV %eax, %ebx
	JMP L$$9
L$$5:
	MOV %eax, DWORD PTR [%ebp+12]
	SUB %eax, 1
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LStckClass$stckme
	ADD %esp, 8
	JMP L$$6
L$$9:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
