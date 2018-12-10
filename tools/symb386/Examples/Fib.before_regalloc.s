        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t9, %ebx
        mov     t10, %esi
        mov     t11, %edi
L$3:
        push    4
        call    L_halloc
        add     %esp, 4
        mov     t4, %eax
        push    20
        push    t4
        call    LFibClass$nfib
        add     %esp, 8
        mov     t5, %eax
        push    t5
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$4:
        mov     %eax, t1
        mov     %edi, t11
        mov     %esi, t10
        mov     %ebx, t9
        leave
        ret

        .global LFibClass$nfib
        .type LFibClass$nfib, @function
LFibClass$nfib:
        push    %ebp
        mov     %ebp, %esp
        mov     t15, %ebx
        mov     t16, %esi
        mov     t17, %edi
L$5:
        cmp     DWORD PTR [%ebp+12], 2
        jl      L$0
L$1:
        mov     t14, DWORD PTR [%ebp+12]
        dec     t14
        push    t14
        push    DWORD PTR [%ebp+8]
        call    LFibClass$nfib
        add     %esp, 8
        mov     t6, %eax
        mov     t8, t6
        mov     t13, -2
        add     t13, DWORD PTR [%ebp+12]
        push    t13
        push    DWORD PTR [%ebp+8]
        call    LFibClass$nfib
        add     %esp, 8
        mov     t7, %eax
        mov     t12, t8
        add     t12, t7
        mov     t2, t12
        inc     t2
L$2:
        mov     t3, t2
        jmp     L$6
L$0:
        mov     t2, 1
        jmp     L$2
L$6:
        mov     %eax, t3
        mov     %edi, t17
        mov     %esi, t16
        mov     %ebx, t15
        leave
        ret
