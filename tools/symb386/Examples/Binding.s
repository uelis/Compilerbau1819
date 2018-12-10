	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$9:
	PUSH 4
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH 10
	PUSH 5
	PUSH %eax
	CALL LB$run
	ADD %esp, 12
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$8:
	MOV %esp, %ebp
	POP %ebp
	RET
LB$run:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$11:
	MOV %eax, 0
	CMP %eax, 1
	JGE L$$5
L$$7:
	MOV %eax, DWORD PTR [%ebp+16]
	IMUL %eax, DWORD PTR [%ebp+16]
	MOV %esi, DWORD PTR [%ebp+12]
	ADD %esi, %eax
	MOV %eax, DWORD PTR [%ebp+12]
	ADD %eax, DWORD PTR [%ebp+16]
	IMUL %eax, DWORD PTR [%ebp+16]
	CMP %esi, %eax
	JGE L$$5
L$$4:
	MOV %eax, DWORD PTR [%ebp+12]
L$$6:
L$$2:
	JMP L$$10
L$$5:
	MOV %eax, DWORD PTR [%ebp+16]
	JMP L$$6
L$$10:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
