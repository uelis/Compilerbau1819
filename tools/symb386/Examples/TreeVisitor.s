	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
L$$2:
L$$1:
	PUSH 8
	CALL L_halloc
	ADD %esp, 4
L$$0:
	MOV DWORD PTR [%eax], 0
	PUSH %eax
	CALL LTV$Start
	ADD %esp, 4
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	XOR %eax, %eax
L$$3:
L$$158:
	LEAVE
	RET
LTV$Start:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
L$$5:
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, %esi
	MOV DWORD PTR [%ebp-4], %eax
	XOR %eax, %eax
	XOR %esi, %esi
	XOR %ebx, %ebx
	XOR %eax, %eax
	PUSH 32
	CALL L_halloc
	ADD %esp, 4
L$$4:
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
	PUSH 100000000
	CALL L_println_int
	ADD %esp, 4
	PUSH 16
	CALL L_halloc
	ADD %esp, 4
	MOV %esi, %eax
	PUSH 4
	CALL L_halloc
	ADD %esp, 4
	LEA %ecx, LMyVisitor$visit
	MOV DWORD PTR [%eax], %ecx
	MOV DWORD PTR [%esi], %eax
	PUSH 50000000
	CALL L_println_int
	ADD %esp, 4
	PUSH %esi
	PUSH %ebx
	CALL LTree$accept
	ADD %esp, 8
	PUSH 100000000
	CALL L_println_int
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
	XOR %eax, %eax
L$$6:
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %ecx, DWORD PTR [%ebp-4]
	MOV %esi, %ecx
L$$159:
	LEAVE
	RET
LTree$Init:
	PUSH %ebp
	MOV %ebp, %esp
L$$8:
	MOV %edx, %ebx
	MOV %ecx, %edi
L$$7:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%eax+20], %ebx
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+16], 0
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+12], 0
	MOV %eax, 1
L$$9:
	MOV %ebx, %edx
	MOV %edi, %ecx
L$$160:
	LEAVE
	RET
LTree$SetRight:
	PUSH %ebp
	MOV %ebp, %esp
L$$11:
	MOV %ecx, %esi
L$$10:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %edx, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%eax+24], %edx
	MOV %eax, 1
L$$12:
	MOV %esi, %ecx
L$$161:
	LEAVE
	RET
LTree$SetLeft:
	PUSH %ebp
	MOV %ebp, %esp
L$$14:
	MOV %edx, %ebx
	MOV %ecx, %esi
L$$13:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebx+28], %eax
	MOV %eax, 1
L$$15:
	MOV %ebx, %edx
	MOV %esi, %ecx
L$$162:
	LEAVE
	RET
LTree$GetRight:
	PUSH %ebp
	MOV %ebp, %esp
L$$18:
	MOV %ecx, %esi
	MOV %edx, %edi
L$$17:
L$$16:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+24]
L$$19:
	MOV %esi, %ecx
	MOV %edi, %edx
L$$163:
	LEAVE
	RET
LTree$GetLeft:
	PUSH %ebp
	MOV %ebp, %esp
L$$22:
	MOV %ecx, %esi
	MOV %edx, %edi
L$$21:
L$$20:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+28]
L$$23:
	MOV %esi, %ecx
	MOV %edi, %edx
L$$164:
	LEAVE
	RET
LTree$GetKey:
	PUSH %ebp
	MOV %ebp, %esp
L$$26:
	MOV %edx, %esi
	MOV %ecx, %edi
L$$25:
L$$24:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+20]
L$$27:
	MOV %esi, %edx
	MOV %edi, %ecx
L$$165:
	LEAVE
	RET
LTree$SetKey:
	PUSH %ebp
	MOV %ebp, %esp
L$$29:
	MOV %ecx, %esi
	MOV %edx, %edi
L$$28:
	MOV %esi, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%esi+20], %eax
	MOV %eax, 1
L$$30:
	MOV %esi, %ecx
	MOV %edi, %edx
L$$166:
	LEAVE
	RET
LTree$GetHas_Right:
	PUSH %ebp
	MOV %ebp, %esp
L$$33:
	MOV %edx, %esi
	MOV %ecx, %edi
L$$32:
L$$31:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+12]
L$$34:
	MOV %esi, %edx
	MOV %edi, %ecx
L$$167:
	LEAVE
	RET
LTree$GetHas_Left:
	PUSH %ebp
	MOV %ebp, %esp
L$$37:
	MOV %ecx, %esi
	MOV %edx, %edi
L$$36:
L$$35:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+16]
L$$38:
	MOV %esi, %ecx
	MOV %edi, %edx
L$$168:
	LEAVE
	RET
LTree$SetHas_Left:
	PUSH %ebp
	MOV %ebp, %esp
