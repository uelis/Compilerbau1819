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
        push    12
        call    L_halloc
        add     %esp, 4
        mov     t4, %eax
        push    10
        push    t4
        call    LF$compute
        add     %esp, 8
        mov     t5, %eax
        push    t5
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

        .global LF$compute
        .type LF$compute, @function
LF$compute:
        push    %ebp
        mov     %ebp, %esp
        mov     t12, %ebx
        mov     t13, %esi
        mov     t14, %edi
L$5:
        cmp     DWORD PTR [%ebp+12], 1
        jl      L$0
L$1:
        mov     t7, DWORD PTR [%ebp+12]
        mov     t11, DWORD PTR [%ebp+12]
        dec     t11
        push    t11
        push    DWORD PTR [%ebp+8]
        call    LF$compute
        add     %esp, 8
        mov     t6, %eax
        mov     %eax, t7
        imul    t6
        mov     t2, %eax
L$2:
        mov     t3, t2
        jmp     L$6
L$0:
        mov     t2, 1
        jmp     L$2
L$6:
        mov     %eax, t3
        mov     %edi, t14
        mov     %esi, t13
        mov     %ebx, t12
        leave
        ret
