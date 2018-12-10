	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$80:
	PUSH 4
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH %eax
	CALL LLL$Start
	ADD %esp, 4
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$79:
	MOV %esp, %ebp
	POP %ebp
	RET
LElement$Init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %ebx
	MOV %ecx, %esi
L$$82:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%eax+4], %ebx
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebx+8], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%ebp+20]
	MOV DWORD PTR [%eax+12], %ebx
L$$2:
	MOV %eax, 1
L$$81:
	MOV %ebx, %edx
	MOV %esi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LElement$GetAge:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$84:
L$$4:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
L$$83:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LElement$GetSalary:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$86:
L$$6:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+8]
L$$85:
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LElement$GetMarried:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$88:
L$$8:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+12]
L$$87:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LElement$Equal:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %ebx
L$$90:
	MOV %ebx, 1
	PUSH DWORD PTR [%ebp+12]
	CALL LElement$GetAge
	ADD %esp, 4
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 4
	PUSH DWORD PTR [%eax]
	PUSH %ecx
	PUSH DWORD PTR [%ebp+8]
	CALL LElement$Compare
	ADD %esp, 12
	CMP %eax, 0
	JNE L$$25
L$$24:
	XOR %ebx, %ebx
L$$26:
L$$10:
	MOV %eax, %ebx
	JMP L$$89
L$$25:
	PUSH DWORD PTR [%ebp+12]
	CALL LElement$GetSalary
	ADD %esp, 4
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	PUSH DWORD PTR [%eax]
	PUSH %ecx
	PUSH DWORD PTR [%ebp+8]
	CALL LElement$Compare
	ADD %esp, 12
	CMP %eax, 0
	JNE L$$22
L$$21:
	XOR %ebx, %ebx
L$$23:
	JMP L$$26
L$$22:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 12
	CMP DWORD PTR [%eax], 0
	JNE L$$18
L$$19:
	PUSH DWORD PTR [%ebp+12]
	CALL LElement$GetMarried
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$15
L$$16:
	XOR %eax, %eax
L$$17:
L$$20:
	JMP L$$23
L$$15:
	XOR %ebx, %ebx
	JMP L$$17
L$$18:
	PUSH DWORD PTR [%ebp+12]
	CALL LElement$GetMarried
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$13
L$$12:
	XOR %ebx, %ebx
L$$14:
	JMP L$$20
L$$13:
	XOR %eax, %eax
	JMP L$$14
L$$89:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LElement$Compare:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$92:
	XOR %eax, %eax
	MOV %eax, DWORD PTR [%ebp+16]
	ADD %eax, 1
	MOV %esi, %eax
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$33
L$$32:
	XOR %eax, %eax
L$$34:
L$$27:
	JMP L$$91
L$$33:
	CMP DWORD PTR [%ebp+12], %esi
	JGE L$$29
L$$30:
	MOV %eax, 1
L$$31:
	JMP L$$34
L$$29:
	XOR %eax, %eax
	JMP L$$31
L$$91:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LList$Init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$94:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+12], 1
L$$35:
	MOV %eax, 1
L$$93:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LList$InitNew:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
L$$96:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+20]
	MOV DWORD PTR [%ecx+12], %eax
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ecx+4], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%eax+8], %ecx
L$$37:
	MOV %eax, 1
L$$95:
	MOV %esi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LList$Insert:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %ebx
L$$98:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-8], %eax
	PUSH 16
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	MOV %ebx, %eax
	PUSH 0
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	PUSH DWORD PTR [%ebp+12]
	PUSH %ebx
	CALL LList$InitNew
	ADD %esp, 16
L$$39:
	MOV %eax, %ebx
L$$97:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LList$SetNext:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$100:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %esi, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%eax+8], %esi
L$$41:
	MOV %eax, 1
L$$99:
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LList$Delete:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 24
	MOV DWORD PTR [%ebp-24], %ebx
	MOV DWORD PTR [%ebp-12], %esi
	MOV DWORD PTR [%ebp-16], %edi
L$$102:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-8], %eax
	XOR %ebx, %ebx
	MOV %eax, -1
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-20], %eax
	MOV %esi, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %edi, DWORD PTR [%eax+12]
L$$54:
	CMP %edi, 0
	JNE L$$56
L$$57:
	CMP %ebx, 0
	JNE L$$56
L$$55:
	MOV %eax, DWORD PTR [%ebp-20]
	PUSH %eax
	CALL LList$GetElem
	ADD %esp, 4
	PUSH %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LElement$Equal
	ADD %esp, 8
	CMP %eax, 0
	JNE L$$48
L$$49:
	XOR %eax, %eax
L$$50:
	CMP %ebx, 0
	JNE L$$52
L$$51:
	MOV %esi, DWORD PTR [%ebp-20]
	MOV %eax, DWORD PTR [%ebp-20]
	PUSH %eax
	CALL LList$GetNext
	ADD %esp, 4
	MOV DWORD PTR [%ebp-20], %eax
	MOV %eax, DWORD PTR [%ebp-20]
	PUSH %eax
	CALL LList$GetEnd
	ADD %esp, 4
	MOV %edi, %eax
	MOV %eax, 1
	MOV DWORD PTR [%ebp-4], %eax
L$$53:
	JMP L$$54
L$$52:
	XOR %eax, %eax
	JMP L$$53
L$$48:
	MOV %ebx, 1
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, 0
	JGE L$$46
L$$45:
	MOV %eax, DWORD PTR [%ebp-20]
	PUSH %eax
	CALL LList$GetNext
	ADD %esp, 4
	MOV DWORD PTR [%ebp-8], %eax
L$$47:
	JMP L$$50
