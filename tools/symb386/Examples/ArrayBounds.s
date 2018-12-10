	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
L$$2:
L$$1:
	PUSH 16
	CALL L_halloc
	ADD %esp, 4
L$$0:
	MOV DWORD PTR [%eax], 0
	PUSH 10
	PUSH 5
	PUSH %eax
	CALL LA$run
	ADD %esp, 12
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	XOR %eax, %eax
L$$3:
L$$21:
	LEAVE
	RET
LA$run:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 32
L$$19:
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-16], %eax
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 12
	MOV DWORD PTR [%ebp-24], %eax
	MOV %ebx, DWORD PTR [%ebp+16]
	LEA %eax, DWORD PTR [%ebx*4+4]
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], %ebx
	MOV %ebx, DWORD PTR [%ebp-24]
	MOV DWORD PTR [%ebx], %eax
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
L$$7:
	MOV %eax, DWORD PTR [%ebp+16]
	ADD %eax, 1
	MOV %ebx, DWORD PTR [%ebp-8]
	CMP %ebx, %eax
	JL L$$8
L$$9:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp-20], %eax
	MOV %eax, DWORD PTR [%ebp-20]
	LEA %eax, DWORD PTR [%eax*4+4]
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	MOV %ecx, DWORD PTR [%ebp-20]
	MOV DWORD PTR [%eax], %ecx
	MOV DWORD PTR [%ebx], %eax
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
L$$13:
	MOV %ebx, DWORD PTR [%ebp+16]
	ADD %ebx, 1
	MOV %eax, DWORD PTR [%ebp-8]
	CMP %eax, %ebx
	JL L$$14
L$$15:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+12]
	MOV DWORD PTR [%ebp-28], %eax
	MOV %ebx, DWORD PTR [%ebp+16]
	MOV %eax, DWORD PTR [%ebp-28]
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$17
L$$16:
	CMP %ebx, 0
	JL L$$17
L$$18:
	MOV %eax, DWORD PTR [%ebp-28]
	MOV %eax, DWORD PTR [%eax+%ebx*4+4]
L$$20:
	MOV %ebx, DWORD PTR [%ebp-16]
	JMP L$$22
L$$6:
	MOV %eax, DWORD PTR [%ebp-8]
	LEA %eax, DWORD PTR [%eax*2]
	MOV %ecx, DWORD PTR [%ebp-4]
	MOV DWORD PTR [%ebx+%ecx*4+4], %eax
	MOV %eax, DWORD PTR [%ebp-8]
	LEA %eax, DWORD PTR [%eax+1]
	MOV DWORD PTR [%ebp-8], %eax
	JMP L$$7
L$$5:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$6
L$$4:
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, 0
	JL L$$5
L$$23:
	JMP L$$6
L$$17:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$18
L$$8:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+12]
	MOV %eax, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$5
L$$24:
	JMP L$$4
L$$14:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+8]
	MOV %eax, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%ebp-12], %eax
	MOV %eax, DWORD PTR [%ebp-12]
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$11
L$$10:
	MOV %eax, DWORD PTR [%ebp-12]
	CMP %eax, 0
	JL L$$11
L$$12:
	MOV %eax, DWORD PTR [%ebp-8]
	LEA %eax, DWORD PTR [%eax*2+1]
	MOV %ecx, DWORD PTR [%ebp-12]
	MOV DWORD PTR [%ebx+%ecx*4+4], %eax
	MOV %eax, DWORD PTR [%ebp-8]
	LEA %eax, DWORD PTR [%eax+1]
	MOV DWORD PTR [%ebp-8], %eax
	JMP L$$13
L$$11:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$12
L$$22:
	LEAVE
	RET
