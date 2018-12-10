	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$71:
	PUSH 12
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH 10
	PUSH %eax
	CALL LQS$Start
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$70:
	MOV %esp, %ebp
	POP %ebp
	RET
LQS$Start:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$73:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LQS$Init
	ADD %esp, 8
	PUSH DWORD PTR [%ebp+8]
	CALL LQS$Print
	ADD %esp, 4
	PUSH 9999
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	MOV %eax, DWORD PTR [%eax]
	SUB %eax, 1
	PUSH %eax
	PUSH 0
	PUSH DWORD PTR [%ebp+8]
	CALL LQS$Sort
	ADD %esp, 12
	PUSH DWORD PTR [%ebp+8]
	CALL LQS$Print
	ADD %esp, 4
L$$2:
	XOR %eax, %eax
L$$72:
	MOV %esp, %ebp
	POP %ebp
	RET
LQS$Sort:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-12], %edi
L$$75:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$49
L$$48:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%ebp+16]
	CMP %eax, DWORD PTR [%ecx]
	JGE L$$5
L$$6:
	CMP %eax, 0
	JL L$$5
L$$7:
	MOV %ecx, DWORD PTR [%ecx+%eax*4+4]
	MOV %eax, DWORD PTR [%ebp+12]
	SUB %eax, 1
	MOV DWORD PTR [%ebp-4], %eax
	MOV %edx, DWORD PTR [%ebp+16]
	MOV %eax, 1
L$$35:
	CMP %eax, 0
	JNE L$$36
L$$37:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ecx, %edx
	CMP %ecx, DWORD PTR [%eax]
	JGE L$$5
L$$40:
	CMP %ecx, 0
	JL L$$5
L$$41:
	LEA %eax, DWORD PTR [%eax+%ecx*4+4]
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %edx, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, DWORD PTR [%edx]
	JGE L$$5
L$$38:
	CMP %eax, 0
	JL L$$5
L$$39:
	MOV %eax, DWORD PTR [%edx+%eax*4+4]
	MOV DWORD PTR [%ecx], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ecx, DWORD PTR [%ebp-4]
	CMP %ecx, DWORD PTR [%eax]
	JGE L$$5
L$$44:
	CMP %ecx, 0
	JL L$$5
L$$45:
	LEA %eax, DWORD PTR [%eax+%ecx*4+4]
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %edx, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%ebp+16]
	CMP %eax, DWORD PTR [%edx]
	JGE L$$5
L$$42:
	CMP %eax, 0
	JL L$$5
L$$43:
	MOV %eax, DWORD PTR [%edx+%eax*4+4]
	MOV DWORD PTR [%ecx], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%ebp+16]
	CMP %eax, DWORD PTR [%ecx]
	JGE L$$5
L$$46:
	CMP %eax, 0
	JL L$$5
L$$47:
	MOV %edx, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%ecx+%eax*4+4], %edx
	MOV %eax, DWORD PTR [%ebp-4]
	SUB %eax, 1
	PUSH %eax
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LQS$Sort
	ADD %esp, 12
	PUSH DWORD PTR [%ebp+16]
	MOV %eax, DWORD PTR [%ebp-4]
	LEA %eax, DWORD PTR [%eax+1]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LQS$Sort
	ADD %esp, 12
L$$50:
L$$4:
	XOR %eax, %eax
	JMP L$$74
L$$5:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$5
L$$36:
	MOV %eax, 1
L$$13:
	CMP %eax, 0
	JNE L$$14
L$$15:
	MOV %eax, 1
L$$21:
	CMP %eax, 0
	JNE L$$22
L$$23:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %edi, DWORD PTR [%ebp-4]
	CMP %edi, DWORD PTR [%eax]
	JGE L$$5
L$$24:
	CMP %edi, 0
	JL L$$5
L$$25:
	MOV %eax, DWORD PTR [%eax+%edi*4+4]
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %edi, DWORD PTR [%ebp-4]
	CMP %edi, DWORD PTR [%eax]
	JGE L$$5
L$$28:
	CMP %edi, 0
	JL L$$5
L$$29:
	LEA %eax, DWORD PTR [%eax+%edi*4+4]
	MOV %edi, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	CMP %edx, DWORD PTR [%eax]
	JGE L$$5
