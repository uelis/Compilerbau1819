        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t59, %ebx
        mov     t60, %esi
        mov     t61, %edi
L$27:
        push    4
        call    L_halloc
        add     %esp, 4
        mov     t49, %eax
        push    t49
        call    LTest$test
        add     %esp, 4
        mov     t50, %eax
        push    t50
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$28:
        mov     %eax, t1
        mov     %edi, t61
        mov     %esi, t60
        mov     %ebx, t59
        leave
        ret

        .global LLabel$init
        .type LLabel$init, @function
LLabel$init:
        push    %ebp
        mov     %ebp, %esp
        mov     t64, %ebx
        mov     t65, %esi
        mov     t66, %edi
L$29:
        mov     t62, DWORD PTR [%ebp+8]
        mov     t63, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t62+4], t63
        mov     t2, 0
L$30:
        mov     %eax, t2
        mov     %edi, t66
        mov     %esi, t65
        mov     %ebx, t64
        leave
        ret

        .global LLabel$label
        .type LLabel$label, @function
LLabel$label:
        push    %ebp
        mov     %ebp, %esp
        mov     t68, %ebx
        mov     t69, %esi
        mov     t70, %edi
L$31:
        mov     t67, DWORD PTR [%ebp+8]
        mov     t3, DWORD PTR [t67+4]
L$32:
        mov     %eax, t3
        mov     %edi, t70
        mov     %esi, t69
        mov     %ebx, t68
        leave
        ret

        .global LLabel$eq
        .type LLabel$eq, @function
LLabel$eq:
        push    %ebp
        mov     %ebp, %esp
        mov     t75, %ebx
        mov     t76, %esi
        mov     t77, %edi
L$33:
        push    DWORD PTR [%ebp+12]
        call    LLabel$label
        add     %esp, 4
        mov     t4, %eax
        mov     t5, 1
        mov     t74, t4
        inc     t74
        mov     t73, DWORD PTR [%ebp+8]
        cmp     DWORD PTR [t73+4], t74
        jl      L$0
L$1:
        mov     t5, 0
L$0:
        mov     t7, t5
        cmp     t7, 0
        je      L$4
L$5:
        mov     t6, 1
        mov     t72, DWORD PTR [%ebp+8]
        mov     t71, DWORD PTR [t72+4]
        inc     t71
        cmp     t4, t71
        jl      L$2
L$3:
        mov     t6, 0
L$2:
        mov     t7, t6
L$4:
        mov     t8, t7
L$34:
        mov     %eax, t8
        mov     %edi, t77
        mov     %esi, t76
        mov     %ebx, t75
        leave
        ret

        .global LLabel$print
        .type LLabel$print, @function
LLabel$print:
        push    %ebp
        mov     %ebp, %esp
        mov     t79, %ebx
        mov     t80, %esi
        mov     t81, %edi
L$35:
        mov     t78, DWORD PTR [%ebp+8]
        push    DWORD PTR [t78+4]
        call    L_println_int
        add     %esp, 4
        mov     t9, %eax
        mov     t10, 0
L$36:
        mov     %eax, t10
        mov     %edi, t81
        mov     %esi, t80
        mov     %ebx, t79
        leave
        ret

        .global LNode$init
        .type LNode$init, @function
LNode$init:
        push    %ebp
        mov     %ebp, %esp
        mov     t89, %ebx
        mov     t90, %esi
        mov     t91, %edi
L$37:
        mov     t88, DWORD PTR [%ebp+8]
        mov     DWORD PTR [t88+16], 0
        mov     t86, DWORD PTR [%ebp+8]
        mov     t87, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t86+4], t87
        mov     t84, DWORD PTR [%ebp+8]
        mov     t85, DWORD PTR [%ebp+8]
        mov     DWORD PTR [t84+8], t85
        mov     t82, DWORD PTR [%ebp+8]
        mov     t83, DWORD PTR [%ebp+8]
        mov     DWORD PTR [t82+12], t83
        mov     t11, 0