L$$40:
	MOV %edx, %esi
	MOV %ecx, %edi
L$$39:
	MOV %esi, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%esi+16], %eax
	MOV %eax, 1
L$$41:
	MOV %esi, %edx
	MOV %edi, %ecx
L$$169:
	LEAVE
	RET
LTree$SetHas_Right:
	PUSH %ebp
	MOV %ebp, %esp
L$$43:
	MOV %ecx, %edi
L$$42:
	MOV %edx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%edx+12], %eax
	MOV %eax, 1
L$$44:
	MOV %edi, %ecx
L$$170:
	LEAVE
	RET
LTree$Compare:
	PUSH %ebp
	MOV %ebp, %esp
L$$51:
	MOV %ecx, %esi
	MOV %edx, %edi
	XOR %eax, %eax
	XOR %eax, %eax
	XOR %eax, %eax
	MOV %eax, DWORD PTR [%ebp+16]
	ADD %eax, 1
	MOV %esi, DWORD PTR [%ebp+12]
	CMP %esi, DWORD PTR [%ebp+16]
	JL L$$48
L$$49:
	CMP DWORD PTR [%ebp+12], %eax
	JL L$$46
L$$45:
	XOR %eax, %eax
L$$47:
L$$50:
L$$52:
	MOV %esi, %ecx
	MOV %edi, %edx
	JMP L$$171
L$$46:
	MOV %eax, 1
	JMP L$$47
L$$48:
	XOR %eax, %eax
	JMP L$$50
L$$171:
	LEAVE
	RET
LTree$Insert:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
L$$66:
	MOV %eax, %esi
	MOV DWORD PTR [%ebp-12], %eax
	XOR %esi, %esi
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-4], %eax
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
	XOR %eax, %eax
	XOR %eax, %eax
	PUSH 32
	CALL L_halloc
	ADD %esp, 4
L$$53:
	MOV DWORD PTR [%eax], 0
	MOV DWORD PTR [%ebp-4], %eax
	PUSH DWORD PTR [%ebp+12]
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL LTree$Init
	ADD %esp, 8
	MOV %esi, DWORD PTR [%ebp+8]
	MOV %eax, 1
	MOV DWORD PTR [%ebp-8], %eax
L$$63:
	MOV %eax, DWORD PTR [%ebp-8]
	CMP %eax, 0
	JE L$$65
L$$64:
	PUSH %esi
	CALL LTree$GetKey
	ADD %esp, 4
	CMP DWORD PTR [%ebp+12], %eax
	JL L$$60
L$$61:
	PUSH %esi
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JE L$$58
L$$57:
	PUSH %esi
	CALL LTree$GetRight
	ADD %esp, 4
	MOV %esi, %eax
L$$59:
L$$62:
	JMP L$$63
L$$58:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
	PUSH 1
	PUSH %esi
	CALL LTree$SetHas_Right
	ADD %esp, 8
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	PUSH %esi
	CALL LTree$SetRight
	ADD %esp, 8
	JMP L$$59
L$$56:
	JMP L$$62
L$$67:
	MOV %ecx, DWORD PTR [%ebp-12]
	MOV %esi, %ecx
	JMP L$$172
L$$55:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
	PUSH 1
	PUSH %esi
	CALL LTree$SetHas_Left
	ADD %esp, 8
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	PUSH %esi
	CALL LTree$SetLeft
	ADD %esp, 8
	JMP L$$56
L$$54:
	PUSH %esi
	CALL LTree$GetLeft
	ADD %esp, 4
	MOV %esi, %eax
	JMP L$$56
L$$65:
	MOV %eax, 1
	JMP L$$67
L$$60:
	PUSH %esi
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JE L$$55
L$$173:
	JMP L$$54
L$$172:
	LEAVE
	RET
LTree$Delete:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 32
L$$90:
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, %edi
	MOV DWORD PTR [%ebp-16], %eax
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
	XOR %edi, %edi
	XOR %ebx, %ebx
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-20], %eax
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-12], %eax
	XOR %eax, %eax
	XOR %eax, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-8], %eax
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, 1
	MOV DWORD PTR [%ebp-20], %eax
	XOR %edi, %edi
	MOV %eax, 1
	MOV DWORD PTR [%ebp-12], %eax
L$$87:
	MOV %eax, DWORD PTR [%ebp-20]
	CMP %eax, 0
	JE L$$89
L$$88:
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL LTree$GetKey
	ADD %esp, 4
	CMP DWORD PTR [%ebp+12], %eax
	JL L$$84
L$$85:
	CMP %eax, DWORD PTR [%ebp+12]
	JL L$$81
L$$82:
	MOV %eax, DWORD PTR [%ebp-12]
	CMP %eax, 0
	JE L$$79