L$$26:
	CMP %edx, 0
	JL L$$5
L$$27:
	MOV %eax, DWORD PTR [%eax+%edx*4+4]
	MOV DWORD PTR [%edi], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %edi, DWORD PTR [%eax+4]
	CMP %edx, DWORD PTR [%edi]
	JGE L$$5
L$$30:
	CMP %edx, 0
	JL L$$5
L$$31:
	MOV %eax, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%edi+%edx*4+4], %eax
	MOV %eax, DWORD PTR [%ebp-4]
	LEA %eax, DWORD PTR [%eax+1]
	CMP %edx, %eax
	JGE L$$33
L$$32:
	XOR %eax, %eax
L$$34:
	JMP L$$35
L$$33:
	MOV %eax, 1
	JMP L$$34
L$$22:
	MOV %eax, %edx
	SUB %eax, 1
	MOV %edx, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	CMP %edx, DWORD PTR [%eax]
	JGE L$$5
L$$16:
	CMP %edx, 0
	JL L$$5
L$$17:
	MOV %eax, DWORD PTR [%eax+%edx*4+4]
	CMP %ecx, %eax
	JGE L$$18
L$$19:
	MOV %eax, 1
L$$20:
	JMP L$$21
L$$18:
	XOR %eax, %eax
	JMP L$$20
L$$14:
	MOV %eax, DWORD PTR [%ebp-4]
	LEA %eax, DWORD PTR [%eax+1]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %edi, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, DWORD PTR [%edi]
	JGE L$$5
L$$8:
	CMP %eax, 0
	JL L$$5
L$$9:
	MOV %eax, DWORD PTR [%edi+%eax*4+4]
	CMP %eax, %ecx
	JGE L$$10
L$$11:
	MOV %eax, 1
L$$12:
	JMP L$$13
L$$10:
	XOR %eax, %eax
	JMP L$$12
L$$49:
	XOR %eax, %eax
	JMP L$$50
L$$74:
	MOV %edi, DWORD PTR [%ebp-12]
	MOV %esp, %ebp
	POP %ebp
	RET
LQS$Print:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$77:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-4], %eax
L$$55:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ebp-4]
	CMP %ecx, DWORD PTR [%eax+8]
	JGE L$$57
L$$56:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, DWORD PTR [%ecx]
	JGE L$$52
L$$53:
	CMP %eax, 0
	JL L$$52
L$$54:
	PUSH DWORD PTR [%ecx+%eax*4+4]
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-4]
	LEA %eax, DWORD PTR [%eax+1]
	MOV DWORD PTR [%ebp-4], %eax
	JMP L$$55
L$$52:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$52
L$$57:
L$$51:
	XOR %eax, %eax
L$$76:
	MOV %esp, %ebp
	POP %ebp
	RET
LQS$Init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-12], %ebx
L$$79:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebx+8], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 4
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp-4]
	LEA %eax, DWORD PTR [%eax*4+4]
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV DWORD PTR [%eax], %ebx
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%ebx], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 0
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$59
L$$60:
	MOV DWORD PTR [%eax+4], 20
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+4]
	MOV %eax, 1
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$59
L$$61:
	MOV DWORD PTR [%ebx+8], 7
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 2
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$59
L$$62:
	MOV DWORD PTR [%eax+12], 12
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 3
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$59
L$$63:
	MOV DWORD PTR [%eax+16], 18
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+4]
	MOV %eax, 4
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$59
L$$64:
	MOV DWORD PTR [%ebx+20], 2
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+4]
	MOV %eax, 5
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$59
L$$65:
	MOV DWORD PTR [%ebx+24], 11
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 6
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$59
L$$66:
	MOV DWORD PTR [%eax+28], 6
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 7
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$59
L$$67:
	MOV DWORD PTR [%eax+32], 9
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+4]
	MOV %eax, 8
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$59
L$$68:
	MOV DWORD PTR [%ebx+36], 19
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+4]
	MOV %eax, 9
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$59
L$$69:
	MOV DWORD PTR [%ebx+40], 5
L$$58:
	XOR %eax, %eax
	JMP L$$78
L$$59:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$59
L$$78:
	MOV %ebx, DWORD PTR [%ebp-12]
	MOV %esp, %ebp
	POP %ebp
	RET
