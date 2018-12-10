        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t59, %ebx
        mov     t60, %esi
        mov     t61, %edi
L$53:
        push    12
        call    L_halloc
        add     %esp, 4
        mov     t55, %eax
        push    10
        push    t55
        call    LBBS$Start
        add     %esp, 8
        mov     t56, %eax
        push    t56
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$54:
        mov     %eax, t1
        mov     %edi, t61
        mov     %esi, t60
        mov     %ebx, t59
        leave
        ret

        .global LBBS$Start
        .type LBBS$Start, @function
LBBS$Start:
        push    %ebp
        mov     %ebp, %esp
        mov     t62, %ebx
        mov     t63, %esi
        mov     t64, %edi
L$55:
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+8]
        call    LBBS$Init
        add     %esp, 8
        mov     t2, %eax
        push    DWORD PTR [%ebp+8]
        call    LBBS$Print
        add     %esp, 4
        mov     t2, %eax
        push    99999
        call    L_println_int
        add     %esp, 4
        mov     t3, %eax
        push    DWORD PTR [%ebp+8]
        call    LBBS$Sort
        add     %esp, 4
        mov     t2, %eax
        push    DWORD PTR [%ebp+8]
        call    LBBS$Print
        add     %esp, 4
        mov     t2, %eax
        mov     t4, 0
L$56:
        mov     %eax, t4
        mov     %edi, t64
        mov     %esi, t63
        mov     %ebx, t62
        leave
        ret

        .global LBBS$Sort
        .type LBBS$Sort, @function
LBBS$Sort:
        push    %ebp
        mov     %ebp, %esp
        mov     t75, %ebx
        mov     t76, %esi
        mov     t77, %edi
L$57:
        mov     t74, DWORD PTR [%ebp+8]
        mov     t6, DWORD PTR [t74+8]
        dec     t6
        mov     t7, -1
L$0:
        cmp     t7, t6
        jl      L$1
L$2:
        mov     t26, 0
        jmp     L$58
L$1:
        mov     t12, 1
L$3:
        mov     t73, t6
        inc     t73
        cmp     t12, t73
        jl      L$4
L$5:
        dec     t6
        jmp     L$0
L$10:
        mov     t9, DWORD PTR [t12*4+t16]
        cmp     t9, t8
        jl      L$24
L$25:
        mov     t5, 0
L$26:
        inc     t12
        jmp     L$3
L$11:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t17, %eax
        jmp     L$10
L$12:
        cmp     t10, DWORD PTR [t18-4]
        jl      L$13
L$14:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t19, %eax
L$13:
        mov     t13, DWORD PTR [t10*4+t18]
        mov     t72, DWORD PTR [%ebp+8]
        mov     t22, DWORD PTR [t72+4]
        cmp     t10, 0
        jl      L$20
L$18:
        cmp     t10, DWORD PTR [t22-4]
        jl      L$19
L$20:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t23, %eax
L$19:
        mov     t71, t10
        sal     t71, 2
        mov     t57, t22
        add     t57, t71
        mov     t70, DWORD PTR [%ebp+8]
        mov     t20, DWORD PTR [t70+4]
        cmp     t12, 0
        jl      L$17
L$15:
        cmp     t12, DWORD PTR [t20-4]
        jl      L$16
L$17:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t21, %eax
L$16:
        mov     t69, DWORD PTR [t12*4+t20]
        mov     DWORD PTR [t57], t69
        mov     t68, DWORD PTR [%ebp+8]
        mov     t24, DWORD PTR [t68+4]
        cmp     t12, 0
        jl      L$23
L$21:
        cmp     t12, DWORD PTR [t24-4]
        jl      L$22
L$23:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t25, %eax
L$22:
        mov     DWORD PTR [t12*4+t24], t13
        jmp     L$26
L$24:
        mov     t10, t12
        dec     t10
        mov     t67, DWORD PTR [%ebp+8]
        mov     t18, DWORD PTR [t67+4]
        cmp     t10, 0
        jl      L$14
        jmp     L$12
L$4:
        mov     t11, t12
        dec     t11
        mov     t66, DWORD PTR [%ebp+8]
        mov     t14, DWORD PTR [t66+4]
        cmp     t11, 0
        jl      L$8
L$6:
        cmp     t11, DWORD PTR [t14-4]
        jl      L$7
L$8:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t15, %eax
L$7:
        mov     t8, DWORD PTR [t11*4+t14]
        mov     t65, DWORD PTR [%ebp+8]
        mov     t16, DWORD PTR [t65+4]
        cmp     t12, 0
        jl      L$11
L$9:
        cmp     t12, DWORD PTR [t16-4]
        jl      L$10
        jmp     L$11
L$58:
        mov     %eax, t26
        mov     %edi, t77
        mov     %esi, t76
        mov     %ebx, t75
        leave
        ret

        .global LBBS$Print
        .type LBBS$Print, @function
