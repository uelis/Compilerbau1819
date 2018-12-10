	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %edi
L$$10:
	PUSH 8
	CALL L_halloc
	MOV %edi, %eax
	ADD %esp, 4
	MOV DWORD PTR [%edi], 0
	PUSH 5
	PUSH 0
	PUSH %edi
	CALL LCounterClass$f
	MOV %edi, %eax
	ADD %esp, 12
	PUSH %edi
	CALL L_println_int
	MOV %edi, %eax
	ADD %esp, 4
L$$0:
	XOR %edi, %edi
L$$9:
	MOV %eax, %edi
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LCounterClass$getValue:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$12:
L$$2:
	MOV %edi, DWORD PTR [%ebp+8]
	MOV %edi, DWORD PTR [%edi+4]
L$$11:
	MOV %eax, %edi
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LCounterClass$f:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %edi
L$$14:
	XOR %edi, %edi
	CMP DWORD PTR [%ebp+16], 1
	JGE L$$7
L$$6:
L$$8:
L$$4:
	JMP L$$13
L$$7:
	MOV %edi, DWORD PTR [%ebp+16]
	SUB %edi, 1
	PUSH %edi
	MOV %edi, DWORD PTR [%ebp+12]
	ADD %edi, DWORD PTR [%ebp+16]
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LCounterClass$f
	MOV %edi, %eax
	ADD %esp, 12
	JMP L$$8
L$$13:
	MOV %eax, %edi
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
