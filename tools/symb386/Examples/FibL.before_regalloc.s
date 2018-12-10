        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t39, %ebx
        mov     t40, %esi
        mov     t41, %edi
L$33:
        push    4
        call    L_halloc
        add     %esp, 4
        mov     t29, %eax
        push    5
        push    t29
        call    LFib$nfib_lazy
        add     %esp, 8
        mov     t30, %eax
        push    t30
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$34:
        mov     %eax, t1
        mov     %edi, t41
        mov     %esi, t40
        mov     %ebx, t39
        leave
        ret

        .global LFib$nfib
        .type LFib$nfib, @function
LFib$nfib:
        push    %ebp
        mov     %ebp, %esp
        mov     t45, %ebx
        mov     t46, %esi
        mov     t47, %edi
L$35:
        cmp     DWORD PTR [%ebp+12], 2
        jl      L$0
L$1:
        mov     t44, DWORD PTR [%ebp+12]
        dec     t44
        push    t44
        push    DWORD PTR [%ebp+8]
        call    LFib$nfib
        add     %esp, 8
        mov     t31, %eax
        mov     t33, t31
        mov     t43, -2
        add     t43, DWORD PTR [%ebp+12]
        push    t43
        push    DWORD PTR [%ebp+8]
        call    LFib$nfib
        add     %esp, 8
        mov     t32, %eax
        mov     t42, t33
        add     t42, t32
        mov     t2, t42
        inc     t2
L$2:
        mov     t3, t2
        jmp     L$36
L$0:
        mov     t2, 1
        jmp     L$2
L$36:
        mov     %eax, t3
        mov     %edi, t47
        mov     %esi, t46
        mov     %ebx, t45
        leave
        ret

        .global LFib$nfib_lazy
        .type LFib$nfib_lazy, @function
LFib$nfib_lazy:
        push    %ebp
        mov     %ebp, %esp
        mov     t48, %ebx
        mov     t49, %esi
        mov     t50, %edi
L$37:
        cmp     DWORD PTR [%ebp+12], 1
        jl      L$3
L$4:
        mov     t4, 0
L$5:
        push    8
        call    L_halloc
        add     %esp, 4
        mov     t6, %eax
        push    DWORD PTR [%ebp+12]
        push    t6
        call    LLazyArray$init
        add     %esp, 8
        mov     t5, %eax
        push    DWORD PTR [%ebp+12]
        push    t6
        call    LLazyArray$nfib
        add     %esp, 8
        mov     t4, %eax
        mov     t7, t4
        jmp     L$38
L$3:
        mov     t4, 0
        jmp     L$5
L$38:
        mov     %eax, t7
        mov     %edi, t50
        mov     %esi, t49
        mov     %ebx, t48
        leave
        ret

        .global LLazyArray$init
        .type LLazyArray$init, @function
LLazyArray$init:
        push    %ebp
        mov     %ebp, %esp
        mov     t55, %ebx
        mov     t56, %esi
        mov     t57, %edi
L$39:
        mov     t34, 4
        add     t34, DWORD PTR [%ebp+8]
        mov     t9, DWORD PTR [%ebp+12]
        mov     t54, t9
        add     t54, 1
        mov     t53, t54
        sal     t53, 2
        push    t53
        call    L_halloc
        add     %esp, 4
        mov     t10, %eax
        mov     DWORD PTR [t10], t9
        mov     t52, t10
        add     t52, 4
        mov     DWORD PTR [t34], t52
        mov     t8, 0
L$6:
        cmp     t8, DWORD PTR [%ebp+12]
        jl      L$7
L$8:
        mov     t13, 1
        jmp     L$40
L$10:
        mov     DWORD PTR [t8*4+t11], 0
        inc     t8
        jmp     L$6
L$11:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t12, %eax
        jmp     L$10
L$7:
        mov     t51, DWORD PTR [%ebp+8]
        mov     t11, DWORD PTR [t51+4]
        cmp     t8, 0
        jl      L$11
L$9:
        cmp     t8, DWORD PTR [t11-4]
        jl      L$10
        jmp     L$11
L$40:
        mov     %eax, t13
        mov     %edi, t57
        mov     %esi, t56
        mov     %ebx, t55
        leave
        ret

        .global LLazyArray$defined
        .type LLazyArray$defined, @function
