        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t75, %ebx
        mov     t76, %esi
        mov     t77, %edi
L$43:
        push    4
        call    L_halloc
        add     %esp, 4
        mov     t62, %eax
        push    t62
        call    LLL$Start
        add     %esp, 4
        mov     t63, %eax
        push    t63
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$44:
        mov     %eax, t1
        mov     %edi, t77
        mov     %esi, t76
        mov     %ebx, t75
        leave
        ret

        .global LElement$Init
        .type LElement$Init, @function
LElement$Init:
        push    %ebp
        mov     %ebp, %esp
        mov     t84, %ebx
        mov     t85, %esi
        mov     t86, %edi
L$45:
        mov     t82, DWORD PTR [%ebp+8]
        mov     t83, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t82+4], t83
        mov     t80, DWORD PTR [%ebp+8]
        mov     t81, DWORD PTR [%ebp+16]
        mov     DWORD PTR [t80+12], t81
        mov     t78, DWORD PTR [%ebp+8]
        mov     t79, DWORD PTR [%ebp+20]
        mov     DWORD PTR [t78+8], t79
        mov     t2, 1
L$46:
        mov     %eax, t2
        mov     %edi, t86
        mov     %esi, t85
        mov     %ebx, t84
        leave
        ret

        .global LElement$GetAge
        .type LElement$GetAge, @function
LElement$GetAge:
        push    %ebp
        mov     %ebp, %esp
        mov     t88, %ebx
        mov     t89, %esi
        mov     t90, %edi
L$47:
        mov     t87, DWORD PTR [%ebp+8]
        mov     t3, DWORD PTR [t87+4]
L$48:
        mov     %eax, t3
        mov     %edi, t90
        mov     %esi, t89
        mov     %ebx, t88
        leave
        ret

        .global LElement$GetSalary
        .type LElement$GetSalary, @function
LElement$GetSalary:
        push    %ebp
        mov     %ebp, %esp
        mov     t92, %ebx
        mov     t93, %esi
        mov     t94, %edi
L$49:
        mov     t91, DWORD PTR [%ebp+8]
        mov     t4, DWORD PTR [t91+12]
L$50:
        mov     %eax, t4
        mov     %edi, t94
        mov     %esi, t93
        mov     %ebx, t92
        leave
        ret

        .global LElement$GetMarried
        .type LElement$GetMarried, @function
LElement$GetMarried:
        push    %ebp
        mov     %ebp, %esp
        mov     t96, %ebx
        mov     t97, %esi
        mov     t98, %edi
L$51:
        mov     t95, DWORD PTR [%ebp+8]
        mov     t5, DWORD PTR [t95+8]
L$52:
        mov     %eax, t5
        mov     %edi, t98
        mov     %esi, t97
        mov     %ebx, t96
        leave
        ret

        .global LElement$Equal
        .type LElement$Equal, @function
LElement$Equal:
        push    %ebp
        mov     %ebp, %esp
        mov     t102, %ebx
        mov     t103, %esi
        mov     t104, %edi
L$53:
        mov     t6, 1
        push    DWORD PTR [%ebp+12]
        call    LElement$GetAge
        add     %esp, 4
        mov     t7, %eax
        mov     t101, DWORD PTR [%ebp+8]
        push    DWORD PTR [t101+4]
        push    t7
        push    DWORD PTR [%ebp+8]
        call    LElement$Compare
        add     %esp, 12
        mov     t64, %eax
        cmp     t64, 0
        je      L$13
L$12:
        push    DWORD PTR [%ebp+12]
        call    LElement$GetSalary
        add     %esp, 4
        mov     t8, %eax
        mov     t100, DWORD PTR [%ebp+8]
        push    DWORD PTR [t100+12]
        push    t8
        push    DWORD PTR [%ebp+8]
        call    LElement$Compare
        add     %esp, 12
        mov     t65, %eax
        cmp     t65, 0
        je      L$10
L$9:
        mov     t99, DWORD PTR [%ebp+8]
        cmp     DWORD PTR [t99+8], 0
        je      L$7
L$6:
        push    DWORD PTR [%ebp+12]
        call    LElement$GetMarried
        add     %esp, 4
        mov     t67, %eax
        cmp     t67, 0
        je      L$1
L$0:
        mov     t9, 0
L$2:
L$8:
L$11:
L$14:
        mov     t10, t6
        jmp     L$54
L$1:
        mov     t6, 0
        jmp     L$2
L$10:
        mov     t6, 0
        jmp     L$11
L$13:
        mov     t6, 0
        jmp     L$14
L$3:
        mov     t6, 0
L$5:
        jmp     L$8
L$4:
        mov     t9, 0
        jmp     L$5