L$38:
        mov     %eax, t11
        mov     %edi, t91
        mov     %esi, t90
        mov     %ebx, t89
        leave
        ret

        .global LNode$label
        .type LNode$label, @function
LNode$label:
        push    %ebp
        mov     %ebp, %esp
        mov     t93, %ebx
        mov     t94, %esi
        mov     t95, %edi
L$39:
        mov     t92, DWORD PTR [%ebp+8]
        mov     t12, DWORD PTR [t92+4]
L$40:
        mov     %eax, t12
        mov     %edi, t95
        mov     %esi, t94
        mov     %ebx, t93
        leave
        ret

        .global LNode$setLeft
        .type LNode$setLeft, @function
LNode$setLeft:
        push    %ebp
        mov     %ebp, %esp
        mov     t98, %ebx
        mov     t99, %esi
        mov     t100, %edi
L$41:
        mov     t96, DWORD PTR [%ebp+8]
        mov     t97, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t96+8], t97
        mov     t13, 0
L$42:
        mov     %eax, t13
        mov     %edi, t100
        mov     %esi, t99
        mov     %ebx, t98
        leave
        ret

        .global LNode$setRight
        .type LNode$setRight, @function
LNode$setRight:
        push    %ebp
        mov     %ebp, %esp
        mov     t103, %ebx
        mov     t104, %esi
        mov     t105, %edi
L$43:
        mov     t101, DWORD PTR [%ebp+8]
        mov     t102, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t101+12], t102
        mov     t14, 0
L$44:
        mov     %eax, t14
        mov     %edi, t105
        mov     %esi, t104
        mov     %ebx, t103
        leave
        ret

        .global LNode$print
        .type LNode$print, @function
LNode$print:
        push    %ebp
        mov     %ebp, %esp
        mov     t107, %ebx
        mov     t108, %esi
        mov     t109, %edi
L$45:
        mov     t106, DWORD PTR [%ebp+8]
        push    DWORD PTR [t106+4]
        call    LLabel$print
        add     %esp, 4
        mov     t15, %eax
        mov     t16, 0
L$46:
        mov     %eax, t16
        mov     %edi, t109
        mov     %esi, t108
        mov     %ebx, t107
        leave
        ret

        .global LNode$beq
        .type LNode$beq, @function
LNode$beq:
        push    %ebp
        mov     %ebp, %esp
        mov     t110, %ebx
        mov     t111, %esi
        mov     t112, %edi
L$47:
        mov     t17, DWORD PTR [%ebp+12]
        cmp     t17, 0
        je      L$6
L$7:
        mov     t17, DWORD PTR [%ebp+16]
L$6:
        mov     t19, t17
        xor     t19, 1
        cmp     t19, 0
        je      L$10
L$11:
        mov     t18, DWORD PTR [%ebp+12]
        xor     t18, 1
        cmp     t18, 0
        je      L$8
L$9:
        mov     t18, DWORD PTR [%ebp+16]
        xor     t18, 1
L$8:
        mov     t19, t18
        xor     t19, 1
L$10:
        mov     t20, t19
        xor     t20, 1
L$48:
        mov     %eax, t20
        mov     %edi, t112
        mov     %esi, t111
        mov     %ebx, t110
        leave
        ret

        .global LNode$dfs
        .type LNode$dfs, @function
LNode$dfs:
        push    %ebp
        mov     %ebp, %esp
        mov     t119, %ebx
        mov     t120, %esi
        mov     t121, %edi
L$49:
        mov     t118, DWORD PTR [%ebp+8]
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [t118+16]
        push    DWORD PTR [%ebp+8]
        call    LNode$beq
        add     %esp, 12
        mov     t51, %eax
        cmp     t51, 0
        je      L$22
L$21:
        mov     t21, 0
L$23:
        mov     t22, t21
        jmp     L$50
