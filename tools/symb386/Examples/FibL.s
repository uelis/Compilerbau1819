	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$47:
	PUSH 4
	CALL L_halloc
	MOV %ecx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%ecx], 0
	PUSH 5
	PUSH %ecx
	CALL LFib$nfib_lazy
	MOV %ecx, %eax
	ADD %esp, 8
	PUSH %ecx
	CALL L_println_int
	MOV %ecx, %eax
	ADD %esp, 4
L$$0:
	XOR %ecx, %ecx
L$$46:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LFib$nfib:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$49:
	CMP DWORD PTR [%ebp+12], 2
	JGE L$$5
L$$4:
	MOV %ecx, 1
L$$6:
L$$2:
	JMP L$$48
L$$5:
	MOV %ecx, DWORD PTR [%ebp+12]
	SUB %ecx, 1
	PUSH %ecx
	PUSH DWORD PTR [%ebp+8]
	CALL LFib$nfib
	MOV %ecx, %eax
	ADD %esp, 8
	MOV DWORD PTR [%ebp-4], %ecx
	MOV %ecx, DWORD PTR [%ebp+12]
	SUB %ecx, 2
	PUSH %ecx
	PUSH DWORD PTR [%ebp+8]
	CALL LFib$nfib
	MOV %ecx, %eax
	ADD %esp, 8
	MOV %edx, DWORD PTR [%ebp-4]
	LEA %ecx, DWORD PTR [%ecx+%edx+1]
	JMP L$$6
L$$48:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LFib$nfib_lazy:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$51:
	CMP DWORD PTR [%ebp+12], 1
	JGE L$$10
L$$9:
	XOR %ecx, %ecx
L$$11:
	PUSH 8
	CALL L_halloc
	MOV %ecx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%ecx], 0
	MOV DWORD PTR [%ebp-4], %ecx
	PUSH DWORD PTR [%ebp+12]
	MOV %ecx, DWORD PTR [%ebp-4]
	PUSH %ecx
	CALL LLazyArray$init
	MOV %ecx, %eax
	ADD %esp, 8
	PUSH DWORD PTR [%ebp+12]
	MOV %ecx, DWORD PTR [%ebp-4]
	PUSH %ecx
	CALL LLazyArray$nfib
	MOV %ecx, %eax
	ADD %esp, 8
L$$7:
	JMP L$$50
L$$10:
	XOR %ecx, %ecx
	JMP L$$11
L$$50:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LLazyArray$init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
L$$53:
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 4
	MOV DWORD PTR [%ebp-8], %ecx
	MOV %ecx, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-4], %ecx
	MOV %ecx, DWORD PTR [%ebp-4]
	LEA %ecx, DWORD PTR [%ecx*4+4]
	PUSH %ecx
	CALL L_halloc
	MOV %ecx, %eax
	ADD %esp, 4
	MOV %edx, %ecx
	MOV %ecx, DWORD PTR [%ebp-4]
	MOV DWORD PTR [%edx], %ecx
	MOV %ecx, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%ecx], %edx
	XOR %edx, %edx
L$$16:
	CMP %edx, DWORD PTR [%ebp+12]
	JGE L$$18
L$$17:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ecx+4]
	CMP %edx, DWORD PTR [%ecx]
	JGE L$$13
L$$14:
	CMP %edx, 0
	JL L$$13
L$$15:
	MOV DWORD PTR [%ecx+%edx*4+4], 0
	LEA %ecx, DWORD PTR [%edx+1]
	MOV %edx, %ecx
	JMP L$$16
L$$13:
	PUSH -17
	CALL L_raise
	MOV %ecx, %eax
	ADD %esp, 4
	JMP L$$13
L$$18:
L$$12:
	MOV %ecx, 1
L$$52:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LLazyArray$defined:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %ebx
L$$55:
	CMP DWORD PTR [%ebp+12], 0
	JGE L$$25
L$$24:
	MOV %edx, 1
L$$26:
L$$19:
	JMP L$$54
L$$25:
	MOV %edx, 0
	CMP %edx, DWORD PTR [%ebp+12]
	JGE L$$22
L$$21:
	MOV %edx, 1
L$$23:
	JMP L$$26
L$$22:
	XOR %edx, %edx
	JMP L$$23
L$$54:
	MOV %eax, %edx
	MOV %ebx, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LLazyArray$get:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$57:
	CMP DWORD PTR [%ebp+12], 1
	JGE L$$30
L$$29:
	XOR %ecx, %ecx
L$$31:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ecx+4]
	MOV %edx, DWORD PTR [%ebp+12]
	CMP %edx, DWORD PTR [%ecx]
	JGE L$$28
L$$32:
	CMP %edx, 0
	JL L$$28
L$$33:
	MOV %ecx, DWORD PTR [%ecx+%edx*4+4]
	MOV DWORD PTR [%ebp-4], %ecx
	MOV %ecx, DWORD PTR [%ebp-4]
	PUSH %ecx
	PUSH DWORD PTR [%ebp+8]
	CALL LLazyArray$defined
	MOV %ecx, %eax
	ADD %esp, 8
	CMP %ecx, 0
	JNE L$$36
L$$37:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LLazyArray$f
	MOV %ecx, %eax
	ADD %esp, 8
	MOV %edx, %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ecx+4]
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ecx]
	JGE L$$28
L$$34:
	CMP %eax, 0
	JL L$$28
L$$35:
	MOV DWORD PTR [%ecx+%eax*4+4], %edx
	MOV %ecx, %edx
L$$38:
L$$27:
	JMP L$$56
L$$28:
	PUSH -17
	CALL L_raise
	MOV %ecx, %eax
	ADD %esp, 4
	JMP L$$28
L$$36:
	MOV %ecx, DWORD PTR [%ebp-4]
	JMP L$$38
L$$30:
	XOR %ecx, %ecx
	JMP L$$31
L$$56:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LLazyArray$f:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$59:
L$$39:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LLazyArray$nfib
	MOV %ecx, %eax
	ADD %esp, 8
L$$58:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LLazyArray$nfib:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$61:
	CMP DWORD PTR [%ebp+12], 2
	JGE L$$44
L$$43:
	MOV %ecx, 1
L$$45:
L$$41:
	JMP L$$60
L$$44:
	MOV %ecx, DWORD PTR [%ebp+12]
	SUB %ecx, 1
	PUSH %ecx
	PUSH DWORD PTR [%ebp+8]
	CALL LLazyArray$get
	MOV %ecx, %eax
	ADD %esp, 8
	MOV DWORD PTR [%ebp-4], %ecx
	MOV %ecx, DWORD PTR [%ebp+12]
	SUB %ecx, 2
	PUSH %ecx
	PUSH DWORD PTR [%ebp+8]
	CALL LLazyArray$get
	MOV %ecx, %eax
	ADD %esp, 8
	MOV %edx, DWORD PTR [%ebp-4]
	LEA %ecx, DWORD PTR [%ecx+%edx+1]
	JMP L$$45
L$$60:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
