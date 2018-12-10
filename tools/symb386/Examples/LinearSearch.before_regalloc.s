        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t40, %ebx
        mov     t41, %esi
        mov     t42, %edi
L$24:
        push    12
        call    L_halloc
        add     %esp, 4
        mov     t33, %eax
        push    10
        push    t33
        call    LLS$Start
        add     %esp, 8
        mov     t34, %eax
        push    t34
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$25:
        mov     %eax, t1
        mov     %edi, t42
        mov     %esi, t41
        mov     %ebx, t40
        leave
        ret

        .global LLS$Start
        .type LLS$Start, @function
LLS$Start:
        push    %ebp
        mov     %ebp, %esp
        mov     t43, %ebx
        mov     t44, %esi
        mov     t45, %edi
L$26:
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+8]
        call    LLS$Init
        add     %esp, 8
        mov     t2, %eax
        push    DWORD PTR [%ebp+8]
        call    LLS$Print
        add     %esp, 4
        mov     t3, %eax
        push    9999
        call    L_println_int
        add     %esp, 4
        mov     t4, %eax
        push    8
        push    DWORD PTR [%ebp+8]
        call    LLS$Search
        add     %esp, 8
        mov     t35, %eax
        push    t35
        call    L_println_int
        add     %esp, 4
        mov     t5, %eax
        push    12
        push    DWORD PTR [%ebp+8]
        call    LLS$Search
        add     %esp, 8
        mov     t36, %eax
        push    t36
        call    L_println_int
        add     %esp, 4
        mov     t6, %eax
        push    17
        push    DWORD PTR [%ebp+8]
        call    LLS$Search
        add     %esp, 8
        mov     t37, %eax
        push    t37
        call    L_println_int
        add     %esp, 4
        mov     t7, %eax
        push    50
        push    DWORD PTR [%ebp+8]
        call    LLS$Search
        add     %esp, 8
        mov     t38, %eax
        push    t38
        call    L_println_int
        add     %esp, 4
        mov     t8, %eax
        mov     t9, 55
L$27:
        mov     %eax, t9
        mov     %edi, t45
        mov     %esi, t44
        mov     %ebx, t43
        leave
        ret

        .global LLS$Print
        .type LLS$Print, @function
LLS$Print:
        push    %ebp
        mov     %ebp, %esp
        mov     t48, %ebx
        mov     t49, %esi
        mov     t50, %edi
L$28:
        mov     t10, 1
L$0:
        mov     t47, DWORD PTR [%ebp+8]
        cmp     t10, DWORD PTR [t47+8]
        jl      L$1
L$2:
        mov     t14, 0
        jmp     L$29
L$1:
        mov     t46, DWORD PTR [%ebp+8]
        mov     t11, DWORD PTR [t46+4]
        cmp     t10, 0
        jl      L$5
L$3:
        cmp     t10, DWORD PTR [t11-4]
        jl      L$4
L$5:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t12, %eax
L$4:
        push    DWORD PTR [t10*4+t11]
        call    L_println_int
        add     %esp, 4
        mov     t13, %eax
        inc     t10
        jmp     L$0
L$29:
        mov     %eax, t14
        mov     %edi, t50
        mov     %esi, t49
        mov     %ebx, t48
        leave
        ret

        .global LLS$Search
        .type LLS$Search, @function
LLS$Search:
        push    %ebp
        mov     %ebp, %esp
        mov     t54, %ebx
        mov     t55, %esi
        mov     t56, %edi
L$30:
        mov     t15, 1
        mov     t16, 0
        mov     t17, 0
L$6:
        mov     t53, DWORD PTR [%ebp+8]
        cmp     t15, DWORD PTR [t53+8]
        jl      L$7
L$8:
        mov     t23, t17
        jmp     L$31
L$10:
        mov     t18, DWORD PTR [t15*4+t21]
        mov     t19, DWORD PTR [%ebp+12]
        inc     t19
        cmp     t18, DWORD PTR [%ebp+12]
        jl      L$15
L$16:
        cmp     t18, t19
        jl      L$12
L$13:
        mov     t20, 0
L$14:
L$17:
        inc     t15
        jmp     L$6
L$11:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t22, %eax
        jmp     L$10
L$12:
        mov     t16, 1
        mov     t17, 1
        mov     t52, DWORD PTR [%ebp+8]
        mov     t15, DWORD PTR [t52+8]
        jmp     L$14
L$15:
        mov     t20, 0
        jmp     L$17
L$7:
        mov     t51, DWORD PTR [%ebp+8]
        mov     t21, DWORD PTR [t51+4]
        cmp     t15, 0
        jl      L$11
L$9:
        cmp     t15, DWORD PTR [t21-4]
        jl      L$10
        jmp     L$11
L$31:
        mov     %eax, t23
        mov     %edi, t56
        mov     %esi, t55
        mov     %ebx, t54
        leave
        ret

        .global LLS$Init
        .type LLS$Init, @function
LLS$Init:
        push    %ebp
        mov     %ebp, %esp
        mov     t66, %ebx
        mov     t67, %esi
        mov     t68, %edi
L$32:
        mov     t64, DWORD PTR [%ebp+8]
        mov     t65, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t64+8], t65
        mov     t39, 4
        add     t39, DWORD PTR [%ebp+8]
        mov     t28, DWORD PTR [%ebp+12]
        mov     t63, t28
        add     t63, 1
        mov     t62, t63
        sal     t62, 2
        push    t62
        call    L_halloc
        add     %esp, 4
        mov     t29, %eax
        mov     DWORD PTR [t29], t28
        mov     t61, t29
        add     t61, 4
        mov     DWORD PTR [t39], t61
        mov     t24, 1
        mov     t60, DWORD PTR [%ebp+8]
        mov     t25, DWORD PTR [t60+8]
        inc     t25
L$18:
        mov     t59, DWORD PTR [%ebp+8]
        cmp     t24, DWORD PTR [t59+8]
        jl      L$19
L$20:
        mov     t32, 0
        jmp     L$33
L$19:
        mov     t26, t24
        sal     t26, 1
        mov     t27, -3
        add     t27, t25
        mov     t58, DWORD PTR [%ebp+8]
        mov     t30, DWORD PTR [t58+4]
        cmp     t24, 0
        jl      L$23
L$21:
        cmp     t24, DWORD PTR [t30-4]
        jl      L$22
L$23:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t31, %eax
L$22:
        mov     t57, t26
        add     t57, t27
        mov     DWORD PTR [t24*4+t30], t57
        inc     t24
        dec     t25
        jmp     L$18
L$33:
        mov     %eax, t32
        mov     %edi, t68
        mov     %esi, t67
        mov     %ebx, t66
        leave
        ret
