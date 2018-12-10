	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$75:
	PUSH 12
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH 20
	PUSH %eax
	CALL LBS$Start
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$74:
	MOV %esp, %ebp
	POP %ebp
	RET
LBS$Start:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$77:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LBS$Init
	ADD %esp, 8
	PUSH DWORD PTR [%ebp+8]
	CALL LBS$Print
	ADD %esp, 4
	PUSH 8
	PUSH DWORD PTR [%ebp+8]
	CALL LBS$Search
	ADD %esp, 8
	CMP %eax, 0
	JNE L$$4
L$$5:
	PUSH 0
	CALL L_println_int
	ADD %esp, 4
L$$6:
	PUSH 19
	PUSH DWORD PTR [%ebp+8]
	CALL LBS$Search
	ADD %esp, 8
	CMP %eax, 0
	JNE L$$7
L$$8:
	PUSH 0
	CALL L_println_int
	ADD %esp, 4
L$$9:
	PUSH 20
	PUSH DWORD PTR [%ebp+8]
	CALL LBS$Search
	ADD %esp, 8
	CMP %eax, 0
	JNE L$$10
L$$11:
	PUSH 0
	CALL L_println_int
	ADD %esp, 4
L$$12:
	PUSH 21
	PUSH DWORD PTR [%ebp+8]
	CALL LBS$Search
	ADD %esp, 8
	CMP %eax, 0
	JNE L$$13
L$$14:
	PUSH 0
	CALL L_println_int
	ADD %esp, 4
L$$15:
	PUSH 37
	PUSH DWORD PTR [%ebp+8]
	CALL LBS$Search
	ADD %esp, 8
	CMP %eax, 0
	JNE L$$16
L$$17:
	PUSH 0
	CALL L_println_int
	ADD %esp, 4
L$$18:
	PUSH 38
	PUSH DWORD PTR [%ebp+8]
	CALL LBS$Search
	ADD %esp, 8
	CMP %eax, 0
	JNE L$$19
L$$20:
	PUSH 0
	CALL L_println_int
	ADD %esp, 4
L$$21:
	PUSH 39
	PUSH DWORD PTR [%ebp+8]
	CALL LBS$Search
	ADD %esp, 8
	CMP %eax, 0
	JNE L$$22
L$$23:
	PUSH 0
	CALL L_println_int
	ADD %esp, 4
L$$24:
	PUSH 50
	PUSH DWORD PTR [%ebp+8]
	CALL LBS$Search
	ADD %esp, 8
	CMP %eax, 0
	JNE L$$25
L$$26:
	PUSH 0
	CALL L_println_int
	ADD %esp, 4
L$$27:
L$$2:
	MOV %eax, 999
	JMP L$$76
L$$25:
	PUSH 1
	CALL L_println_int
	ADD %esp, 4
	JMP L$$27
L$$22:
	PUSH 1
	CALL L_println_int
	ADD %esp, 4
	JMP L$$24
L$$19:
	PUSH 1
	CALL L_println_int
	ADD %esp, 4
	JMP L$$21
L$$16:
	PUSH 1
	CALL L_println_int
	ADD %esp, 4
	JMP L$$18
L$$13:
	PUSH 1
	CALL L_println_int
	ADD %esp, 4
	JMP L$$15
L$$10:
	PUSH 1
	CALL L_println_int
	ADD %esp, 4
	JMP L$$12
L$$7:
	PUSH 1
	CALL L_println_int
	ADD %esp, 4
	JMP L$$9
L$$4:
	PUSH 1
	CALL L_println_int
	ADD %esp, 4
	JMP L$$6
L$$76:
	MOV %esp, %ebp
	POP %ebp
	RET
LBS$Search:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-12], %esi
	MOV DWORD PTR [%ebp-4], %edi
L$$79:
	XOR %esi, %esi
	XOR %eax, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 4
	MOV %eax, DWORD PTR [%eax]
	MOV %edi, DWORD PTR [%eax]
	MOV %eax, %edi
	SUB %eax, 1
	MOV %edi, %eax
	MOV %eax, 1
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, 1
L$$41:
	CMP %eax, 0
	JNE L$$42
L$$43:
	PUSH DWORD PTR [%ebp+12]
	PUSH %esi
	PUSH DWORD PTR [%ebp+8]
	CALL LBS$Compare
	ADD %esp, 12
	CMP %eax, 0
	JNE L$$44
L$$45:
	XOR %eax, %eax
L$$46:
L$$28:
	JMP L$$78
L$$44:
	MOV %eax, 1
	JMP L$$46
L$$42:
	MOV %eax, DWORD PTR [%ebp-8]
	LEA %eax, DWORD PTR [%edi+%eax]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LBS$Div
	ADD %esp, 8
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ecx+4]
	CMP %eax, DWORD PTR [%ecx]
	JGE L$$29
