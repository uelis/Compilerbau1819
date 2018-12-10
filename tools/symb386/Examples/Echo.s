	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$8:
	PUSH 4
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH %eax
	CALL LEcho$run
	ADD %esp, 4
	PUSH %eax
	CALL L_write
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$7:
	MOV %esp, %ebp
	POP %ebp
	RET
LEcho$run:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$10:
	CALL L_read
	ADD %esp, 0
L$$4:
	MOV %ecx, -1
	CMP %ecx, %eax
	JGE L$$6
L$$5:
	PUSH %eax
	CALL L_write
	ADD %esp, 4
	CALL L_read
	ADD %esp, 0
	JMP L$$4
L$$6:
L$$2:
	MOV %eax, 10
L$$9:
	MOV %esp, %ebp
	POP %ebp
	RET
