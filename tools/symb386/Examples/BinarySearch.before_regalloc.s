        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t66, %ebx
        mov     t67, %esi
        mov     t68, %edi
L$63:
        push    12
        call    L_halloc
        add     %esp, 4
        mov     t53, %eax
        push    20
        push    t53
        call    LBS$Start
        add     %esp, 8
        mov     t54, %eax
        push    t54
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$64:
        mov     %eax, t1
        mov     %edi, t68
        mov     %esi, t67
        mov     %ebx, t66
        leave
        ret

        .global LBS$Start
        .type LBS$Start, @function
LBS$Start:
        push    %ebp
        mov     %ebp, %esp
        mov     t69, %ebx
        mov     t70, %esi
        mov     t71, %edi
L$65:
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+8]
        call    LBS$Init
        add     %esp, 8
        mov     t2, %eax
        push    DWORD PTR [%ebp+8]
        call    LBS$Print
        add     %esp, 4
        mov     t3, %eax
        push    8
        push    DWORD PTR [%ebp+8]
        call    LBS$Search
        add     %esp, 8
        mov     t55, %eax
        cmp     t55, 0
        je      L$1
L$0:
        push    1
        call    L_println_int
        add     %esp, 4
        mov     t4, %eax
L$2:
        push    19
        push    DWORD PTR [%ebp+8]
        call    LBS$Search
        add     %esp, 8
        mov     t56, %eax
        cmp     t56, 0
        je      L$4
L$3:
        push    1
        call    L_println_int
        add     %esp, 4
        mov     t6, %eax
L$5:
        push    20
        push    DWORD PTR [%ebp+8]
        call    LBS$Search
        add     %esp, 8
        mov     t57, %eax
        cmp     t57, 0
        je      L$7
L$6:
        push    1
        call    L_println_int
        add     %esp, 4
        mov     t8, %eax
L$8:
        push    21
        push    DWORD PTR [%ebp+8]
        call    LBS$Search
        add     %esp, 8
        mov     t58, %eax
        cmp     t58, 0
        je      L$10
L$9:
        push    1
        call    L_println_int
        add     %esp, 4
        mov     t10, %eax
L$11:
        push    37
        push    DWORD PTR [%ebp+8]
        call    LBS$Search
        add     %esp, 8
        mov     t59, %eax
        cmp     t59, 0
        je      L$13
L$12:
        push    1
        call    L_println_int
        add     %esp, 4
        mov     t12, %eax
L$14:
        push    38
        push    DWORD PTR [%ebp+8]
        call    LBS$Search
        add     %esp, 8
        mov     t60, %eax
        cmp     t60, 0
        je      L$16
L$15:
        push    1
        call    L_println_int
        add     %esp, 4
        mov     t14, %eax
L$17:
        push    39
        push    DWORD PTR [%ebp+8]
        call    LBS$Search
        add     %esp, 8
        mov     t61, %eax
        cmp     t61, 0
        je      L$19
L$18:
        push    1
        call    L_println_int
        add     %esp, 4
        mov     t16, %eax
L$20:
        push    50
        push    DWORD PTR [%ebp+8]
        call    LBS$Search
        add     %esp, 8
        mov     t62, %eax
        cmp     t62, 0
        je      L$22
L$21:
        push    1
        call    L_println_int
        add     %esp, 4
        mov     t18, %eax
L$23:
        mov     t20, 999
        jmp     L$66
L$1:
        push    0
        call    L_println_int
        add     %esp, 4
        mov     t5, %eax
        jmp     L$2
L$10:
        push    0
        call    L_println_int
        add     %esp, 4
        mov     t11, %eax
        jmp     L$11
L$13:
        push    0
        call    L_println_int
        add     %esp, 4
        mov     t13, %eax
        jmp     L$14
L$16:
        push    0
        call    L_println_int
        add     %esp, 4
        mov     t15, %eax
        jmp     L$17
