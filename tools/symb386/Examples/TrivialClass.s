	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$5:
	PUSH 8
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH %eax
	CALL LC$value
	ADD %esp, 4
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$4:
	MOV %esp, %ebp
	POP %ebp
	RET
LC$value:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$7:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+4], 555
L$$2:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
L$$6:
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
