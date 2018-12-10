        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t40, %ebx
        mov     t41, %esi
        mov     t42, %edi
L$35:
        push    4
        call    L_halloc
        add     %esp, 4
        mov     t27, %eax
        push    t27
        call    LEulerClass$test_it
        add     %esp, 4
        mov     t28, %eax
        push    t28
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$36:
        mov     %eax, t1
        mov     %edi, t42
        mov     %esi, t41
        mov     %ebx, t40
        leave
        ret

        .global LEulerClass$eq
        .type LEulerClass$eq, @function
LEulerClass$eq:
        push    %ebp
        mov     %ebp, %esp
        mov     t45, %ebx
        mov     t46, %esi
        mov     t47, %edi
L$37:
        mov     t2, 1
        mov     t44, DWORD PTR [%ebp+12]
        cmp     t44, DWORD PTR [%ebp+16]
        jge     L$0
L$1:
        mov     t2, 0
L$0:
        mov     t4, t2
        cmp     t4, 0
        je      L$4
L$5:
        mov     t3, 1
        mov     t43, DWORD PTR [%ebp+16]
        cmp     t43, DWORD PTR [%ebp+12]
        jge     L$2
L$3:
        mov     t3, 0
L$2:
        mov     t4, t3
L$4:
        mov     t5, t4
L$38:
        mov     %eax, t5
        mov     %edi, t47
        mov     %esi, t46
        mov     %ebx, t45
        leave
        ret

        .global LEulerClass$div
        .type LEulerClass$div, @function
LEulerClass$div:
        push    %ebp
        mov     %ebp, %esp
        mov     t50, %ebx
        mov     t51, %esi
        mov     t52, %edi
L$39:
        mov     t49, DWORD PTR [%ebp+12]
        cmp     t49, DWORD PTR [%ebp+16]
        jl      L$9
L$10:
        push    1
        push    DWORD PTR [%ebp+16]
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$eq
        add     %esp, 12
        mov     t29, %eax
        cmp     t29, 0
        je      L$7
L$6:
        mov     t6, DWORD PTR [%ebp+12]
L$8:
L$11:
        mov     t7, t6
        jmp     L$40
L$7:
        mov     t48, DWORD PTR [%ebp+12]
        sub     t48, DWORD PTR [%ebp+16]
        push    DWORD PTR [%ebp+16]
        push    t48
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$div
        add     %esp, 12
        mov     t30, %eax
        mov     t6, t30
        inc     t6
        jmp     L$8
L$9:
        mov     t6, 0
        jmp     L$11
L$40:
        mov     %eax, t7
        mov     %edi, t52
        mov     %esi, t51
        mov     %ebx, t50
        leave
        ret

        .global LEulerClass$rem
        .type LEulerClass$rem, @function
LEulerClass$rem:
        push    %ebp
        mov     %ebp, %esp
        mov     t54, %ebx
        mov     t55, %esi
        mov     t56, %edi
L$41:
        mov     t33, DWORD PTR [%ebp+16]
        mov     t32, DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+16]
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$div
        add     %esp, 12
        mov     t31, %eax
        mov     %eax, t32
        imul    t31
        mov     t53, %eax
        mov     t8, t33
        sub     t8, t53
L$42:
        mov     %eax, t8
        mov     %edi, t56
        mov     %esi, t55
        mov     %ebx, t54
        leave
        ret

        .global LEulerClass$divides
        .type LEulerClass$divides, @function
LEulerClass$divides:
        push    %ebp
        mov     %ebp, %esp
        mov     t58, %ebx
        mov     t59, %esi
        mov     t60, %edi
L$43:
        mov     t37, DWORD PTR [%ebp+8]
        mov     t36, DWORD PTR [%ebp+16]
        mov     t35, DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+16]
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$div
        add     %esp, 12
        mov     t34, %eax
        mov     %eax, t35
        imul    t34
        mov     t57, %eax
        push    t57
        push    t36
        push    t37
        call    LEulerClass$eq
        add     %esp, 12
        mov     t9, %eax
L$44:
        mov     %eax, t9
        mov     %edi, t60
        mov     %esi, t59
        mov     %ebx, t58
        leave
        ret

        .global LEulerClass$hcf
        .type LEulerClass$hcf, @function
LEulerClass$hcf:
        push    %ebp
        mov     %ebp, %esp
        mov     t63, %ebx
        mov     t64, %esi
        mov     t65, %edi
