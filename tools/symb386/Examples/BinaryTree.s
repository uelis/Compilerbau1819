	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$121:
	PUSH 4
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH %eax
	CALL LBT$Start
	ADD %esp, 4
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$120:
	MOV %esp, %ebp
	POP %ebp
	RET
LBT$Start:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-8], %ebx
	MOV DWORD PTR [%ebp-4], %edi
L$$123:
	PUSH 24
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	MOV %ebx, %eax
	PUSH 16
	PUSH %ebx
	CALL LTree$Init
	ADD %esp, 8
	PUSH %ebx
	CALL LTree$Print
	ADD %esp, 4
	PUSH 100000000
	CALL L_println_int
	ADD %esp, 4
	PUSH 8
	PUSH %ebx
	CALL LTree$Insert
	ADD %esp, 8
	PUSH %ebx
	CALL LTree$Print
	ADD %esp, 4
	PUSH 24
	PUSH %ebx
	CALL LTree$Insert
	ADD %esp, 8
	PUSH 4
	PUSH %ebx
	CALL LTree$Insert
	ADD %esp, 8
	PUSH 12
	PUSH %ebx
	CALL LTree$Insert
	ADD %esp, 8
	PUSH 20
	PUSH %ebx
	CALL LTree$Insert
	ADD %esp, 8
	PUSH 28
	PUSH %ebx
	CALL LTree$Insert
	ADD %esp, 8
	PUSH 14
	PUSH %ebx
	CALL LTree$Insert
	ADD %esp, 8
	PUSH %ebx
	CALL LTree$Print
	ADD %esp, 4
	PUSH 24
	PUSH %ebx
	CALL LTree$Search
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	PUSH 12
	PUSH %ebx
	CALL LTree$Search
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	PUSH 16
	PUSH %ebx
	CALL LTree$Search
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	PUSH 50
	PUSH %ebx
	CALL LTree$Search
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	PUSH 12
	PUSH %ebx
	CALL LTree$Search
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	PUSH 12
	PUSH %ebx
	CALL LTree$Delete
	ADD %esp, 8
	PUSH %ebx
	CALL LTree$Print
	ADD %esp, 4
	PUSH 12
	PUSH %ebx
	CALL LTree$Search
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$2:
	XOR %eax, %eax
L$$122:
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$Init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$125:
	MOV %esi, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%esi+12], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+16], 0
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+20], 0
L$$4:
	MOV %eax, 1
L$$124:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$SetRight:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %ebx
	MOV %edx, %esi
	MOV %ecx, %edi
L$$127:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%eax+8], %ebx
L$$6:
	MOV %eax, 1
L$$126:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$SetLeft:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %ebx
	MOV %edx, %esi
L$$129:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%eax+4], %ebx
L$$8:
	MOV %eax, 1
L$$128:
	MOV %ebx, %ecx
	MOV %esi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$GetRight:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$131:
L$$10:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+8]
L$$130:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$GetLeft:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$133:
L$$12:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
L$$132:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$GetKey:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$135:
L$$14:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+12]
L$$134:
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$SetKey:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$137:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %esi, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%eax+12], %esi
L$$16:
	MOV %eax, 1
L$$136:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$GetHas_Right:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$139:
L$$18:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+20]
L$$138:
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$GetHas_Left:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$141:
L$$20:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+16]
L$$140:
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$SetHas_Left:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %edi
L$$143:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%eax+16], %ecx
L$$22:
	MOV %eax, 1
L$$142:
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$SetHas_Right:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$145:
	MOV %esi, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%esi+20], %eax
L$$24:
	MOV %eax, 1
L$$144:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$Compare:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %ebx
	MOV %ecx, %esi
	MOV %edx, %edi
L$$147:
	XOR %eax, %eax
	MOV %eax, DWORD PTR [%ebp+16]
	ADD %eax, 1
	MOV %ebx, DWORD PTR [%ebp+12]
	CMP %ebx, DWORD PTR [%ebp+16]
	JGE L$$32
L$$31:
	XOR %eax, %eax
L$$33:
L$$26:
	JMP L$$146
L$$32:
	CMP DWORD PTR [%ebp+12], %eax
	JGE L$$28
L$$29:
	MOV %eax, 1
L$$30:
	JMP L$$33
L$$28:
	XOR %eax, %eax
	JMP L$$30
