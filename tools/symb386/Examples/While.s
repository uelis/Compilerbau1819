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
	PUSH %eax
	CALL LWhileClass$run
	ADD %esp, 4
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$7:
	MOV %esp, %ebp
	POP %ebp
	RET
LWhileClass$run:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %ebx
L$$10:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
	MOV %ebx, 1
L$$4:
	CMP %ebx, 11
	JGE L$$6
L$$5:
	MOV %eax, DWORD PTR [%ebp-8]
	LEA %eax, DWORD PTR [%eax+%ebx]
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	LEA %eax, DWORD PTR [%ebx+1]
	MOV %ebx, %eax
	JMP L$$4
L$$6:
L$$2:
	XOR %eax, %eax
L$$9:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
