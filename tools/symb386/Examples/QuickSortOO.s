	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$74:
	PUSH 20
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH 10
	PUSH %eax
	CALL LTestQS$Start
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$73:
	MOV %esp, %ebp
	POP %ebp
	RET
LQS$Sort:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
	MOV DWORD PTR [%ebp-12], %ebx
L$$76:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 4
	MOV %eax, DWORD PTR [%eax]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$5
L$$4:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebx+4], %eax
L$$6:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$50
L$$49:
	MOV %eax, DWORD PTR [%ebp+20]
	MOV %ebx, DWORD PTR [%ebp+16]
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$3
L$$7:
	CMP %ebx, 0
	JL L$$3
L$$8:
	MOV %eax, DWORD PTR [%eax+%ebx*4+4]
	MOV DWORD PTR [%ebp-16], %eax
	MOV %eax, DWORD PTR [%ebp+12]
	SUB %eax, 1
	MOV %ebx, %eax
	MOV %ecx, DWORD PTR [%ebp+16]
	MOV %eax, 1
L$$36:
	CMP %eax, 0
	JNE L$$37
L$$38:
	MOV %eax, DWORD PTR [%ebp+20]
	CMP %ecx, DWORD PTR [%eax]
	JGE L$$3
L$$41:
	CMP %ecx, 0
	JL L$$3
L$$42:
	LEA %eax, DWORD PTR [%eax+%ecx*4+4]
	MOV %ecx, %eax
	MOV %edx, DWORD PTR [%ebp+20]
	MOV %eax, %ebx
	CMP %eax, DWORD PTR [%edx]
	JGE L$$3
L$$39:
	CMP %eax, 0
	JL L$$3
L$$40:
	MOV %eax, DWORD PTR [%edx+%eax*4+4]
	MOV DWORD PTR [%ecx], %eax
	MOV %ecx, DWORD PTR [%ebp+20]
	MOV %eax, %ebx
	CMP %eax, DWORD PTR [%ecx]
	JGE L$$3
L$$45:
	CMP %eax, 0
	JL L$$3
L$$46:
	LEA %eax, DWORD PTR [%ecx+%eax*4+4]
	MOV %edx, DWORD PTR [%ebp+20]
	MOV %ecx, DWORD PTR [%ebp+16]
	CMP %ecx, DWORD PTR [%edx]
	JGE L$$3
L$$43:
	CMP %ecx, 0
	JL L$$3
L$$44:
	MOV %ecx, DWORD PTR [%edx+%ecx*4+4]
	MOV DWORD PTR [%eax], %ecx
	MOV %eax, DWORD PTR [%ebp+20]
	MOV %edx, DWORD PTR [%ebp+16]
	CMP %edx, DWORD PTR [%eax]
	JGE L$$3
L$$47:
	CMP %edx, 0
	JL L$$3
L$$48:
	MOV %ecx, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%eax+%edx*4+4], %ecx
	PUSH DWORD PTR [%ebp+20]
	MOV %eax, %ebx
	SUB %eax, 1
	PUSH %eax
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LQS$Sort
	ADD %esp, 16
	PUSH DWORD PTR [%ebp+20]
	PUSH DWORD PTR [%ebp+16]
	LEA %eax, DWORD PTR [%ebx+1]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LQS$Sort
	ADD %esp, 16
L$$51:
L$$2:
	XOR %eax, %eax
	JMP L$$75
L$$3:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$3
L$$37:
	MOV %eax, 1
L$$14:
	CMP %eax, 0
	JNE L$$15
L$$16:
	MOV %eax, 1
L$$22:
	CMP %eax, 0
	JNE L$$23
L$$24:
	MOV %eax, DWORD PTR [%ebp+20]
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$3
L$$25:
	CMP %ebx, 0
	JL L$$3
L$$26:
	MOV %eax, DWORD PTR [%eax+%ebx*4+4]
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp+20]
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$3
L$$29:
	CMP %ebx, 0
	JL L$$3
L$$30:
	LEA %eax, DWORD PTR [%eax+%ebx*4+4]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %edx, DWORD PTR [%ebp+20]
	MOV %eax, %ecx
	CMP %eax, DWORD PTR [%edx]
	JGE L$$3
L$$27:
	CMP %eax, 0
	JL L$$3
L$$28:
	MOV %eax, DWORD PTR [%edx+%eax*4+4]
	MOV %edx, DWORD PTR [%ebp-4]
	MOV DWORD PTR [%edx], %eax
	MOV %eax, DWORD PTR [%ebp+20]
	CMP %ecx, DWORD PTR [%eax]
	JGE L$$3
L$$31:
	CMP %ecx, 0
	JL L$$3
L$$32:
	MOV %edx, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%eax+%ecx*4+4], %edx
	LEA %eax, DWORD PTR [%ebx+1]
	CMP %ecx, %eax
	JGE L$$34
L$$33:
	XOR %eax, %eax
L$$35:
	JMP L$$36
L$$34:
	MOV %eax, 1
	JMP L$$35
L$$23:
	MOV %eax, %ecx
	SUB %eax, 1
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp+20]
	CMP %ecx, DWORD PTR [%eax]
	JGE L$$3