L$$78:
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JE L$$77
L$$75:
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	PUSH %ebx
	PUSH DWORD PTR [%ebp+8]
	CALL LTree$Remove
	ADD %esp, 12
L$$76:
L$$80:
	MOV %edi, 1
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-20], %eax
L$$83:
L$$86:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-12], %eax
	JMP L$$87
L$$79:
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	PUSH %ebx
	PUSH DWORD PTR [%ebp+8]
	CALL LTree$Remove
	ADD %esp, 12
	JMP L$$80
L$$77:
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JNE L$$75
L$$74:
	MOV %eax, 1
	JMP L$$76
L$$73:
	JMP L$$83
L$$72:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-20], %eax
	JMP L$$73
L$$71:
	MOV %eax, DWORD PTR [%ebp-8]
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL LTree$GetRight
	ADD %esp, 4
	MOV DWORD PTR [%ebp-8], %eax
	JMP L$$73
L$$70:
	JMP L$$86
L$$91:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %ecx, DWORD PTR [%ebp-16]
	MOV %edi, %ecx
	JMP L$$174
L$$69:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-20], %eax
	JMP L$$70
L$$68:
	MOV %eax, DWORD PTR [%ebp-8]
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL LTree$GetLeft
	ADD %esp, 4
	MOV DWORD PTR [%ebp-8], %eax
	JMP L$$70
L$$89:
	MOV %eax, %edi
	JMP L$$91
L$$84:
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JE L$$69
L$$175:
	JMP L$$68
L$$81:
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JE L$$72
L$$176:
	JMP L$$71
L$$174:
	LEAVE
	RET
LTree$Remove:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
L$$101:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-4], %eax
	XOR %eax, %eax
	XOR %eax, %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JE L$$99
L$$98:
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LTree$RemoveLeft
	ADD %esp, 12
L$$100:
	MOV %eax, 1
L$$102:
	JMP L$$177
L$$99:
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JE L$$96
L$$95:
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LTree$RemoveRight
	ADD %esp, 12
L$$97:
	JMP L$$100
L$$96:
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
	JE L$$93
L$$92:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	PUSH DWORD PTR [%eax]
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$SetLeft
	ADD %esp, 8
	PUSH 0
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$SetHas_Left
	ADD %esp, 8
L$$94:
	JMP L$$97
L$$93:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	PUSH DWORD PTR [%eax]
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$SetRight
	ADD %esp, 8
	PUSH 0
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$SetHas_Right
	ADD %esp, 8
	JMP L$$94
L$$177:
	LEAVE
	RET
LTree$RemoveRight:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
L$$106:
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-4], %eax
	XOR %eax, %eax
L$$103:
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JE L$$105
L$$104:
	MOV %ebx, DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetRight
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
	LEA %eax, DWORD PTR [%ebp+16]
	MOV %ebx, %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetRight
	ADD %esp, 4
	MOV DWORD PTR [%ebx], %eax
	JMP L$$103
L$$107:
	MOV %ebx, DWORD PTR [%ebp-4]
	JMP L$$178
L$$105:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	PUSH DWORD PTR [%eax]
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$SetRight
	ADD %esp, 8
	PUSH 0
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$SetHas_Right
	ADD %esp, 8
	MOV %eax, 1
	JMP L$$107
L$$178:
	LEAVE
	RET
LTree$RemoveLeft:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
L$$111:
	XOR %eax, %eax
L$$108:
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JE L$$110
L$$109:
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp-4], %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetLeft
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
	LEA %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp-8], %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LTree$GetLeft
	ADD %esp, 4
	MOV %ecx, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%ecx], %eax
	JMP L$$108
L$$110:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	PUSH DWORD PTR [%eax]
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$SetLeft
	ADD %esp, 8
	PUSH 0
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$SetHas_Left
	ADD %esp, 8
	MOV %eax, 1
L$$112:
L$$179:
	LEAVE
	RET
LTree$Search:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
L$$128:
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-12], %eax
	MOV %eax, %edi
	MOV DWORD PTR [%ebp-8], %eax
	XOR %edi, %edi
	XOR %ebx, %ebx
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-4], %eax
	XOR %eax, %eax
	MOV %edi, DWORD PTR [%ebp+8]
	MOV %eax, 1
	MOV DWORD PTR [%ebp-4], %eax
	XOR %ebx, %ebx
L$$125:
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, 0
	JE L$$127
L$$126:
	PUSH %edi
	CALL LTree$GetKey
	ADD %esp, 4
	CMP DWORD PTR [%ebp+12], %eax
	JL L$$122
L$$123:
	CMP %eax, DWORD PTR [%ebp+12]
	JL L$$119
