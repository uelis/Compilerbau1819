	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$10:
	PUSH 8
	CALL L_halloc
	MOV %edx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%edx], 0
	PUSH 5
	PUSH 0
	PUSH %edx
	CALL LSumClass$f
	MOV %edx, %eax
	ADD %esp, 12
	PUSH %edx
	CALL L_println_int
	MOV %edx, %eax
	ADD %esp, 4
L$$0:
	XOR %edx, %edx
L$$9:
	MOV %eax, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LSumClass$f:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-8], %ebx
	MOV DWORD PTR [%ebp-4], %edi
L$$12:
	MOV %edx, DWORD PTR [%ebp+12]
	ADD %edx, DWORD PTR [%ebp+16]
	MOV %ebx, %edx
	MOV %edx, DWORD PTR [%ebp+8]
	ADD %edx, 4
	MOV %edi, %edx
	PUSH %ebx
	PUSH DWORD PTR [%ebp+8]
	CALL LSumClass$g
	MOV %edx, %eax
	ADD %esp, 8
	MOV DWORD PTR [%edi], %edx
	CMP DWORD PTR [%ebp+16], 1
	JGE L$$5
L$$4:
	MOV %edx, %ebx
L$$6:
L$$2:
	JMP L$$11
L$$5:
	MOV %edx, DWORD PTR [%ebp+16]
	SUB %edx, 1
	PUSH %edx
	PUSH %ebx
	PUSH DWORD PTR [%ebp+8]
	CALL LSumClass$f
	MOV %edx, %eax
	ADD %esp, 12
	JMP L$$6
L$$11:
	MOV %eax, %edx
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LSumClass$g:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %ebx
L$$14:
L$$7:
	MOV %eax, DWORD PTR [%ebp+12]
L$$13:
	MOV %ebx, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
