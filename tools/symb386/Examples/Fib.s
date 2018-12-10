	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %edi
L$$8:
	PUSH 4
	CALL L_halloc
	MOV %edi, %eax
	ADD %esp, 4
	MOV DWORD PTR [%edi], 0
	PUSH 20
	PUSH %edi
	CALL LFibClass$nfib
	MOV %edi, %eax
	ADD %esp, 8
	PUSH %edi
	CALL L_println_int
	MOV %edi, %eax
	ADD %esp, 4
L$$0:
	XOR %edi, %edi
L$$7:
	MOV %eax, %edi
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LFibClass$nfib:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-8], %ebx
	MOV DWORD PTR [%ebp-4], %edi
L$$10:
	CMP DWORD PTR [%ebp+12], 2
	JGE L$$5
L$$4:
	MOV %edi, 1
L$$6:
L$$2:
	JMP L$$9
L$$5:
	MOV %edi, DWORD PTR [%ebp+12]
	SUB %edi, 1
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LFibClass$nfib
	MOV %edi, %eax
	ADD %esp, 8
	MOV %ebx, %edi
	MOV %edi, DWORD PTR [%ebp+12]
	SUB %edi, 2
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LFibClass$nfib
	MOV %edi, %eax
	ADD %esp, 8
	LEA %edi, DWORD PTR [%edi+%ebx+1]
	JMP L$$6
L$$9:
	MOV %eax, %edi
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
