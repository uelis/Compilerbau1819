        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t13, %ebx
        mov     t14, %esi
        mov     t15, %edi
L$0:
        push    4
        call    L_halloc
        add     %esp, 4
        mov     t6, %eax
        push    t6
        call    LEffectsClass$run
        add     %esp, 4
        mov     t7, %eax
        push    t7
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$1:
        mov     %eax, t1
        mov     %edi, t15
        mov     %esi, t14
        mov     %ebx, t13
        leave
        ret

        .global LEffectsClass$run
        .type LEffectsClass$run, @function
LEffectsClass$run:
        push    %ebp
        mov     %ebp, %esp
        mov     t18, %ebx
        mov     t19, %esi
        mov     t20, %edi
L$2:
        push    8
        call    L_halloc
        add     %esp, 4
        mov     t2, %eax
        push    1
        push    t2
        call    LBit$set
        add     %esp, 8
        mov     t8, %eax
        mov     t12, t8
        dec     t12
        push    0
        push    t2
        call    LBit$set
        add     %esp, 8
        mov     t9, %eax
        mov     t11, t9
        push    t2
        call    LBit$value
        add     %esp, 4
        mov     t10, %eax
        mov     t17, t10
        neg     t17
        mov     t16, t11
        sub     t16, t17
        mov     t3, t12
        sub     t3, t16
L$3:
        mov     %eax, t3
        mov     %edi, t20
        mov     %esi, t19
        mov     %ebx, t18
        leave
        ret

        .global LBit$set
        .type LBit$set, @function
LBit$set:
        push    %ebp
        mov     %ebp, %esp
        mov     t23, %ebx
        mov     t24, %esi
        mov     t25, %edi
L$4:
        mov     t21, DWORD PTR [%ebp+8]
        mov     t22, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t21+4], t22
        mov     t4, DWORD PTR [%ebp+12]
L$5:
        mov     %eax, t4
        mov     %edi, t25
        mov     %esi, t24
        mov     %ebx, t23
        leave
        ret

        .global LBit$value
        .type LBit$value, @function
LBit$value:
        push    %ebp
        mov     %ebp, %esp
        mov     t27, %ebx
        mov     t28, %esi
        mov     t29, %edi
L$6:
        mov     t26, DWORD PTR [%ebp+8]
        mov     t5, DWORD PTR [t26+4]
L$7:
        mov     %eax, t5
        mov     %edi, t29
        mov     %esi, t28
        mov     %ebx, t27
        leave
        ret