L$7:
        push    DWORD PTR [%ebp+12]
        call    LElement$GetMarried
        add     %esp, 4
        mov     t66, %eax
        cmp     t66, 0
        je      L$4
        jmp     L$3
L$54:
        mov     %eax, t10
        mov     %edi, t104
        mov     %esi, t103
        mov     %ebx, t102
        leave
        ret

        .global LElement$Compare
        .type LElement$Compare, @function
LElement$Compare:
        push    %ebp
        mov     %ebp, %esp
        mov     t106, %ebx
        mov     t107, %esi
        mov     t108, %edi
L$55:
        mov     t11, 0
        mov     t12, DWORD PTR [%ebp+16]
        inc     t12
        mov     t105, DWORD PTR [%ebp+12]
        cmp     t105, DWORD PTR [%ebp+16]
        jl      L$18
L$19:
        cmp     DWORD PTR [%ebp+12], t12
        jl      L$15
L$16:
        mov     t11, 0
L$17:
L$20:
        mov     t13, t11
        jmp     L$56
L$15:
        mov     t11, 1
        jmp     L$17
L$18:
        mov     t11, 0
        jmp     L$20
L$56:
        mov     %eax, t13
        mov     %edi, t108
        mov     %esi, t107
        mov     %ebx, t106
        leave
        ret

        .global LList$Init
        .type LList$Init, @function
LList$Init:
        push    %ebp
        mov     %ebp, %esp
        mov     t110, %ebx
        mov     t111, %esi
        mov     t112, %edi
L$57:
        mov     t109, DWORD PTR [%ebp+8]
        mov     DWORD PTR [t109+8], 1
        mov     t14, 1
L$58:
        mov     %eax, t14
        mov     %edi, t112
        mov     %esi, t111
        mov     %ebx, t110
        leave
        ret

        .global LList$InitNew
        .type LList$InitNew, @function
LList$InitNew:
        push    %ebp
        mov     %ebp, %esp
        mov     t119, %ebx
        mov     t120, %esi
        mov     t121, %edi
L$59:
        mov     t117, DWORD PTR [%ebp+8]
        mov     t118, DWORD PTR [%ebp+20]
        mov     DWORD PTR [t117+8], t118
        mov     t115, DWORD PTR [%ebp+8]
        mov     t116, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t115+4], t116
        mov     t113, DWORD PTR [%ebp+8]
        mov     t114, DWORD PTR [%ebp+16]
        mov     DWORD PTR [t113+12], t114
        mov     t15, 1
L$60:
        mov     %eax, t15
        mov     %edi, t121
        mov     %esi, t120
        mov     %ebx, t119
        leave
        ret

        .global LList$Insert
        .type LList$Insert, @function
LList$Insert:
        push    %ebp
        mov     %ebp, %esp
        mov     t122, %ebx
        mov     t123, %esi
        mov     t124, %edi
L$61:
        mov     t17, DWORD PTR [%ebp+8]
        push    16
        call    L_halloc
        add     %esp, 4
        mov     t18, %eax
        push    0
        push    t17
        push    DWORD PTR [%ebp+12]
        push    t18
        call    LList$InitNew
        add     %esp, 16
        mov     t16, %eax
        mov     t19, t18
L$62:
        mov     %eax, t19
        mov     %edi, t124
        mov     %esi, t123
        mov     %ebx, t122
        leave
        ret

        .global LList$SetNext
        .type LList$SetNext, @function
LList$SetNext:
        push    %ebp
        mov     %ebp, %esp
        mov     t127, %ebx
        mov     t128, %esi
        mov     t129, %edi
L$63:
        mov     t125, DWORD PTR [%ebp+8]
        mov     t126, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t125+12], t126
        mov     t20, 1
L$64:
        mov     %eax, t20
        mov     %edi, t129
        mov     %esi, t128
        mov     %ebx, t127
        leave
        ret

        .global LList$Delete
        .type LList$Delete, @function
LList$Delete:
        push    %ebp
        mov     %ebp, %esp
        mov     t131, %ebx
        mov     t132, %esi
        mov     t133, %edi
L$65:
        mov     t21, DWORD PTR [%ebp+8]
        mov     t22, 0
        mov     t28, -1
        mov     t24, DWORD PTR [%ebp+8]
        mov     t25, DWORD PTR [%ebp+8]
        mov     t130, DWORD PTR [%ebp+8]
        mov     t26, DWORD PTR [t130+8]
L$21:
        cmp     t26, 0
        je      L$33
L$23:
        mov     t32, t21
        jmp     L$66
L$22:
        push    t24
        call    LList$GetElem
        add     %esp, 4
        mov     t27, %eax
        push    t27
        push    DWORD PTR [%ebp+12]
        call    LElement$Equal
        add     %esp, 8
        mov     t68, %eax
        cmp     t68, 0
        je      L$28