L$19:
        push    0
        call    L_println_int
        add     %esp, 4
        mov     t17, %eax
        jmp     L$20
L$22:
        push    0
        call    L_println_int
        add     %esp, 4
        mov     t19, %eax
        jmp     L$23
L$4:
        push    0
        call    L_println_int
        add     %esp, 4
        mov     t7, %eax
        jmp     L$5
L$7:
        push    0
        call    L_println_int
        add     %esp, 4
        mov     t9, %eax
        jmp     L$8
L$66:
        mov     %eax, t20
        mov     %edi, t71
        mov     %esi, t70
        mov     %ebx, t69
        leave
        ret

        .global LBS$Search
        .type LBS$Search, @function
LBS$Search:
        push    %ebp
        mov     %ebp, %esp
        mov     t75, %ebx
        mov     t76, %esi
        mov     t77, %edi
L$67:
        mov     t26, 0
        mov     t21, 0
        mov     t74, DWORD PTR [%ebp+8]
        mov     t73, DWORD PTR [t74+4]
        mov     t22, DWORD PTR [t73-4]
        dec     t22
        mov     t23, 1
        mov     t24, 1
L$24:
        cmp     t24, 0
        je      L$26
L$25:
        mov     t25, t23
        add     t25, t22
        push    t25
        push    DWORD PTR [%ebp+8]
        call    LBS$Div
        add     %esp, 8
        mov     t25, %eax
        mov     t72, DWORD PTR [%ebp+8]
        mov     t28, DWORD PTR [t72+4]
        cmp     t25, 0
        jl      L$29
L$27:
        cmp     t25, DWORD PTR [t28-4]
        jl      L$28
L$29:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t29, %eax
L$28:
        mov     t26, DWORD PTR [t25*4+t28]
        cmp     DWORD PTR [%ebp+12], t26
        jl      L$30
L$31:
        mov     t23, t25
        inc     t23
L$32:
        push    DWORD PTR [%ebp+12]
        push    t26
        push    DWORD PTR [%ebp+8]
        call    LBS$Compare
        add     %esp, 12
        mov     t63, %eax
        cmp     t63, 0
        je      L$34
L$33:
        mov     t24, 0
L$35:
        cmp     t22, t23
        jl      L$36
L$37:
        mov     t27, 0
L$38:
        jmp     L$24
L$26:
        push    DWORD PTR [%ebp+12]
        push    t26
        push    DWORD PTR [%ebp+8]
        call    LBS$Compare
        add     %esp, 12
        mov     t64, %eax
        cmp     t64, 0
        je      L$40
L$39:
        mov     t21, 1
L$41:
        mov     t30, t21
        jmp     L$68
L$30:
        mov     t22, t25
        dec     t22
        jmp     L$32
L$34:
        mov     t24, 1
        jmp     L$35
L$36:
        mov     t24, 0
        jmp     L$38
L$40:
        mov     t21, 0
        jmp     L$41
L$68:
        mov     %eax, t30
        mov     %edi, t77
        mov     %esi, t76
        mov     %ebx, t75
        leave
        ret

        .global LBS$Div
        .type LBS$Div, @function
LBS$Div:
        push    %ebp
        mov     %ebp, %esp
        mov     t78, %ebx
        mov     t79, %esi
        mov     t80, %edi
L$69:
        mov     t31, 0
        mov     t32, 0
        mov     t33, DWORD PTR [%ebp+12]
        dec     t33
L$42:
        cmp     t32, t33
        jl      L$43
L$44:
        mov     t34, t31
        jmp     L$70
L$43:
        inc     t31
        add     t32, 2
        jmp     L$42
L$70:
        mov     %eax, t34
        mov     %edi, t80
        mov     %esi, t79
        mov     %ebx, t78
        leave
        ret

        .global LBS$Compare
        .type LBS$Compare, @function
