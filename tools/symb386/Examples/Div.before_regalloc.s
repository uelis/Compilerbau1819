        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t2, %ebx
        mov     t3, %esi
        mov     t4, %edi
L$0:
        push    50
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$1:
        mov     %eax, t1
        mov     %edi, t4
        mov     %esi, t3
        mov     %ebx, t2
        leave
        ret