L$$30:
	CMP %eax, 0
	JL L$$29
L$$31:
	MOV %esi, DWORD PTR [%ecx+%eax*4+4]
	CMP DWORD PTR [%ebp+12], %esi
	JGE L$$33
L$$32:
	SUB %eax, 1
	MOV %edi, %eax
L$$34:
	PUSH DWORD PTR [%ebp+12]
	PUSH %esi
	PUSH DWORD PTR [%ebp+8]
	CALL LBS$Compare
	ADD %esp, 12
	CMP %eax, 0
	JNE L$$35
L$$36:
	MOV %eax, 1
L$$37:
	MOV %ecx, DWORD PTR [%ebp-8]
	CMP %edi, %ecx
	JGE L$$39
L$$38:
	XOR %eax, %eax
L$$40:
	JMP L$$41
L$$39:
	XOR %ecx, %ecx
	JMP L$$40
L$$35:
	XOR %eax, %eax
	JMP L$$37
L$$33:
	LEA %eax, DWORD PTR [%eax+1]
	MOV DWORD PTR [%ebp-8], %eax
	JMP L$$34
L$$29:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$29
L$$78:
	MOV %esi, DWORD PTR [%ebp-12]
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LBS$Div:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %edi
L$$81:
	XOR %eax, %eax
	XOR %edi, %edi
	MOV %edx, DWORD PTR [%ebp+12]
	SUB %edx, 1
L$$49:
	CMP %edi, %edx
	JGE L$$51
L$$50:
	LEA %eax, DWORD PTR [%eax+1]
	LEA %edi, DWORD PTR [%edi+2]
	JMP L$$49
L$$51:
L$$47:
L$$80:
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LBS$Compare:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %edi
L$$83:
	XOR %eax, %eax
	MOV %eax, DWORD PTR [%ebp+16]
	ADD %eax, 1
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$58
L$$57:
	XOR %eax, %eax
L$$59:
L$$52:
	JMP L$$82
L$$58:
	CMP DWORD PTR [%ebp+12], %ecx
	JGE L$$54
L$$55:
	MOV %eax, 1
L$$56:
	JMP L$$59
L$$54:
	XOR %eax, %eax
	JMP L$$56
L$$82:
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LBS$Print:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-8], %ebx
L$$85:
	MOV %eax, 1
	MOV DWORD PTR [%ebp-4], %eax
L$$64:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, DWORD PTR [%ebx+8]
	JGE L$$66
L$$65:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, DWORD PTR [%ebx]
	JGE L$$61
L$$62:
	CMP %eax, 0
	JL L$$61
L$$63:
	PUSH DWORD PTR [%ebx+%eax*4+4]
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-4]
	LEA %eax, DWORD PTR [%eax+1]
	MOV DWORD PTR [%ebp-4], %eax
	JMP L$$64
L$$61:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$61
L$$66:
	PUSH 99999
	CALL L_println_int
	ADD %esp, 4
L$$60:
	XOR %eax, %eax
L$$84:
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %esp, %ebp
	POP %ebp
	RET
LBS$Init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
	MOV DWORD PTR [%ebp-16], %ebx
	MOV DWORD PTR [%ebp-8], %esi
L$$87:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebx+8], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 4
	MOV %esi, %eax
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-12], %eax
	MOV %eax, DWORD PTR [%ebp-12]
	LEA %eax, DWORD PTR [%eax*4+4]
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ebp-12]
	MOV DWORD PTR [%ebx], %eax
	MOV DWORD PTR [%esi], %ebx
	MOV %ebx, 1
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	MOV %eax, DWORD PTR [%eax]
	ADD %eax, 1
	MOV DWORD PTR [%ebp-4], %eax
L$$71:
	MOV %eax, DWORD PTR [%ebp+8]
	CMP %ebx, DWORD PTR [%eax+8]
	JGE L$$73
L$$72:
	LEA %eax, DWORD PTR [%ebx*2]
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp-4]
	SUB %eax, 3
	MOV %edx, DWORD PTR [%ebp+8]
	MOV %edx, DWORD PTR [%edx+4]
	CMP %ebx, DWORD PTR [%edx]
	JGE L$$68
L$$69:
	CMP %ebx, 0
	JL L$$68
L$$70:
	LEA %eax, DWORD PTR [%ecx+%eax]
	MOV DWORD PTR [%edx+%ebx*4+4], %eax
	LEA %eax, DWORD PTR [%ebx+1]
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ebp-4]
	SUB %eax, 1
	MOV DWORD PTR [%ebp-4], %eax
	JMP L$$71
L$$68:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$68
L$$73:
L$$67:
	XOR %eax, %eax
L$$86:
	MOV %ebx, DWORD PTR [%ebp-16]
	MOV %esi, DWORD PTR [%ebp-8]
	MOV %esp, %ebp
	POP %ebp
	RET
