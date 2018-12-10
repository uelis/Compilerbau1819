	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$8:
	PUSH 4
	CALL L_halloc
	MOV %edx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%edx], 0
	PUSH %edx
	CALL LAA$run
	MOV %edx, %eax
	ADD %esp, 4
	PUSH %edx
	CALL L_println_int
	MOV %edx, %eax
	ADD %esp, 4
L$$0:
	XOR %edx, %edx
L$$7:
	MOV %eax, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LAA$run:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %edi
L$$10:
	MOV %edi, 2
	LEA %edx, DWORD PTR [%edi*4+4]
	PUSH %edx
	CALL L_halloc
	MOV %edx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%edx], %edi
	MOV %edi, %edx
	MOV %edx, 0
	CMP %edx, DWORD PTR [%edi]
	JGE L$$3
L$$4:
	MOV DWORD PTR [%edi+4], 5
	MOV %edx, 1
	CMP %edx, DWORD PTR [%edi]
	JGE L$$3
L$$5:
	MOV DWORD PTR [%edi+8], 10
L$$2:
	MOV %edx, 0
	CMP %edx, DWORD PTR [%edi]
	JGE L$$3
L$$6:
	MOV %edx, DWORD PTR [%edi+4]
	JMP L$$9
L$$3:
	PUSH -17
	CALL L_raise
	MOV %edx, %eax
	ADD %esp, 4
	JMP L$$3
L$$9:
	MOV %eax, %edx
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