L$12:
        mov     t21, 1
L$14:
L$17:
L$20:
        jmp     L$23
L$13:
        mov     t21, 0
        jmp     L$14
L$15:
        mov     t21, 1
        jmp     L$17
L$16:
        mov     t117, DWORD PTR [%ebp+8]
        push    DWORD PTR [%ebp+16]
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [t117+12]
        call    LNode$dfs
        add     %esp, 12
        mov     t54, %eax
        cmp     t54, 0
        je      L$13
        jmp     L$12
L$18:
        mov     t21, 1
        jmp     L$20
L$19:
        mov     t115, DWORD PTR [%ebp+8]
        mov     t116, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t115+16], t116
        mov     t114, DWORD PTR [%ebp+8]
        push    DWORD PTR [%ebp+16]
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [t114+8]
        call    LNode$dfs
        add     %esp, 12
        mov     t53, %eax
        cmp     t53, 0
        je      L$16
        jmp     L$15
L$22:
        mov     t113, DWORD PTR [%ebp+8]
        push    DWORD PTR [%ebp+16]
        push    DWORD PTR [t113+4]
        call    LLabel$eq
        add     %esp, 8
        mov     t52, %eax
        cmp     t52, 0
        je      L$19
        jmp     L$18
L$50:
        mov     %eax, t22
        mov     %edi, t121
        mov     %esi, t120
        mov     %ebx, t119
        leave
        ret

        .global LTest$newLabel
        .type LTest$newLabel, @function
LTest$newLabel:
        push    %ebp
        mov     %ebp, %esp
        mov     t122, %ebx
        mov     t123, %esi
        mov     t124, %edi
L$51:
        push    8
        call    L_halloc
        add     %esp, 4
        mov     t24, %eax
        push    DWORD PTR [%ebp+12]
        push    t24
        call    LLabel$init
        add     %esp, 8
        mov     t23, %eax
        mov     t25, t24
L$52:
        mov     %eax, t25
        mov     %edi, t124
        mov     %esi, t123
        mov     %ebx, t122
        leave
        ret

        .global LTest$newNode
        .type LTest$newNode, @function
LTest$newNode:
        push    %ebp
        mov     %ebp, %esp
        mov     t125, %ebx
        mov     t126, %esi
        mov     t127, %edi
L$53:
        push    20
        call    L_halloc
        add     %esp, 4
        mov     t27, %eax
        push    DWORD PTR [%ebp+12]
        push    t27
        call    LNode$init
        add     %esp, 8
        mov     t26, %eax
        mov     t28, t27
L$54:
        mov     %eax, t28
        mov     %edi, t127
        mov     %esi, t126
        mov     %ebx, t125
        leave
        ret

        .global LTest$findPath
        .type LTest$findPath, @function
LTest$findPath:
        push    %ebp
        mov     %ebp, %esp
        mov     t128, %ebx
        mov     t129, %esi
        mov     t130, %edi
L$55:
        push    DWORD PTR [%ebp+12]
        call    LNode$print
        add     %esp, 4
        mov     t29, %eax
        push    DWORD PTR [%ebp+16]
        call    LNode$print
        add     %esp, 4
        mov     t29, %eax
        mov     t56, DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+16]
        call    LNode$label
        add     %esp, 4
        mov     t55, %eax
        push    t55
        push    1
        push    t56
        call    LNode$dfs
        add     %esp, 12
        mov     t30, %eax
        mov     t58, DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+16]
        call    LNode$label
        add     %esp, 4
        mov     t57, %eax
        push    t57
        push    0
        push    t58
        call    LNode$dfs
        add     %esp, 12
        mov     t31, %eax
        cmp     t30, 0
        je      L$25
L$24:
        push    999
        call    L_println_int
        add     %esp, 4
        mov     t32, %eax
L$26:
        mov     t34, 0
        jmp     L$56
