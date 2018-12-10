	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$47:
	PUSH 12
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH 10
	PUSH %eax
	CALL LBBS$Start
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$46:
	MOV %esp, %ebp
	POP %ebp
	RET
LBBS$Start:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$49:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LBBS$Init
	ADD %esp, 8
	PUSH DWORD PTR [%ebp+8]
	CALL LBBS$Print
	ADD %esp, 4
	PUSH 99999
	CALL L_println_int
	ADD %esp, 4
	PUSH DWORD PTR [%ebp+8]
	CALL LBBS$Sort
	ADD %esp, 4
	PUSH DWORD PTR [%ebp+8]
	CALL LBBS$Print
	ADD %esp, 4
L$$2:
	XOR %eax, %eax
L$$48:
	MOV %esp, %ebp
	POP %ebp
	RET
LBBS$Sort:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-8], %ebx
	MOV DWORD PTR [%ebp-4], %esi
	MOV %ecx, %edi
L$$51:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	MOV %eax, DWORD PTR [%eax]
	SUB %eax, 1
	MOV %edx, %eax
	MOV %eax, -1
	MOV DWORD PTR [%ebp-12], %eax
L$$24:
	MOV %eax, DWORD PTR [%ebp-12]
	CMP %eax, %edx
	JGE L$$26
L$$25:
	MOV %esi, 1
L$$21:
	LEA %eax, DWORD PTR [%edx+1]
	CMP %esi, %eax
	JGE L$$23
L$$22:
	MOV %eax, %esi
	SUB %eax, 1
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%ebx+4]
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$5
L$$6:
	CMP %eax, 0
	JL L$$5
L$$7:
	MOV %ebx, DWORD PTR [%ebx+%eax*4+4]
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %edi, DWORD PTR [%eax+4]
	MOV %eax, %esi
	CMP %eax, DWORD PTR [%edi]
	JGE L$$5
L$$8:
	CMP %eax, 0
	JL L$$5
L$$9:
	MOV %eax, DWORD PTR [%edi+%eax*4+4]
	CMP %eax, %ebx
	JGE L$$19
L$$18:
	MOV %eax, %esi
	SUB %eax, 1
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$5
L$$10:
	CMP %ebx, 0
	JL L$$5
L$$11:
	MOV %edi, DWORD PTR [%eax+%ebx*4+4]
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$5
L$$14:
	CMP %ebx, 0
	JL L$$5
L$$15:
	LEA %eax, DWORD PTR [%eax+%ebx*4+4]
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	CMP %esi, DWORD PTR [%eax]
	JGE L$$5
L$$12:
	CMP %esi, 0
	JL L$$5
L$$13:
	MOV %eax, DWORD PTR [%eax+%esi*4+4]
	MOV DWORD PTR [%ebx], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+4]
	MOV %eax, %esi
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$5
L$$16:
	CMP %eax, 0
	JL L$$5
L$$17:
	MOV DWORD PTR [%ebx+%eax*4+4], %edi
L$$20:
	LEA %eax, DWORD PTR [%esi+1]
	MOV %esi, %eax
	JMP L$$21
L$$5:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$5
L$$19:
	XOR %eax, %eax
	JMP L$$20
L$$23:
	MOV %eax, %edx
	SUB %eax, 1
	MOV %edx, %eax
	JMP L$$24
L$$26:
L$$4:
	XOR %eax, %eax
L$$50:
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LBBS$Print:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$53:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-4], %eax
L$$31:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, DWORD PTR [%ecx+8]
	JGE L$$33
L$$32:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ecx, DWORD PTR [%ebp-4]
	CMP %ecx, DWORD PTR [%eax]
	JGE L$$28
L$$29:
	CMP %ecx, 0
	JL L$$28
L$$30:
	PUSH DWORD PTR [%eax+%ecx*4+4]
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-4]
	LEA %eax, DWORD PTR [%eax+1]
	MOV DWORD PTR [%ebp-4], %eax
	JMP L$$31
L$$28:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$28
L$$33:
L$$27:
	XOR %eax, %eax
L$$52:
	MOV %esp, %ebp
	POP %ebp
	RET
LBBS$Init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-12], %ebx
L$$55:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebx+8], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 4
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp-8]
	LEA %eax, DWORD PTR [%eax*4+4]
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%eax], %ebx
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV DWORD PTR [%ebx], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+4]
	MOV %eax, 0
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$35
L$$36:
	MOV DWORD PTR [%ebx+4], 20
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 1
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$35
L$$37:
	MOV DWORD PTR [%eax+8], 7
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 2
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$35
L$$38:
	MOV DWORD PTR [%eax+12], 12
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 3
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$35
L$$39:
	MOV DWORD PTR [%eax+16], 18
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+4]
	MOV %eax, 4
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$35
L$$40:
	MOV DWORD PTR [%ebx+20], 2
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+4]
	MOV %eax, 5
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$35
L$$41:
	MOV DWORD PTR [%ebx+24], 11
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+4]
	MOV %eax, 6
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$35
L$$42:
	MOV DWORD PTR [%ebx+28], 6
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 7
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$35
L$$43:
	MOV DWORD PTR [%eax+32], 9
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 8
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$35
L$$44:
	MOV DWORD PTR [%eax+36], 19
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 9
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$35
L$$45:
	MOV DWORD PTR [%eax+40], 5
L$$34:
	XOR %eax, %eax
	JMP L$$54
L$$35:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$35
L$$54:
	MOV %ebx, DWORD PTR [%ebp-12]
	MOV %esp, %ebp
	POP %ebp
	RET