LLazyArray$defined:
        push    %ebp
        mov     %ebp, %esp
        mov     t58, %ebx
        mov     t59, %esi
        mov     t60, %edi
L$41:
        cmp     DWORD PTR [%ebp+12], 0
        jl      L$15
L$16:
        cmp     DWORD PTR [%ebp+12], 0
        jg      L$12
L$13:
        mov     t14, 0
L$14:
L$17:
        mov     t15, t14
        jmp     L$42
L$12:
        mov     t14, 1
        jmp     L$14
L$15:
        mov     t14, 1
        jmp     L$17
L$42:
        mov     %eax, t15
        mov     %edi, t60
        mov     %esi, t59
        mov     %ebx, t58
        leave
        ret

        .global LLazyArray$get
        .type LLazyArray$get, @function
LLazyArray$get:
        push    %ebp
        mov     %ebp, %esp
        mov     t63, %ebx
        mov     t64, %esi
        mov     t65, %edi
L$43:
        cmp     DWORD PTR [%ebp+12], 1
        jl      L$18
L$19:
        mov     t18, 0
L$20:
        mov     t62, DWORD PTR [%ebp+8]
        mov     t19, DWORD PTR [t62+4]
        mov     t20, DWORD PTR [%ebp+12]
        cmp     t20, 0
        jl      L$23
L$21:
        cmp     t20, DWORD PTR [t19-4]
        jl      L$22
L$23:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t21, %eax
L$22:
        mov     t16, DWORD PTR [t20*4+t19]
        push    t16
        push    DWORD PTR [%ebp+8]
        call    LLazyArray$defined
        add     %esp, 8
        mov     t35, %eax
        cmp     t35, 0
        je      L$28
L$27:
        mov     t18, t16
L$29:
        mov     t25, t18
        jmp     L$44
L$18:
        mov     t18, 0
        jmp     L$20
L$24:
        cmp     t23, DWORD PTR [t22-4]
        jl      L$25
L$26:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t24, %eax
L$25:
        mov     DWORD PTR [t23*4+t22], t17
        mov     t18, t17
        jmp     L$29
L$28:
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+8]
        call    LLazyArray$f
        add     %esp, 8
        mov     t17, %eax
        mov     t61, DWORD PTR [%ebp+8]
        mov     t22, DWORD PTR [t61+4]
        mov     t23, DWORD PTR [%ebp+12]
        cmp     t23, 0
        jl      L$26
        jmp     L$24
L$44:
        mov     %eax, t25
        mov     %edi, t65
        mov     %esi, t64
        mov     %ebx, t63
        leave
        ret

        .global LLazyArray$f
        .type LLazyArray$f, @function
LLazyArray$f:
        push    %ebp
        mov     %ebp, %esp
        mov     t66, %ebx
        mov     t67, %esi
        mov     t68, %edi
L$45:
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+8]
        call    LLazyArray$nfib
        add     %esp, 8
        mov     t26, %eax
L$46:
        mov     %eax, t26
        mov     %edi, t68
        mov     %esi, t67
        mov     %ebx, t66
        leave
        ret

        .global LLazyArray$nfib
        .type LLazyArray$nfib, @function
LLazyArray$nfib:
        push    %ebp
        mov     %ebp, %esp
        mov     t72, %ebx
        mov     t73, %esi
        mov     t74, %edi
L$47:
        cmp     DWORD PTR [%ebp+12], 2
        jl      L$30
L$31:
        mov     t71, DWORD PTR [%ebp+12]
        dec     t71
        push    t71
        push    DWORD PTR [%ebp+8]
        call    LLazyArray$get
        add     %esp, 8
        mov     t36, %eax
        mov     t38, t36
        mov     t70, -2
        add     t70, DWORD PTR [%ebp+12]
        push    t70
        push    DWORD PTR [%ebp+8]
        call    LLazyArray$get
        add     %esp, 8
        mov     t37, %eax
        mov     t69, t38
        add     t69, t37
        mov     t27, t69
        inc     t27
L$32:
        mov     t28, t27
        jmp     L$48
L$30:
        mov     t27, 1
        jmp     L$32
L$48:
        mov     %eax, t28
        mov     %edi, t74
        mov     %esi, t73
        mov     %ebx, t72
        leave
        ret
