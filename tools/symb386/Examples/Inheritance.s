	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %ebx
L$$9:
	PUSH 12
	CALL L_halloc
	MOV %ebx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%ebp-8], %ebx
	PUSH 4
	CALL L_halloc
	MOV %ebx, %eax
	ADD %esp, 4
	LEA %ecx, LB$m
	MOV DWORD PTR [%ebx], %ecx
	MOV %ecx, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%ecx], %ebx
	MOV %ebx, DWORD PTR [%ebp-8]
	PUSH %ebx
	CALL LA$init
	MOV %ebx, %eax
	ADD %esp, 4
	PUSH %ebx
	CALL L_println_int
	MOV %ebx, %eax
	ADD %esp, 4
L$$0:
	XOR %ebx, %ebx
L$$8:
	MOV %eax, %ebx
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LA$init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %ebx
L$$11:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebx+4], 10
	PUSH DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%ebx]
	ADD %ebx, 0
	MOV %ebx, DWORD PTR [%ebx]
	CALL %ebx
	MOV %ebx, %eax
	ADD %esp, 4
L$$2:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%ebx+4]
L$$10:
	MOV %eax, %ebx
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LA$m:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %ebx
L$$13:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebx+4], 20
	PUSH 0
	CALL L_println_int
	MOV %ebx, %eax
	ADD %esp, 4
L$$4:
	MOV %ebx, DWORD PTR [%ebp+8]
L$$12:
	MOV %eax, %ebx
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LB$m:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %ebx
L$$15:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebx+8], 30
	PUSH 1
	CALL L_println_int
	MOV %ebx, %eax
	ADD %esp, 4
L$$6:
	MOV %ebx, DWORD PTR [%ebp+8]
L$$14:
	MOV %eax, %ebx
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
