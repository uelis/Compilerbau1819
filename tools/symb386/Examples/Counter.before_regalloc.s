        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t8, %ebx
        mov     t9, %esi
        mov     t10, %edi
L$3:
        push    8
        call    L_halloc
        add     %esp, 4
        mov     t6, %eax
        push    5
        push    0
        push    t6
        call    LCounterClass$f
        add     %esp, 12
        mov     t7, %eax
        push    t7
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$4:
        mov     %eax, t1
        mov     %edi, t10
        mov     %esi, t9
        mov     %ebx, t8
        leave
        ret

        .global LCounterClass$getValue
        .type LCounterClass$getValue, @function
LCounterClass$getValue:
        push    %ebp
        mov     %ebp, %esp
        mov     t12, %ebx
        mov     t13, %esi
        mov     t14, %edi
L$5:
        mov     t11, DWORD PTR [%ebp+8]
        mov     t2, DWORD PTR [t11+4]
L$6:
        mov     %eax, t2
        mov     %edi, t14
        mov     %esi, t13
        mov     %ebx, t12
        leave
        ret

        .global LCounterClass$f
        .type LCounterClass$f, @function
LCounterClass$f:
        push    %ebp
        mov     %ebp, %esp
        mov     t17, %ebx
        mov     t18, %esi
        mov     t19, %edi
L$7:
        mov     t3, 0
        cmp     DWORD PTR [%ebp+16], 1
        jl      L$0
L$1:
        mov     t16, DWORD PTR [%ebp+12]
        add     t16, DWORD PTR [%ebp+16]
        mov     t15, DWORD PTR [%ebp+16]
        dec     t15
        push    t15
        push    t16
        push    DWORD PTR [%ebp+8]
        call    LCounterClass$f
        add     %esp, 12
        mov     t4, %eax
L$2:
        mov     t5, t4
        jmp     L$8
L$0:
        mov     t4, t3
        jmp     L$2
L$8:
        mov     %eax, t5
        mov     %edi, t19
        mov     %esi, t18
        mov     %ebx, t17
        leave
        ret
