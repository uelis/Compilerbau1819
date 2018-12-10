        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t19, %ebx
        mov     t20, %esi
        mov     t21, %edi
L$15:
        push    12
        call    L_halloc
        add     %esp, 4
        mov     t15, %eax
        push    10
        push    5
        push    t15
        call    LA$run
        add     %esp, 12
        mov     t16, %eax
        push    t16
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$16:
        mov     %eax, t1
        mov     %edi, t21
        mov     %esi, t20
        mov     %ebx, t19
        leave
        ret

        .global LA$run
        .type LA$run, @function
LA$run:
        push    %ebp
        mov     %ebp, %esp
        mov     t36, %ebx
        mov     t37, %esi
        mov     t38, %edi
L$17:
        mov     t17, 4
        add     t17, DWORD PTR [%ebp+8]
        mov     t3, DWORD PTR [%ebp+16]
        mov     t35, t3
        add     t35, 1
        mov     t34, t35
        sal     t34, 2
        push    t34
        call    L_halloc
        add     %esp, 4
        mov     t4, %eax
        mov     DWORD PTR [t4], t3
        mov     t33, t4
        add     t33, 4
        mov     DWORD PTR [t17], t33
        mov     t2, 0
L$0:
        mov     t32, DWORD PTR [%ebp+16]
        inc     t32
        cmp     t2, t32
        jl      L$1
L$2:
        mov     t18, 8
        add     t18, DWORD PTR [%ebp+8]
        mov     t7, DWORD PTR [%ebp+16]
        mov     t31, t7
        add     t31, 1
        mov     t30, t31
        sal     t30, 2
        push    t30
        call    L_halloc
        add     %esp, 4
        mov     t8, %eax
        mov     DWORD PTR [t8], t7
        mov     t29, t8
        add     t29, 4
        mov     DWORD PTR [t18], t29
        mov     t2, 0
L$6:
        mov     t28, DWORD PTR [%ebp+16]
        inc     t28
        cmp     t2, t28
        jl      L$7
L$8:
        mov     t27, DWORD PTR [%ebp+8]
        mov     t11, DWORD PTR [t27+4]
        mov     t12, DWORD PTR [%ebp+16]
        cmp     t12, 0
        jl      L$14
L$12:
        cmp     t12, DWORD PTR [t11-4]
        jl      L$13
L$14:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t13, %eax
L$13:
        mov     t14, DWORD PTR [t12*4+t11]
        jmp     L$18
L$1:
        mov     t26, DWORD PTR [%ebp+8]
        mov     t5, DWORD PTR [t26+4]
        cmp     t2, 0
        jl      L$5
L$3:
        cmp     t2, DWORD PTR [t5-4]
        jl      L$4
L$5:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t6, %eax
L$4:
        mov     t25, t2
        sal     t25, 1
        mov     DWORD PTR [t2*4+t5], t25
        inc     t2
        jmp     L$0
L$10:
        mov     t24, t2
        sal     t24, 1
        mov     t23, t24
        inc     t23
        mov     DWORD PTR [t2*4+t9], t23
        inc     t2
        jmp     L$6
L$11:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t10, %eax
        jmp     L$10
L$7:
        mov     t22, DWORD PTR [%ebp+8]
        mov     t9, DWORD PTR [t22+8]
        cmp     t2, 0
        jl      L$11
L$9:
        cmp     t2, DWORD PTR [t9-4]
        jl      L$10
        jmp     L$11
L$18:
        mov     %eax, t14
        mov     %edi, t38
        mov     %esi, t37
        mov     %ebx, t36
        leave
        ret