L$$146:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$Insert:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
	MOV DWORD PTR [%ebp-16], %ebx
	MOV DWORD PTR [%ebp-12], %esi
	MOV DWORD PTR [%ebp-4], %edi
L$$149:
	PUSH 24
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	MOV %ebx, %eax
	PUSH DWORD PTR [%ebp+12]
	PUSH %ebx
	CALL LTree$Init
	ADD %esp, 8
	MOV %esi, DWORD PTR [%ebp+8]
	MOV %eax, 1
	MOV DWORD PTR [%ebp-8], %eax
L$$45:
	MOV %eax, DWORD PTR [%ebp-8]
	CMP %eax, 0
	JNE L$$46
L$$47:
L$$34:
	MOV %eax, 1
	JMP L$$148
L$$46:
	PUSH %esi
	CALL LTree$GetKey
	ADD %esp, 4
	CMP DWORD PTR [%ebp+12], %eax
	JGE L$$43
L$$42:
	PUSH %esi
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$36
L$$37:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
	PUSH 1
	PUSH %esi
	CALL LTree$SetHas_Left
	ADD %esp, 8
	PUSH %ebx
	PUSH %esi
	CALL LTree$SetLeft
	ADD %esp, 8
L$$38:
L$$44:
	JMP L$$45
L$$36:
	PUSH %esi
	CALL LTree$GetLeft
	ADD %esp, 4
	MOV %esi, %eax
	JMP L$$38
L$$43:
	PUSH %esi
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$39
L$$40:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
	PUSH 1
	PUSH %esi
	CALL LTree$SetHas_Right
	ADD %esp, 8
	PUSH %ebx
	PUSH %esi
	CALL LTree$SetRight
	ADD %esp, 8
L$$41:
	JMP L$$44
L$$39:
	PUSH %esi
	CALL LTree$GetRight
	ADD %esp, 4
	MOV %esi, %eax
	JMP L$$41
L$$148:
	MOV %ebx, DWORD PTR [%ebp-16]
	MOV %esi, DWORD PTR [%ebp-12]
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$Delete:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 20
	MOV DWORD PTR [%ebp-4], %ebx
L$$151:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-12], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-20], %eax
	MOV %eax, 1
	MOV DWORD PTR [%ebp-8], %eax
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-16], %eax
	MOV %ebx, 1
L$$69:
	MOV %eax, DWORD PTR [%ebp-8]
	CMP %eax, 0
	JNE L$$70
L$$71:
L$$48:
	MOV %eax, DWORD PTR [%ebp-16]
	JMP L$$150
L$$70:
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	CALL LTree$GetKey
	ADD %esp, 4
	CMP DWORD PTR [%ebp+12], %eax
	JGE L$$67
L$$66:
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$50
L$$51:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
L$$52:
L$$68:
	XOR %ebx, %ebx
	JMP L$$69
L$$50:
	MOV %eax, DWORD PTR [%ebp-12]
	MOV DWORD PTR [%ebp-20], %eax
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	CALL LTree$GetLeft
	ADD %esp, 4
	MOV DWORD PTR [%ebp-12], %eax
	JMP L$$52
L$$67:
	CMP %eax, DWORD PTR [%ebp+12]
	JGE L$$64
L$$63:
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$53
L$$54:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
L$$55:
L$$65:
	JMP L$$68
L$$53:
	MOV %eax, DWORD PTR [%ebp-12]
	MOV DWORD PTR [%ebp-20], %eax
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	CALL LTree$GetRight
	ADD %esp, 4
	MOV DWORD PTR [%ebp-12], %eax
	JMP L$$55
L$$64:
	CMP %ebx, 0
	JNE L$$60
L$$61:
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-20]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LTree$Remove
	ADD %esp, 12
L$$62:
	MOV %eax, 1
	MOV DWORD PTR [%ebp-16], %eax
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
	JMP L$$65
L$$60:
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$57
L$$59:
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$57
L$$56:
	MOV %eax, 1
L$$58:
	JMP L$$62
L$$57:
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-20]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LTree$Remove
	ADD %esp, 12
	JMP L$$58