L$27:
        mov     t22, 1
        cmp     t28, 0
        jl      L$24
L$25:
        push    -555
        call    L_println_int
        add     %esp, 4
        mov     t30, %eax
        mov     t70, t25
        push    t24
        call    LList$GetNext
        add     %esp, 4
        mov     t69, %eax
        push    t69
        push    t70
        call    LList$SetNext
        add     %esp, 8
        mov     t23, %eax
        push    -555
        call    L_println_int
        add     %esp, 4
        mov     t31, %eax
L$26:
L$29:
        cmp     t22, 0
        je      L$31
L$30:
        mov     t29, 0
L$32:
        jmp     L$21
L$24:
        push    t24
        call    LList$GetNext
        add     %esp, 4
        mov     t21, %eax
        jmp     L$26
L$28:
        mov     t29, 0
        jmp     L$29
L$31:
        mov     t25, t24
        push    t24
        call    LList$GetNext
        add     %esp, 4
        mov     t24, %eax
        push    t24
        call    LList$GetEnd
        add     %esp, 4
        mov     t26, %eax
        mov     t28, 1
        jmp     L$32
L$33:
        cmp     t22, 0
        je      L$22
        jmp     L$23
L$66:
        mov     %eax, t32
        mov     %edi, t133
        mov     %esi, t132
        mov     %ebx, t131
        leave
        ret

        .global LList$Search
        .type LList$Search, @function
LList$Search:
        push    %ebp
        mov     %ebp, %esp
        mov     t135, %ebx
        mov     t136, %esi
        mov     t137, %edi
L$67:
        mov     t33, 0
        mov     t34, DWORD PTR [%ebp+8]
        mov     t134, DWORD PTR [%ebp+8]
        mov     t36, DWORD PTR [t134+8]
L$34:
        cmp     t36, 0
        je      L$35
L$36:
        mov     t38, t33
        jmp     L$68
L$35:
        push    t34
        call    LList$GetElem
        add     %esp, 4
        mov     t35, %eax
        push    t35
        push    DWORD PTR [%ebp+12]
        call    LElement$Equal
        add     %esp, 8
        mov     t71, %eax
        cmp     t71, 0
        je      L$38
L$37:
        mov     t33, 1
L$39:
        push    t34
        call    LList$GetNext
        add     %esp, 4
        mov     t34, %eax
        push    t34
        call    LList$GetEnd
        add     %esp, 4
        mov     t36, %eax
        jmp     L$34
L$38:
        mov     t37, 0
        jmp     L$39
L$68:
        mov     %eax, t38
        mov     %edi, t137
        mov     %esi, t136
        mov     %ebx, t135
        leave
        ret

        .global LList$GetEnd
        .type LList$GetEnd, @function
LList$GetEnd:
        push    %ebp
        mov     %ebp, %esp
        mov     t139, %ebx
        mov     t140, %esi
        mov     t141, %edi
L$69:
        mov     t138, DWORD PTR [%ebp+8]
        mov     t39, DWORD PTR [t138+8]
L$70:
        mov     %eax, t39
        mov     %edi, t141
        mov     %esi, t140
        mov     %ebx, t139
        leave
        ret

        .global LList$GetElem
        .type LList$GetElem, @function
LList$GetElem:
        push    %ebp
        mov     %ebp, %esp
        mov     t143, %ebx
        mov     t144, %esi
        mov     t145, %edi
L$71:
        mov     t142, DWORD PTR [%ebp+8]
        mov     t40, DWORD PTR [t142+4]
L$72:
        mov     %eax, t40
        mov     %edi, t145
        mov     %esi, t144
        mov     %ebx, t143
        leave
        ret

        .global LList$GetNext
        .type LList$GetNext, @function
LList$GetNext:
        push    %ebp
        mov     %ebp, %esp
        mov     t147, %ebx
        mov     t148, %esi
        mov     t149, %edi
L$73:
        mov     t146, DWORD PTR [%ebp+8]
        mov     t41, DWORD PTR [t146+12]
L$74:
        mov     %eax, t41
        mov     %edi, t149
        mov     %esi, t148
        mov     %ebx, t147
        leave
        ret

        .global LList$Print
        .type LList$Print, @function
LList$Print:
        push    %ebp
        mov     %ebp, %esp
        mov     t151, %ebx
        mov     t152, %esi
        mov     t153, %edi
L$75:
        mov     t42, DWORD PTR [%ebp+8]
        mov     t150, DWORD PTR [%ebp+8]
        mov     t43, DWORD PTR [t150+8]
L$40:
        cmp     t43, 0
        je      L$41
L$42:
        mov     t46, 1
        jmp     L$76