LBS$Compare:
        push    %ebp
        mov     %ebp, %esp
        mov     t82, %ebx
        mov     t83, %esi
        mov     t84, %edi
L$71:
        mov     t35, 0
        mov     t36, DWORD PTR [%ebp+16]
        inc     t36
        mov     t81, DWORD PTR [%ebp+12]
        cmp     t81, DWORD PTR [%ebp+16]
        jl      L$48
L$49:
        cmp     DWORD PTR [%ebp+12], t36
        jl      L$45
L$46:
        mov     t35, 0
L$47:
L$50:
        mov     t37, t35
        jmp     L$72
L$45:
        mov     t35, 1
        jmp     L$47
L$48:
        mov     t35, 0
        jmp     L$50
L$72:
        mov     %eax, t37
        mov     %edi, t84
        mov     %esi, t83
        mov     %ebx, t82
        leave
        ret

        .global LBS$Print
        .type LBS$Print, @function
LBS$Print:
        push    %ebp
        mov     %ebp, %esp
        mov     t87, %ebx
        mov     t88, %esi
        mov     t89, %edi
L$73:
        mov     t38, 1
L$51:
        mov     t86, DWORD PTR [%ebp+8]
        cmp     t38, DWORD PTR [t86+8]
        jl      L$52
L$53:
        push    99999
        call    L_println_int
        add     %esp, 4
        mov     t42, %eax
        mov     t43, 0
        jmp     L$74
L$52:
        mov     t85, DWORD PTR [%ebp+8]
        mov     t39, DWORD PTR [t85+4]
        cmp     t38, 0
        jl      L$56
L$54:
        cmp     t38, DWORD PTR [t39-4]
        jl      L$55
L$56:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t40, %eax
L$55:
        push    DWORD PTR [t38*4+t39]
        call    L_println_int
        add     %esp, 4
        mov     t41, %eax
        inc     t38
        jmp     L$51
L$74:
        mov     %eax, t43
        mov     %edi, t89
        mov     %esi, t88
        mov     %ebx, t87
        leave
        ret

        .global LBS$Init
        .type LBS$Init, @function
LBS$Init:
        push    %ebp
        mov     %ebp, %esp
        mov     t99, %ebx
        mov     t100, %esi
        mov     t101, %edi
L$75:
        mov     t97, DWORD PTR [%ebp+8]
        mov     t98, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t97+8], t98
        mov     t65, 4
        add     t65, DWORD PTR [%ebp+8]
        mov     t48, DWORD PTR [%ebp+12]
        mov     t96, t48
        add     t96, 1
        mov     t95, t96
        sal     t95, 2
        push    t95
        call    L_halloc
        add     %esp, 4
        mov     t49, %eax
        mov     DWORD PTR [t49], t48
        mov     t94, t49
        add     t94, 4
        mov     DWORD PTR [t65], t94
        mov     t44, 1
        mov     t93, DWORD PTR [%ebp+8]
        mov     t45, DWORD PTR [t93+8]
        inc     t45
L$57:
        mov     t92, DWORD PTR [%ebp+8]
        cmp     t44, DWORD PTR [t92+8]
        jl      L$58
L$59:
        mov     t52, 0
        jmp     L$76
L$58:
        mov     t47, t44
        sal     t47, 1
        mov     t46, -3
        add     t46, t45
        mov     t91, DWORD PTR [%ebp+8]
        mov     t50, DWORD PTR [t91+4]
        cmp     t44, 0
        jl      L$62
L$60:
        cmp     t44, DWORD PTR [t50-4]
        jl      L$61
L$62:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t51, %eax
L$61:
        mov     t90, t47
        add     t90, t46
        mov     DWORD PTR [t44*4+t50], t90
        inc     t44
        dec     t45
        jmp     L$57
L$76:
        mov     %eax, t52
        mov     %edi, t101
        mov     %esi, t100
        mov     %ebx, t99
        leave
        ret
