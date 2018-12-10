	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %edi
L$$30:
	PUSH 4
	CALL L_halloc
	MOV %edi, %eax
	ADD %esp, 4
	MOV DWORD PTR [%edi], 0
	PUSH %edi
	CALL LE1$run
	MOV %edi, %eax
	ADD %esp, 4
	PUSH %edi
	CALL L_println_int
	MOV %edi, %eax
	ADD %esp, 4
L$$0:
	XOR %edi, %edi
L$$29:
	MOV %eax, %edi
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LE1$run:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 20
	MOV DWORD PTR [%ebp-8], %ebx
	MOV DWORD PTR [%ebp-12], %esi
	MOV DWORD PTR [%ebp-20], %edi
L$$32:
	MOV %edi, 9000
	LEA %eax, DWORD PTR [%edi+9]
	MOV DWORD PTR [%ebp-16], %eax
	LEA %edi, DWORD PTR [%edi+9]
	MOV %ebx, %edi
	LEA %edi, DWORD PTR [%ebx*4+4]
	PUSH %edi
	CALL L_halloc
	MOV %edi, %eax
	ADD %esp, 4
	MOV DWORD PTR [%edi], %ebx
	MOV %ebx, %edi
	XOR %edi, %edi
	MOV DWORD PTR [%ebp-4], %edi
	MOV %edi, %ebx
	MOV %eax, 0
	CMP %eax, DWORD PTR [%edi]
	JGE L$$3
L$$4:
	MOV DWORD PTR [%edi+4], 0
	MOV %edi, %ebx
	MOV %eax, 1
	CMP %eax, DWORD PTR [%edi]
	JGE L$$3
L$$5:
	MOV DWORD PTR [%edi+8], 2
	MOV %ecx, 2
L$$8:
	MOV %edi, DWORD PTR [%ebp-16]
	CMP %ecx, %edi
	JGE L$$10
L$$9:
	MOV %edi, %ebx
	MOV %eax, %ecx
	CMP %eax, DWORD PTR [%edi]
	JGE L$$3
L$$6:
	CMP %eax, 0
	JL L$$3
L$$7:
	MOV DWORD PTR [%edi+%eax*4+4], 1
	LEA %edi, DWORD PTR [%ecx+1]
	MOV %ecx, %edi
	JMP L$$8
L$$3:
	PUSH -17
	CALL L_raise
	MOV %edi, %eax
	ADD %esp, 4
	JMP L$$3
L$$10:
L$$18:
	MOV %eax, 9
	MOV %edi, DWORD PTR [%ebp-16]
	CMP %eax, %edi
	JGE L$$20
L$$19:
	MOV %edi, DWORD PTR [%ebp-16]
	SUB %edi, 1
	MOV %ecx, %edi
L$$15:
	MOV %edi, 0
	CMP %edi, %ecx
	JGE L$$17
L$$16:
	CMP %ecx, DWORD PTR [%ebx]
	JGE L$$3
L$$11:
	CMP %ecx, 0
	JL L$$3
L$$12:
	MOV %eax, DWORD PTR [%ebp-4]
	MOV %edx, %eax
	SAR %edx, 31
	IDIV %ecx
	MOV %edi, %eax
	MOV %eax, %edi
	IMUL %eax, %ecx
	MOV %edi, DWORD PTR [%ebp-4]
	SUB %edi, %eax
	MOV DWORD PTR [%ebx+%ecx*4+4], %edi
	MOV %edi, %ecx
	SUB %edi, 1
	MOV %esi, %edi
	CMP %esi, DWORD PTR [%ebx]
	JGE L$$3
L$$13:
	CMP %esi, 0
	JL L$$3
L$$14:
	MOV %eax, DWORD PTR [%ebp-4]
	MOV %edx, %eax
	SAR %edx, 31
	IDIV %ecx
	MOV %edi, 10
	IMUL %edi, DWORD PTR [%ebx+%esi*4+4]
	ADD %edi, %eax
	MOV DWORD PTR [%ebp-4], %edi
	MOV %edi, %ecx
	SUB %edi, 1
	MOV %ecx, %edi
	JMP L$$15
L$$17:
	MOV %edi, DWORD PTR [%ebp-4]
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LE1$print
	MOV %edi, %eax
	ADD %esp, 8
	MOV %edi, DWORD PTR [%ebp-16]
	SUB %edi, 1
	MOV DWORD PTR [%ebp-16], %edi
	JMP L$$18
L$$20:
L$$2:
	XOR %edi, %edi
L$$31:
	MOV %eax, %edi
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %esi, DWORD PTR [%ebp-12]
	MOV %edi, DWORD PTR [%ebp-20]
	MOV %esp, %ebp
	POP %ebp
	RET
LE1$print:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %edi
L$$34:
	MOV %edi, -1
	MOV DWORD PTR [%ebp-8], %edi
L$$23:
	MOV %eax, DWORD PTR [%ebp+12]
	MOV %edx, %eax
	SAR %edx, 31
	MOV %edi, DWORD PTR [%ebp-8]
	IDIV %edi
	MOV %edi, %eax
	CMP %edi, -9
	JGE L$$25
L$$24:
	MOV %edi, DWORD PTR [%ebp-8]
	IMUL %edi, 10
	MOV DWORD PTR [%ebp-8], %edi
	JMP L$$23
L$$25:
L$$26:
	MOV %edi, DWORD PTR [%ebp-8]
	CMP %edi, 0
	JGE L$$28
L$$27:
	MOV %eax, DWORD PTR [%ebp+12]
	MOV %edx, %eax
	SAR %edx, 31
	MOV %edi, DWORD PTR [%ebp-8]
	IDIV %edi
	MOV %edi, %eax
	MOV %eax, 48
	SUB %eax, %edi
	PUSH %eax
	CALL L_print_char
	MOV %edi, %eax
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp+12]
	MOV %edx, %eax
	SAR %edx, 31
	MOV %edi, DWORD PTR [%ebp-8]
	IDIV %edi
	MOV %edi, %eax
	MOV %eax, %edi
	MOV %edi, DWORD PTR [%ebp-8]
	IMUL %eax, %edi
	MOV %edi, DWORD PTR [%ebp+12]
	SUB %edi, %eax
	MOV DWORD PTR [%ebp+12], %edi
	MOV %eax, DWORD PTR [%ebp-8]
	MOV %edx, %eax
	SAR %edx, 31
	MOV %edi, 10
	IDIV %edi
	MOV %edi, %eax
	MOV DWORD PTR [%ebp-8], %edi
	JMP L$$26
L$$28:
L$$21:
	XOR %edi, %edi
L$$33:
	MOV %eax, %edi
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
