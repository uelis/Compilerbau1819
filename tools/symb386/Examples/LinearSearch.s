	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$32:
	PUSH 12
	CALL L_halloc
	MOV %edx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%edx], 0
	PUSH 10
	PUSH %edx
	CALL LLS$Start
	MOV %edx, %eax
	ADD %esp, 8
	PUSH %edx
	CALL L_println_int
	MOV %edx, %eax
	ADD %esp, 4
L$$0:
	XOR %edx, %edx
L$$31:
	MOV %eax, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LLS$Start:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$34:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LLS$Init
	MOV %edx, %eax
	ADD %esp, 8
	PUSH DWORD PTR [%ebp+8]
	CALL LLS$Print
	MOV %edx, %eax
	ADD %esp, 4
	PUSH 9999
	CALL L_println_int
	MOV %edx, %eax
	ADD %esp, 4
	PUSH 8
	PUSH DWORD PTR [%ebp+8]
	CALL LLS$Search
	MOV %edx, %eax
	ADD %esp, 8
	PUSH %edx
	CALL L_println_int
	MOV %edx, %eax
	ADD %esp, 4
	PUSH 12
	PUSH DWORD PTR [%ebp+8]
	CALL LLS$Search
	MOV %edx, %eax
	ADD %esp, 8
	PUSH %edx
	CALL L_println_int
	MOV %edx, %eax
	ADD %esp, 4
	PUSH 17
	PUSH DWORD PTR [%ebp+8]
	CALL LLS$Search
	MOV %edx, %eax
	ADD %esp, 8
	PUSH %edx
	CALL L_println_int
	MOV %edx, %eax
	ADD %esp, 4
	PUSH 50
	PUSH DWORD PTR [%ebp+8]
	CALL LLS$Search
	MOV %edx, %eax
	ADD %esp, 8
	PUSH %edx
	CALL L_println_int
	MOV %edx, %eax
	ADD %esp, 4
L$$2:
	MOV %edx, 55
L$$33:
	MOV %eax, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LLS$Print:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-8], %esi
L$$36:
	MOV %edx, 1
	MOV DWORD PTR [%ebp-4], %edx
L$$8:
	MOV %edx, DWORD PTR [%ebp+8]
	MOV %esi, DWORD PTR [%ebp-4]
	CMP %esi, DWORD PTR [%edx+8]
	JGE L$$10
L$$9:
	MOV %edx, DWORD PTR [%ebp+8]
	MOV %edx, DWORD PTR [%edx+4]
	MOV %esi, DWORD PTR [%ebp-4]
	CMP %esi, DWORD PTR [%edx]
	JGE L$$5
L$$6:
	CMP %esi, 0
	JL L$$5
L$$7:
	PUSH DWORD PTR [%edx+%esi*4+4]
	CALL L_println_int
	MOV %edx, %eax
	ADD %esp, 4
	MOV %edx, DWORD PTR [%ebp-4]
	LEA %edx, DWORD PTR [%edx+1]
	MOV DWORD PTR [%ebp-4], %edx
	JMP L$$8
L$$5:
	PUSH -17
	CALL L_raise
	MOV %edx, %eax
	ADD %esp, 4
	JMP L$$5
L$$10:
L$$4:
	XOR %edx, %edx
L$$35:
	MOV %eax, %edx
	MOV %esi, DWORD PTR [%ebp-8]
	MOV %esp, %ebp
	POP %ebp
	RET
LLS$Search:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %esi
L$$38:
	MOV %eax, 1
	XOR %edx, %edx
	XOR %esi, %esi
L$$21:
	MOV %edx, DWORD PTR [%ebp+8]
	CMP %eax, DWORD PTR [%edx+8]
	JGE L$$23
L$$22:
	MOV %edx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%edx+4]
	MOV %edx, %eax
	CMP %edx, DWORD PTR [%ecx]
	JGE L$$12
L$$13:
	CMP %edx, 0
	JL L$$12
L$$14:
	MOV %edx, DWORD PTR [%ecx+%edx*4+4]
	MOV %ecx, DWORD PTR [%ebp+12]
	ADD %ecx, 1
	CMP %edx, DWORD PTR [%ebp+12]
	JGE L$$19
L$$18:
	XOR %edx, %edx
L$$20:
	LEA %edx, DWORD PTR [%eax+1]
	MOV %eax, %edx
	JMP L$$21
L$$19:
	CMP %edx, %ecx
	JGE L$$15
L$$16:
	MOV %edx, 1
	MOV %esi, 1
	MOV %edx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%edx+8]
L$$17:
	JMP L$$20
L$$15:
	XOR %edx, %edx
	JMP L$$17
L$$12:
	PUSH -17
	CALL L_raise
	MOV %edx, %eax
	ADD %esp, 4
	JMP L$$12
L$$23:
L$$11:
	MOV %edx, %esi
L$$37:
	MOV %eax, %edx
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LLS$Init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-8], %ebx
	MOV DWORD PTR [%ebp-4], %edi
L$$40:
	MOV %edi, DWORD PTR [%ebp+8]
	MOV %edx, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%edi+8], %edx
	MOV %edx, DWORD PTR [%ebp+8]
	ADD %edx, 4
	MOV %edi, %edx
	MOV %ebx, DWORD PTR [%ebp+12]
	LEA %edx, DWORD PTR [%ebx*4+4]
	PUSH %edx
	CALL L_halloc
	MOV %edx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%edx], %ebx
	MOV DWORD PTR [%edi], %edx
	MOV %eax, 1
	MOV %edx, DWORD PTR [%ebp+8]
	ADD %edx, 8
	MOV %edx, DWORD PTR [%edx]
	ADD %edx, 1
	MOV %edi, %edx
L$$28:
	MOV %edx, DWORD PTR [%ebp+8]
	CMP %eax, DWORD PTR [%edx+8]
	JGE L$$30
L$$29:
	LEA %edx, DWORD PTR [%eax*2]
	MOV %ebx, %edx
	MOV %edx, %edi
	SUB %edx, 3
	MOV %ecx, %edx
	MOV %edx, DWORD PTR [%ebp+8]
	MOV %edx, DWORD PTR [%edx+4]
	CMP %eax, DWORD PTR [%edx]
	JGE L$$25
L$$26:
	CMP %eax, 0
	JL L$$25
L$$27:
	LEA %ebx, DWORD PTR [%ebx+%ecx]
	MOV DWORD PTR [%edx+%eax*4+4], %ebx
	LEA %edx, DWORD PTR [%eax+1]
	MOV %eax, %edx
	MOV %edx, %edi
	SUB %edx, 1
	MOV %edi, %edx
	JMP L$$28
L$$25:
	PUSH -17
	CALL L_raise
	MOV %edx, %eax
	ADD %esp, 4
	JMP L$$25
L$$30:
L$$24:
	XOR %edx, %edx
L$$39:
	MOV %eax, %edx
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
