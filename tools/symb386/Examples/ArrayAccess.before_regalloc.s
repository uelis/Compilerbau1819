        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t11, %ebx
        mov     t12, %esi
        mov     t13, %edi
L$6:
        push    4
        call    L_halloc
        add     %esp, 4
        mov     t9, %eax
        push    t9
        call    LAA$run
        add     %esp, 4
        mov     t10, %eax
        push    t10
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$7:
        mov     %eax, t1
        mov     %edi, t13
        mov     %esi, t12
        mov     %ebx, t11
        leave
        ret

        .global LAA$run
        .type LAA$run, @function
LAA$run:
        push    %ebp
        mov     %ebp, %esp
        mov     t16, %ebx
        mov     t17, %esi
        mov     t18, %edi
L$8:
        mov     t3, 2
        mov     t15, t3
        add     t15, 1
        mov     t14, t15
        sal     t14, 2
        push    t14
        call    L_halloc
        add     %esp, 4
        mov     t4, %eax
        mov     DWORD PTR [t4], t3
        mov     t2, t4
        add     t2, 4
        cmp     DWORD PTR [t2-4], 0
        jg      L$0
L$1:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t5, %eax
L$0:
        mov     DWORD PTR [t2], 5
        cmp     DWORD PTR [t2-4], 1
        jg      L$2
L$3:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t6, %eax
L$2:
        mov     DWORD PTR [t2+4], 10
        cmp     DWORD PTR [t2-4], 0
        jg      L$4
L$5:
        push    0
        call    L_raise
        add     %esp, 4
        mov     t7, %eax
L$4:
        mov     t8, DWORD PTR [t2]
L$9:
        mov     %eax, t8
        mov     %edi, t18
        mov     %esi, t17
        mov     %ebx, t16
        leave
        ret
