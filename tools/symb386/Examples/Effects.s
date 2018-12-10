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
	PUSH %eax
	CALL LEffectsClass$run
	ADD %esp, 4
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$8:
	MOV %esp, %ebp
	POP %ebp
	RET
LEffectsClass$run:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-4], %ebx
	MOV DWORD PTR [%ebp-12], %esi
	MOV DWORD PTR [%ebp-8], %edi
L$$11:
	PUSH 8
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	MOV %esi, %eax
L$$2:
	PUSH 1
	PUSH %esi
	CALL LBit$set
	ADD %esp, 8
	SUB %eax, 1
	MOV %edi, %eax
	PUSH 0
	PUSH %esi
	CALL LBit$set
	ADD %esp, 8
	MOV %ebx, %eax
	PUSH %esi
	CALL LBit$value
	ADD %esp, 4
	LEA %ebx, DWORD PTR [%eax+%ebx]
	MOV %eax, %edi
	SUB %eax, %ebx
L$$10:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esi, DWORD PTR [%ebp-12]
	MOV %edi, DWORD PTR [%ebp-8]
	MOV %esp, %ebp
	POP %ebp
	RET
LBit$set:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %edi
L$$13:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ecx+4], %eax
L$$4:
	MOV %eax, DWORD PTR [%ebp+12]
L$$12:
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LBit$value:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$15:
L$$6:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
L$$14:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