L$25:
        push    -999
        call    L_println_int
        add     %esp, 4
        mov     t33, %eax
        jmp     L$26
L$56:
        mov     %eax, t34
        mov     %edi, t130
        mov     %esi, t129
        mov     %ebx, t128
        leave
        ret

        .global LTest$test
        .type LTest$test, @function
LTest$test:
        push    %ebp
        mov     %ebp, %esp
        mov     t131, %ebx
        mov     t132, %esi
        mov     t133, %edi
L$57:
        push    1
        push    DWORD PTR [%ebp+8]
        call    LTest$newLabel
        add     %esp, 8
        mov     t38, %eax
        push    t38
        push    DWORD PTR [%ebp+8]
        call    LTest$newNode
        add     %esp, 8
        mov     t39, %eax
        push    2
        push    DWORD PTR [%ebp+8]
        call    LTest$newLabel
        add     %esp, 8
        mov     t40, %eax
        push    t40
        push    DWORD PTR [%ebp+8]
        call    LTest$newNode
        add     %esp, 8
        mov     t41, %eax
        push    3
        push    DWORD PTR [%ebp+8]
        call    LTest$newLabel
        add     %esp, 8
        mov     t42, %eax
        push    t42
        push    DWORD PTR [%ebp+8]
        call    LTest$newNode
        add     %esp, 8
        mov     t43, %eax
        push    4
        push    DWORD PTR [%ebp+8]
        call    LTest$newLabel
        add     %esp, 8
        mov     t44, %eax
        push    t44
        push    DWORD PTR [%ebp+8]
        call    LTest$newNode
        add     %esp, 8
        mov     t45, %eax
        push    5
        push    DWORD PTR [%ebp+8]
        call    LTest$newLabel
        add     %esp, 8
        mov     t46, %eax
        push    t46
        push    DWORD PTR [%ebp+8]
        call    LTest$newNode
        add     %esp, 8
        mov     t47, %eax
        push    t41
        push    t39
        call    LNode$setLeft
        add     %esp, 8
        mov     t35, %eax
        push    t45
        push    t39
        call    LNode$setRight
        add     %esp, 8
        mov     t35, %eax
        push    t43
        push    t41
        call    LNode$setLeft
        add     %esp, 8
        mov     t35, %eax
        push    t39
        push    t43
        call    LNode$setLeft
        add     %esp, 8
        mov     t35, %eax
        push    t45
        push    t43
        call    LNode$setRight
        add     %esp, 8
        mov     t35, %eax
        push    t45
        push    t39
        push    DWORD PTR [%ebp+8]
        call    LTest$findPath
        add     %esp, 12
        mov     t35, %eax
        push    t39
        push    t45
        push    DWORD PTR [%ebp+8]
        call    LTest$findPath
        add     %esp, 12
        mov     t35, %eax
        push    t41
        push    t43
        push    DWORD PTR [%ebp+8]
        call    LTest$findPath
        add     %esp, 12
        mov     t35, %eax
        push    t39
        push    t45
        push    DWORD PTR [%ebp+8]
        call    LTest$findPath
        add     %esp, 12
        mov     t35, %eax
        push    t41
        push    t43
        push    DWORD PTR [%ebp+8]
        call    LTest$findPath
        add     %esp, 12
        mov     t35, %eax
        push    t43
        push    t45
        push    DWORD PTR [%ebp+8]
        call    LTest$findPath
        add     %esp, 12
        mov     t35, %eax
        push    t47
        push    t47
        push    DWORD PTR [%ebp+8]
        call    LTest$findPath
        add     %esp, 12
        mov     t35, %eax
        push    t45
        push    t47
        push    DWORD PTR [%ebp+8]
        call    LTest$findPath
        add     %esp, 12
        mov     t35, %eax
        mov     t48, 0
L$58:
        mov     %eax, t48
        mov     %edi, t133
        mov     %esi, t132
        mov     %ebx, t131
        leave
        ret