L$$46:
	PUSH -555
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-20]
	PUSH %eax
	CALL LList$GetNext
	ADD %esp, 4
	PUSH %eax
	PUSH %esi
	CALL LList$SetNext
	ADD %esp, 8
	PUSH -555
	CALL L_println_int
	ADD %esp, 4
	JMP L$$47
L$$56:
L$$43:
	MOV %eax, DWORD PTR [%ebp-8]
L$$101:
	MOV %ebx, DWORD PTR [%ebp-24]
	MOV %esi, DWORD PTR [%ebp-12]
	MOV %edi, DWORD PTR [%ebp-16]
	MOV %esp, %ebp
	POP %ebp
	RET
LList$Search:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %ebx
	MOV DWORD PTR [%ebp-8], %esi
L$$104:
	XOR %esi, %esi
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+12]
L$$63:
	CMP %eax, 0
	JNE L$$65
L$$64:
	PUSH %ebx
	CALL LList$GetElem
	ADD %esp, 4
	PUSH %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LElement$Equal
	ADD %esp, 8
	CMP %eax, 0
	JNE L$$60
L$$61:
	XOR %eax, %eax
L$$62:
	PUSH %ebx
	CALL LList$GetNext
	ADD %esp, 4
	MOV %ebx, %eax
	PUSH %ebx
	CALL LList$GetEnd
	ADD %esp, 4
	JMP L$$63
L$$60:
	MOV %esi, 1
	JMP L$$62
L$$65:
L$$58:
	MOV %eax, %esi
L$$103:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esi, DWORD PTR [%ebp-8]
	MOV %esp, %ebp
	POP %ebp
	RET
LList$GetEnd:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$106:
L$$66:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+12]
L$$105:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LList$GetElem:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$108:
L$$68:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
L$$107:
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LList$GetNext:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$110:
L$$70:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+8]
L$$109:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LList$Print:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$112:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+12]
L$$74:
	CMP %eax, 0
	JNE L$$76
L$$75:
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL LList$GetElem
	ADD %esp, 4
	PUSH %eax
	CALL LElement$GetAge
	ADD %esp, 4
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL LList$GetNext
	ADD %esp, 4
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL LList$GetEnd
	ADD %esp, 4
	JMP L$$74
L$$76:
L$$72:
	MOV %eax, 1
L$$111:
	MOV %esp, %ebp
	POP %ebp
	RET
LLL$Start:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-8], %ebx
	MOV DWORD PTR [%ebp-12], %esi
	MOV DWORD PTR [%ebp-4], %edi
L$$114:
	PUSH 16
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	MOV %ebx, %eax
	PUSH %ebx
	CALL LList$Init
	ADD %esp, 4
	PUSH %ebx
	CALL LList$Init
	ADD %esp, 4
	PUSH %ebx
	CALL LList$Print
	ADD %esp, 4
	PUSH 16
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	MOV %edi, %eax
	PUSH 0
	PUSH 37000
	PUSH 25
	PUSH %edi
	CALL LElement$Init
	ADD %esp, 16
	PUSH %edi
	PUSH %ebx
	CALL LList$Insert
	ADD %esp, 8
	MOV %ebx, %eax
	PUSH %ebx
	CALL LList$Print
	ADD %esp, 4
	PUSH 10000000
	CALL L_println_int
	ADD %esp, 4
	PUSH 16
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	MOV %edi, %eax
	PUSH 1
	PUSH 42000
	PUSH 39
	PUSH %edi
	CALL LElement$Init
	ADD %esp, 16
	MOV %esi, %edi
	PUSH %edi
	PUSH %ebx
	CALL LList$Insert
	ADD %esp, 8
	MOV %ebx, %eax
	PUSH %ebx
	CALL LList$Print
	ADD %esp, 4
	PUSH 10000000
	CALL L_println_int
	ADD %esp, 4
	PUSH 16
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	MOV %edi, %eax
	PUSH 0
	PUSH 34000
	PUSH 22
	PUSH %edi
	CALL LElement$Init
	ADD %esp, 16
	PUSH %edi
	PUSH %ebx
	CALL LList$Insert
	ADD %esp, 8
	MOV %ebx, %eax
	PUSH %ebx
	CALL LList$Print
	ADD %esp, 4
	PUSH 16
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	MOV %edi, %eax
	PUSH 0
	PUSH 34000
	PUSH 27
	PUSH %edi
	CALL LElement$Init
	ADD %esp, 16
	PUSH %esi
	PUSH %ebx
	CALL LList$Search
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	PUSH %edi
	PUSH %ebx
	CALL LList$Search
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	PUSH 10000000
	CALL L_println_int
	ADD %esp, 4
	PUSH 16
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	MOV %edi, %eax
	PUSH 0
	PUSH 35000
	PUSH 28
	PUSH %edi
	CALL LElement$Init
	ADD %esp, 16
	PUSH %edi
	PUSH %ebx
	CALL LList$Insert
	ADD %esp, 8
	MOV %ebx, %eax
	PUSH %ebx
	CALL LList$Print
	ADD %esp, 4
	PUSH 2220000
	CALL L_println_int
	ADD %esp, 4
	PUSH %esi
	PUSH %ebx
	CALL LList$Delete
	ADD %esp, 8
	MOV %ebx, %eax
	PUSH %ebx
	CALL LList$Print
	ADD %esp, 4
	PUSH 33300000
	CALL L_println_int
	ADD %esp, 4
	PUSH %edi
	PUSH %ebx
	CALL LList$Delete
	ADD %esp, 8
	MOV %ebx, %eax
	PUSH %ebx
	CALL LList$Print
	ADD %esp, 4
	PUSH 44440000
	CALL L_println_int
	ADD %esp, 4
L$$77:
	XOR %eax, %eax
L$$113:
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %esi, DWORD PTR [%ebp-12]
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
