        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t6, %ebx
        mov     t7, %esi
        mov     t8, %edi
L$4:
        push    4
        call    L_halloc
        add     %esp, 4
        mov     t4, %eax
        push    10
        push    5
        push    t4
        call    LB$run
        add     %esp, 12
        mov     t5, %eax
        push    t5
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$5:
        mov     %eax, t1
        mov     %edi, t8
        mov     %esi, t7
        mov     %ebx, t6
        leave
        ret

        .global LB$run
        .type LB$run, @function
LB$run:
        push    %ebp
        mov     %ebp, %esp
        mov     t14, %ebx
        mov     t15, %esi
        mov     t16, %edi
L$6:
        mov     t13, 0
        cmp     t13, 1
        jl      L$3
L$1:
        mov     t2, DWORD PTR [%ebp+16]
L$2:
        mov     t3, t2
        jmp     L$7
L$0:
        mov     t2, DWORD PTR [%ebp+12]
        jmp     L$2
L$3:
        mov     t12, DWORD PTR [%ebp+12]
        add     t12, DWORD PTR [%ebp+16]
        mov     %eax, t12
        imul    DWORD PTR [%ebp+16]
        mov     t10, %eax
        mov     %eax, DWORD PTR [%ebp+16]
        imul    DWORD PTR [%ebp+16]
        mov     t11, %eax
        mov     t9, DWORD PTR [%ebp+12]
        add     t9, t11
        cmp     t9, t10
        jl      L$0
        jmp     L$1
L$7:
        mov     %eax, t3
        mov     %edi, t16
        mov     %esi, t15
        mov     %ebx, t14
        leave
        ret