L$$120:
	MOV %ebx, 1
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-4], %eax
L$$121:
L$$124:
	JMP L$$125
L$$118:
	JMP L$$121
L$$129:
	MOV %ebx, DWORD PTR [%ebp-12]
	MOV %ecx, DWORD PTR [%ebp-8]
	MOV %edi, %ecx
	JMP L$$180
L$$119:
	PUSH %edi
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JE L$$117
L$$116:
	PUSH %edi
	CALL LTree$GetRight
	ADD %esp, 4
	MOV %edi, %eax
	JMP L$$118
L$$114:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-4], %eax
L$$115:
	JMP L$$124
L$$127:
	MOV %eax, %ebx
	JMP L$$129
L$$117:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-4], %eax
	JMP L$$118
L$$122:
	PUSH %edi
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JE L$$114
L$$113:
	PUSH %edi
	CALL LTree$GetLeft
	ADD %esp, 4
	MOV %edi, %eax
	JMP L$$115
L$$180:
	LEAVE
	RET
LTree$Print:
	PUSH %ebp
	MOV %ebp, %esp
L$$130:
	XOR %eax, %eax
	XOR %eax, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LTree$RecPrint
	ADD %esp, 8
	MOV %eax, 1
L$$131:
L$$181:
	LEAVE
	RET
LTree$RecPrint:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
L$$138:
	XOR %eax, %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JE L$$133
L$$132:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-8], %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetLeft
	ADD %esp, 4
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL LTree$RecPrint
	ADD %esp, 8
L$$134:
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
	JE L$$136
L$$135:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-4], %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetRight
	ADD %esp, 4
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL LTree$RecPrint
	ADD %esp, 8
L$$137:
	MOV %eax, 1
L$$139:
	JMP L$$182
L$$136:
	MOV %eax, 1
	JMP L$$137
L$$133:
	MOV %eax, 1
	JMP L$$134
L$$182:
	LEAVE
	RET
LTree$accept:
	PUSH %ebp
	MOV %ebp, %esp
L$$140:
	XOR %eax, %eax
	PUSH 333
	CALL L_println_int
	ADD %esp, 4
	PUSH DWORD PTR [%ebp+8]
	PUSH DWORD PTR [%ebp+12]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV %eax, DWORD PTR [%eax]
	ADD %eax, 0
	MOV %eax, DWORD PTR [%eax]
	CALL %eax
	ADD %esp, 8
	XOR %eax, %eax
L$$141:
L$$183:
	LEAVE
	RET
LVisitor$visit:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
L$$148:
	XOR %eax, %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JE L$$143
L$$142:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	MOV DWORD PTR [%ebp-4], %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetRight
	ADD %esp, 4
	MOV %ecx, DWORD PTR [%ebp-4]
	MOV DWORD PTR [%ecx], %eax
	PUSH DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	PUSH DWORD PTR [%eax]
	CALL LTree$accept
	ADD %esp, 8
L$$144:
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JE L$$146
L$$145:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 12
	MOV DWORD PTR [%ebp-8], %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetLeft
	ADD %esp, 4
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%eax], %ecx
	PUSH DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 12
	PUSH DWORD PTR [%eax]
	CALL LTree$accept
	ADD %esp, 8
L$$147:
	XOR %eax, %eax
L$$149:
	JMP L$$184
L$$143:
	XOR %eax, %eax
	JMP L$$144
L$$146:
	XOR %eax, %eax
	JMP L$$147
L$$184:
	LEAVE
	RET
LMyVisitor$visit:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
L$$156:
	XOR %eax, %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetHas_Right
	ADD %esp, 4
	CMP %eax, 0
	JE L$$151
L$$150:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	MOV DWORD PTR [%ebp-4], %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetRight
	ADD %esp, 4
	MOV %ecx, DWORD PTR [%ebp-4]
	MOV DWORD PTR [%ecx], %eax
	PUSH DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	PUSH DWORD PTR [%eax]
	CALL LTree$accept
	ADD %esp, 8
L$$152:
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetKey
	ADD %esp, 4
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetHas_Left
	ADD %esp, 4
	CMP %eax, 0
	JE L$$154
L$$153:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 12
	MOV DWORD PTR [%ebp-8], %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LTree$GetLeft
	ADD %esp, 4
	MOV %ecx, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%ecx], %eax
	PUSH DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 12
	PUSH DWORD PTR [%eax]
	CALL LTree$accept
	ADD %esp, 8
L$$155:
	XOR %eax, %eax
L$$157:
	JMP L$$185
L$$154:
	XOR %eax, %eax
	JMP L$$155
L$$151:
	XOR %eax, %eax
	JMP L$$152
L$$185:
	LEAVE
	RET