L$41:
        push    t42
        call    LList$GetElem
        add     %esp, 4
        mov     t44, %eax
        push    t44
        call    LElement$GetAge
        add     %esp, 4
        mov     t72, %eax
        push    t72
        call    L_println_int
        add     %esp, 4
        mov     t45, %eax
        push    t42
        call    LList$GetNext
        add     %esp, 4
        mov     t42, %eax
        push    t42
        call    LList$GetEnd
        add     %esp, 4
        mov     t43, %eax
        jmp     L$40
L$76:
        mov     %eax, t46
        mov     %edi, t153
        mov     %esi, t152
        mov     %ebx, t151
        leave
        ret

        .global LLL$Start
        .type LLL$Start, @function
LLL$Start:
        push    %ebp
        mov     %ebp, %esp
        mov     t154, %ebx
        mov     t155, %esi
        mov     t156, %edi
L$77:
        push    16
        call    L_halloc
        add     %esp, 4
        mov     t48, %eax
        push    t48
        call    LList$Init
        add     %esp, 4
        mov     t49, %eax
        mov     t47, t48
        push    t47
        call    LList$Init
        add     %esp, 4
        mov     t49, %eax
        push    t47
        call    LList$Print
        add     %esp, 4
        mov     t49, %eax
        push    16
        call    L_halloc
        add     %esp, 4
        mov     t50, %eax
        push    0
        push    37000
        push    25
        push    t50
        call    LElement$Init
        add     %esp, 16
        mov     t49, %eax
        push    t50
        push    t47
        call    LList$Insert
        add     %esp, 8
        mov     t47, %eax
        push    t47
        call    LList$Print
        add     %esp, 4
        mov     t49, %eax
        push    10000000
        call    L_println_int
        add     %esp, 4
        mov     t53, %eax
        push    16
        call    L_halloc
        add     %esp, 4
        mov     t50, %eax
        push    1
        push    42000
        push    39
        push    t50
        call    LElement$Init
        add     %esp, 16
        mov     t49, %eax
        mov     t51, t50
        push    t50
        push    t47
        call    LList$Insert
        add     %esp, 8
        mov     t47, %eax
        push    t47
        call    LList$Print
        add     %esp, 4
        mov     t49, %eax
        push    10000000
        call    L_println_int
        add     %esp, 4
        mov     t54, %eax
        push    16
        call    L_halloc
        add     %esp, 4
        mov     t50, %eax
        push    0
        push    34000
        push    22
        push    t50
        call    LElement$Init
        add     %esp, 16
        mov     t49, %eax
        push    t50
        push    t47
        call    LList$Insert
        add     %esp, 8
        mov     t47, %eax
        push    t47
        call    LList$Print
        add     %esp, 4
        mov     t49, %eax
        push    16
        call    L_halloc
        add     %esp, 4
        mov     t52, %eax
        push    0
        push    34000
        push    27
        push    t52
        call    LElement$Init
        add     %esp, 16
        mov     t49, %eax
        push    t51
        push    t47
        call    LList$Search
        add     %esp, 8
        mov     t73, %eax
        push    t73
        call    L_println_int
        add     %esp, 4
        mov     t55, %eax
        push    t52
        push    t47
        call    LList$Search
        add     %esp, 8
        mov     t74, %eax
        push    t74
        call    L_println_int
        add     %esp, 4
        mov     t56, %eax
        push    10000000
        call    L_println_int
        add     %esp, 4
        mov     t57, %eax
        push    16
        call    L_halloc
        add     %esp, 4
        mov     t50, %eax
        push    0
        push    35000
        push    28
        push    t50
        call    LElement$Init
        add     %esp, 16
        mov     t49, %eax
        push    t50
        push    t47
        call    LList$Insert
        add     %esp, 8
        mov     t47, %eax
        push    t47
        call    LList$Print
        add     %esp, 4
        mov     t49, %eax
        push    2220000
        call    L_println_int
        add     %esp, 4
        mov     t58, %eax
        push    t51
        push    t47
        call    LList$Delete
        add     %esp, 8
        mov     t47, %eax
        push    t47
        call    LList$Print
        add     %esp, 4
        mov     t49, %eax
        push    33300000
        call    L_println_int
        add     %esp, 4
        mov     t59, %eax
        push    t50
        push    t47
        call    LList$Delete
        add     %esp, 8
        mov     t47, %eax
        push    t47
        call    LList$Print
        add     %esp, 4
        mov     t49, %eax
        push    44440000
        call    L_println_int
        add     %esp, 4
        mov     t60, %eax
        mov     t61, 0
L$78:
        mov     %eax, t61
        mov     %edi, t156
        mov     %esi, t155
        mov     %ebx, t154
        leave
        ret