L$$17:
	CMP %ecx, 0
	JL L$$3
L$$18:
	MOV %edx, DWORD PTR [%eax+%ecx*4+4]
	MOV %eax, DWORD PTR [%ebp-16]
	CMP %eax, %edx
	JGE L$$19
L$$20:
	MOV %eax, 1
L$$21:
	JMP L$$22
L$$19:
	XOR %eax, %eax
	JMP L$$21
L$$15:
	LEA %eax, DWORD PTR [%ebx+1]
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ebp+20]
	CMP %ebx, DWORD PTR [%eax]
	JGE L$$3
L$$9:
	CMP %ebx, 0
	JL L$$3
L$$10:
	MOV %edx, DWORD PTR [%eax+%ebx*4+4]
	MOV %eax, DWORD PTR [%ebp-16]
	CMP %edx, %eax
	JGE L$$11
L$$12:
	MOV %eax, 1
L$$13:
	JMP L$$14
L$$11:
	XOR %eax, %eax
	JMP L$$13
L$$50:
	XOR %eax, %eax
	JMP L$$51
L$$5:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%ebx+4], %eax
	JMP L$$6
L$$75:
	MOV %ebx, DWORD PTR [%ebp-12]
	MOV %esp, %ebp
	POP %ebp
	RET
LTestQS$Print:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-8], %ebx
L$$78:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-4], %eax
L$$56:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, DWORD PTR [%ebx+12]
	JGE L$$58
L$$57:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+8]
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$53
L$$54:
	CMP %eax, 0
	JL L$$53
L$$55:
	PUSH DWORD PTR [%ebx+%eax*4+4]
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-4]
	LEA %eax, DWORD PTR [%eax+1]
	MOV DWORD PTR [%ebp-4], %eax
	JMP L$$56
L$$53:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$53
L$$58:
L$$52:
	XOR %eax, %eax
L$$77:
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %esp, %ebp
	POP %ebp
	RET
LTestQS$Init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
L$$80:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ecx+12], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp-8]
	LEA %eax, DWORD PTR [%eax*4+4]
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%ecx], %eax
	MOV %eax, DWORD PTR [%ebp-4]
	MOV DWORD PTR [%eax], %ecx
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%eax+8]
	MOV %eax, 0
	CMP %eax, DWORD PTR [%ecx]
	JGE L$$60
L$$61:
	MOV DWORD PTR [%ecx+4], 20
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%eax+8]
	MOV %eax, 1
	CMP %eax, DWORD PTR [%ecx]
	JGE L$$60
L$$62:
	MOV DWORD PTR [%ecx+8], 7
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%eax+8]
	MOV %eax, 2
	CMP %eax, DWORD PTR [%ecx]
	JGE L$$60
L$$63:
	MOV DWORD PTR [%ecx+12], 12
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%eax+8]
	MOV %eax, 3
	CMP %eax, DWORD PTR [%ecx]
	JGE L$$60
L$$64:
	MOV DWORD PTR [%ecx+16], 18
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%eax+8]
	MOV %eax, 4
	CMP %eax, DWORD PTR [%ecx]
	JGE L$$60
L$$65:
	MOV DWORD PTR [%ecx+20], 2
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+8]
	MOV %ecx, 5
	CMP %ecx, DWORD PTR [%eax]
	JGE L$$60
L$$66:
	MOV DWORD PTR [%eax+24], 11
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+8]
	MOV %ecx, 6
	CMP %ecx, DWORD PTR [%eax]
	JGE L$$60
L$$67:
	MOV DWORD PTR [%eax+28], 6
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+8]
	MOV %ecx, 7
	CMP %ecx, DWORD PTR [%eax]
	JGE L$$60
L$$68:
	MOV DWORD PTR [%eax+32], 9
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+8]
	MOV %ecx, 8
	CMP %ecx, DWORD PTR [%eax]
	JGE L$$60
L$$69:
	MOV DWORD PTR [%eax+36], 19
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+8]
	MOV %ecx, 9
	CMP %ecx, DWORD PTR [%eax]
	JGE L$$60
L$$70:
	MOV DWORD PTR [%eax+40], 5
L$$59:
	XOR %eax, %eax
	JMP L$$79
L$$60:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$60
L$$79:
	MOV %esp, %ebp
	POP %ebp
	RET
LTestQS$Start:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$82:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+4], 0
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LTestQS$Init
	ADD %esp, 8
	PUSH DWORD PTR [%ebp+8]
	CALL LTestQS$Print
	ADD %esp, 4
	PUSH 9999
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 12
	MOV %eax, DWORD PTR [%eax]
	SUB %eax, 1
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 8
	PUSH DWORD PTR [%ecx]
	PUSH %eax
	PUSH 0
	PUSH DWORD PTR [%ebp+8]
	CALL LQS$Sort
	ADD %esp, 16
	PUSH DWORD PTR [%ebp+8]
	CALL LTestQS$Print
	ADD %esp, 4
	PUSH 9999
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 4
	PUSH DWORD PTR [%eax]
	CALL L_println_int
	ADD %esp, 4
L$$71:
	XOR %eax, %eax
L$$81:
	MOV %esp, %ebp
	POP %ebp
	RET