L$45:
        mov     t62, DWORD PTR [%ebp+12]
        cmp     t62, DWORD PTR [%ebp+16]
        jl      L$15
L$16:
        cmp     DWORD PTR [%ebp+16], 1
        jl      L$12
L$13:
        mov     t61, DWORD PTR [%ebp+12]
        sub     t61, DWORD PTR [%ebp+16]
        push    t61
        push    DWORD PTR [%ebp+16]
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$hcf
        add     %esp, 12
        mov     t10, %eax
L$14:
L$17:
        mov     t11, t10
        jmp     L$46
L$12:
        mov     t10, DWORD PTR [%ebp+12]
        jmp     L$14
L$15:
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+16]
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$hcf
        add     %esp, 12
        mov     t10, %eax
        jmp     L$17
L$46:
        mov     %eax, t11
        mov     %edi, t65
        mov     %esi, t64
        mov     %ebx, t63
        leave
        ret

        .global LEulerClass$relprime
        .type LEulerClass$relprime, @function
LEulerClass$relprime:
        push    %ebp
        mov     %ebp, %esp
        mov     t66, %ebx
        mov     t67, %esi
        mov     t68, %edi
L$47:
        mov     t12, 1
        push    DWORD PTR [%ebp+16]
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$hcf
        add     %esp, 12
        mov     t38, %eax
        cmp     t38, 2
        jl      L$18
L$19:
        mov     t12, 0
L$18:
        mov     t13, t12
L$48:
        mov     %eax, t13
        mov     %edi, t68
        mov     %esi, t67
        mov     %ebx, t66
        leave
        ret

        .global LEulerClass$euler
        .type LEulerClass$euler, @function
LEulerClass$euler:
        push    %ebp
        mov     %ebp, %esp
        mov     t69, %ebx
        mov     t70, %esi
        mov     t71, %edi
L$49:
        mov     t14, 0
        mov     t15, 1
L$20:
        cmp     t15, DWORD PTR [%ebp+12]
        jl      L$21
L$22:
        mov     t16, t14
        jmp     L$50
L$21:
        push    t15
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$relprime
        add     %esp, 12
        mov     t39, %eax
        cmp     t39, 0
        je      L$24
L$23:
        inc     t14
L$25:
        inc     t15
        jmp     L$20
L$24:
        jmp     L$25
L$50:
        mov     %eax, t16
        mov     %edi, t71
        mov     %esi, t70
        mov     %ebx, t69
        leave
        ret

        .global LEulerClass$test_it
        .type LEulerClass$test_it, @function
LEulerClass$test_it:
        push    %ebp
        mov     %ebp, %esp
        mov     t72, %ebx
        mov     t73, %esi
        mov     t74, %edi
L$51:
        mov     t18, 1
        push    5
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$euler
        add     %esp, 8
        mov     t17, %eax
        push    t17
        call    L_println_int
        add     %esp, 4
        mov     t20, %eax
        mov     t21, t18
        cmp     t21, 0
        je      L$26
L$27:
        push    4
        push    t17
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$eq
        add     %esp, 12
        mov     t21, %eax
L$26:
        mov     t18, t21
        push    21
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$euler
        add     %esp, 8
        mov     t17, %eax
        push    t17
        call    L_println_int
        add     %esp, 4
        mov     t22, %eax
        mov     t23, t18
        cmp     t23, 0
        je      L$28
L$29:
        push    12
        push    t17
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$eq
        add     %esp, 12
        mov     t23, %eax
L$28:
        mov     t18, t23
        push    188
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$euler
        add     %esp, 8
        mov     t17, %eax
        push    t17
        call    L_println_int
        add     %esp, 4
        mov     t24, %eax
        mov     t25, t18
        cmp     t25, 0
        je      L$30
L$31:
        push    92
        push    t17
        push    DWORD PTR [%ebp+8]
        call    LEulerClass$eq
        add     %esp, 12
        mov     t25, %eax
L$30:
        mov     t18, t25
        cmp     t18, 0
        je      L$33
L$32:
        mov     t19, 0
L$34:
        mov     t26, t19
        jmp     L$52
L$33:
        mov     t19, 1
        jmp     L$34
L$52:
        mov     %eax, t26
        mov     %edi, t74
        mov     %esi, t73
        mov     %ebx, t72
        leave
        ret