LBBS$Print:
        push    %ebp
        mov     %ebp, %esp
        mov     t80, %ebx
        mov     t81, %esi
        mov     t82, %edi
L$59:
        mov     t27, 0
L$27:
        mov     t79, DWORD PTR [%ebp+8]
        cmp     t27, DWORD PTR [t79+8]
        jl      L$28
L$29:
        mov     t31, 0
        jmp     L$60
L$28:
        mov     t78, DWORD PTR [%ebp+8]
        mov     t28, DWORD PTR [t78+4]
        cmp     t27, 0
        jl      L$32
L$30:
        cmp     t27, DWORD PTR [t28-4]
        jl      L$31
L$32:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t29, %eax
L$31:
        push    DWORD PTR [t27*4+t28]
        call    L_println_int
        add     %esp, 4
        mov     t30, %eax
        inc     t27
        jmp     L$27
L$60:
        mov     %eax, t31
        mov     %edi, t82
        mov     %esi, t81
        mov     %ebx, t80
        leave
        ret

        .global LBBS$Init
        .type LBBS$Init, @function
LBBS$Init:
        push    %ebp
        mov     %ebp, %esp
        mov     t98, %ebx
        mov     t99, %esi
        mov     t100, %edi
L$61:
        mov     t96, DWORD PTR [%ebp+8]
        mov     t97, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t96+8], t97
        mov     t58, 4
        add     t58, DWORD PTR [%ebp+8]
        mov     t32, DWORD PTR [%ebp+12]
        mov     t95, t32
        add     t95, 1
        mov     t94, t95
        sal     t94, 2
        push    t94
        call    L_halloc
        add     %esp, 4
        mov     t33, %eax
        mov     DWORD PTR [t33], t32
        mov     t93, t33
        add     t93, 4
        mov     DWORD PTR [t58], t93
        mov     t92, DWORD PTR [%ebp+8]
        mov     t34, DWORD PTR [t92+4]
        cmp     DWORD PTR [t34-4], 0
        jg      L$33
L$34:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t35, %eax
L$33:
        mov     DWORD PTR [t34], 20
        mov     t91, DWORD PTR [%ebp+8]
        mov     t36, DWORD PTR [t91+4]
        cmp     DWORD PTR [t36-4], 1
        jg      L$35
L$36:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t37, %eax
L$35:
        mov     DWORD PTR [t36+4], 7
        mov     t90, DWORD PTR [%ebp+8]
        mov     t38, DWORD PTR [t90+4]
        cmp     DWORD PTR [t38-4], 2
        jg      L$37
L$38:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t39, %eax
L$37:
        mov     DWORD PTR [t38+8], 12
        mov     t89, DWORD PTR [%ebp+8]
        mov     t40, DWORD PTR [t89+4]
        cmp     DWORD PTR [t40-4], 3
        jg      L$39
L$40:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t41, %eax
L$39:
        mov     DWORD PTR [t40+12], 18
        mov     t88, DWORD PTR [%ebp+8]
        mov     t42, DWORD PTR [t88+4]
        cmp     DWORD PTR [t42-4], 4
        jg      L$41
L$42:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t43, %eax
L$41:
        mov     DWORD PTR [t42+16], 2
        mov     t87, DWORD PTR [%ebp+8]
        mov     t44, DWORD PTR [t87+4]
        cmp     DWORD PTR [t44-4], 5
        jg      L$43
L$44:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t45, %eax
L$43:
        mov     DWORD PTR [t44+20], 11
        mov     t86, DWORD PTR [%ebp+8]
        mov     t46, DWORD PTR [t86+4]
        cmp     DWORD PTR [t46-4], 6
        jg      L$45
L$46:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t47, %eax
L$45:
        mov     DWORD PTR [t46+24], 6
        mov     t85, DWORD PTR [%ebp+8]
        mov     t48, DWORD PTR [t85+4]
        cmp     DWORD PTR [t48-4], 7
        jg      L$47
L$48:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t49, %eax
L$47:
        mov     DWORD PTR [t48+28], 9
        mov     t84, DWORD PTR [%ebp+8]
        mov     t50, DWORD PTR [t84+4]
        cmp     DWORD PTR [t50-4], 8
        jg      L$49
L$50:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t51, %eax
L$49:
        mov     DWORD PTR [t50+32], 19
        mov     t83, DWORD PTR [%ebp+8]
        mov     t52, DWORD PTR [t83+4]
        cmp     DWORD PTR [t52-4], 9
        jg      L$51
L$52:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t53, %eax
L$51:
        mov     DWORD PTR [t52+36], 5
        mov     t54, 0
L$62:
        mov     %eax, t54
        mov     %edi, t100
        mov     %esi, t99
        mov     %ebx, t98
        leave
        ret