L$$150:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$Remove:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$153:
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$80
L$$81:
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$77
L$$78:
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetKey
	ADD %esp, 4
	MOV DWORD PTR [%ebp-4], %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetLeft
	ADD %esp, 4
	PUSH %eax
	CALL LTree$GetKey
	ADD %esp, 4
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LTree$Compare
	ADD %esp, 12
	CMP %eax, 0
	JNE L$$74
L$$75:
	PUSH 0
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$SetHas_Right
	ADD %esp, 8
L$$76:
L$$79:
L$$82:
L$$72:
	MOV %eax, 1
	JMP L$$152
L$$74:
	PUSH 0
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$SetHas_Left
	ADD %esp, 8
	JMP L$$76
L$$77:
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LTree$RemoveRight
	ADD %esp, 12
	JMP L$$79
L$$80:
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LTree$RemoveLeft
	ADD %esp, 12
	JMP L$$82
L$$152:
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$RemoveRight:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$85:
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$86
L$$87:
	PUSH 0
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$SetHas_Right
	ADD %esp, 8
L$$83:
	MOV %eax, 1
	JMP L$$154
L$$86:
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp-4], %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetRight
	ADD %esp, 4
	PUSH %eax
	CALL LTree$GetKey
	ADD %esp, 4
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL LTree$SetKey
	ADD %esp, 8
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp+12], %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetRight
	ADD %esp, 4
	MOV DWORD PTR [%ebp+16], %eax
	JMP L$$85
L$$154:
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$RemoveLeft:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %ebx
L$$90:
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$91
L$$92:
	PUSH 0
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$SetHas_Left
	ADD %esp, 8
L$$88:
	MOV %eax, 1
	JMP L$$155
L$$91:
	MOV %ebx, DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetLeft
	ADD %esp, 4
	PUSH %eax
	CALL LTree$GetKey
	ADD %esp, 4
	PUSH %eax
	PUSH %ebx
	CALL LTree$SetKey
	ADD %esp, 8
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp+12], %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetLeft
	ADD %esp, 4
	MOV DWORD PTR [%ebp+16], %eax
	JMP L$$90
L$$155:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$Search:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-8], %ebx
	MOV DWORD PTR [%ebp-4], %edi
L$$157:
	MOV %edi, DWORD PTR [%ebp+8]
	MOV %ebx, 1
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-12], %eax
L$$107:
	CMP %ebx, 0
	JNE L$$108
L$$109:
L$$93:
	MOV %eax, DWORD PTR [%ebp-12]
	JMP L$$156
L$$108:
	PUSH %edi
	CALL LTree$GetKey
	ADD %esp, 4
	CMP DWORD PTR [%ebp+12], %eax
	JGE L$$105
L$$104:
	PUSH %edi
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$95
L$$96:
	XOR %ebx, %ebx
L$$97:
L$$106:
	JMP L$$107
L$$95:
	PUSH %edi
	CALL LTree$GetLeft
	ADD %esp, 4
	MOV %edi, %eax
	JMP L$$97
L$$105:
	CMP %eax, DWORD PTR [%ebp+12]
	JGE L$$102
L$$101:
	PUSH %edi
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$98
L$$99:
	XOR %ebx, %ebx
L$$100:
L$$103:
	JMP L$$106
L$$98:
	PUSH %edi
	CALL LTree$GetRight
	ADD %esp, 4
	MOV %edi, %eax
	JMP L$$100
L$$102:
	MOV %eax, 1
	MOV DWORD PTR [%ebp-12], %eax
	XOR %ebx, %ebx
	JMP L$$103
L$$156:
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$Print:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$159:
	MOV %eax, DWORD PTR [%ebp+8]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LTree$RecPrint
	ADD %esp, 8
L$$110:
	MOV %eax, 1
L$$158:
	MOV %esp, %ebp
	POP %ebp
	RET
LTree$RecPrint:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
L$$161:
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$114
L$$115:
	MOV %eax, 1
L$$116:
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetKey
	ADD %esp, 4
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$117
L$$118:
	MOV %eax, 1
L$$119:
L$$112:
	MOV %eax, 1
	JMP L$$160
L$$117:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-8], %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetRight
	ADD %esp, 4
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL LTree$RecPrint
	ADD %esp, 8
	JMP L$$119
L$$114:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-4], %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetLeft
	ADD %esp, 4
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL LTree$RecPrint
	ADD %esp, 8
	JMP L$$116
L$$160:
	MOV %esp, %ebp
	POP %ebp
	RET
