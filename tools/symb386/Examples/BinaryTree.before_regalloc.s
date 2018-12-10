        .intel_syntax
        .global Lmain
        .type Lmain, @function
Lmain:
        push    %ebp
        mov     %ebp, %esp
        mov     t95, %ebx
        mov     t96, %esi
        mov     t97, %edi
L$76:
        push    4
        call    L_halloc
        add     %esp, 4
        mov     t60, %eax
        push    t60
        call    LBT$Start
        add     %esp, 4
        mov     t61, %eax
        push    t61
        call    L_println_int
        add     %esp, 4
        mov     t0, %eax
        mov     t1, 0
L$77:
        mov     %eax, t1
        mov     %edi, t97
        mov     %esi, t96
        mov     %ebx, t95
        leave
        ret

        .global LBT$Start
        .type LBT$Start, @function
LBT$Start:
        push    %ebp
        mov     %ebp, %esp
        mov     t98, %ebx
        mov     t99, %esi
        mov     t100, %edi
L$78:
        push    24
        call    L_halloc
        add     %esp, 4
        mov     t2, %eax
        push    16
        push    t2
        call    LTree$Init
        add     %esp, 8
        mov     t3, %eax
        push    t2
        call    LTree$Print
        add     %esp, 4
        mov     t3, %eax
        push    100000000
        call    L_println_int
        add     %esp, 4
        mov     t5, %eax
        push    8
        push    t2
        call    LTree$Insert
        add     %esp, 8
        mov     t3, %eax
        push    t2
        call    LTree$Print
        add     %esp, 4
        mov     t3, %eax
        push    24
        push    t2
        call    LTree$Insert
        add     %esp, 8
        mov     t3, %eax
        push    4
        push    t2
        call    LTree$Insert
        add     %esp, 8
        mov     t3, %eax
        push    12
        push    t2
        call    LTree$Insert
        add     %esp, 8
        mov     t3, %eax
        push    20
        push    t2
        call    LTree$Insert
        add     %esp, 8
        mov     t3, %eax
        push    28
        push    t2
        call    LTree$Insert
        add     %esp, 8
        mov     t3, %eax
        push    14
        push    t2
        call    LTree$Insert
        add     %esp, 8
        mov     t3, %eax
        push    t2
        call    LTree$Print
        add     %esp, 4
        mov     t3, %eax
        push    24
        push    t2
        call    LTree$Search
        add     %esp, 8
        mov     t62, %eax
        push    t62
        call    L_println_int
        add     %esp, 4
        mov     t6, %eax
        push    12
        push    t2
        call    LTree$Search
        add     %esp, 8
        mov     t63, %eax
        push    t63
        call    L_println_int
        add     %esp, 4
        mov     t7, %eax
        push    16
        push    t2
        call    LTree$Search
        add     %esp, 8
        mov     t64, %eax
        push    t64
        call    L_println_int
        add     %esp, 4
        mov     t8, %eax
        push    50
        push    t2
        call    LTree$Search
        add     %esp, 8
        mov     t65, %eax
        push    t65
        call    L_println_int
        add     %esp, 4
        mov     t9, %eax
        push    12
        push    t2
        call    LTree$Search
        add     %esp, 8
        mov     t66, %eax
        push    t66
        call    L_println_int
        add     %esp, 4
        mov     t10, %eax
        push    12
        push    t2
        call    LTree$Delete
        add     %esp, 8
        mov     t3, %eax
        push    t2
        call    LTree$Print
        add     %esp, 4
        mov     t3, %eax
        push    12
        push    t2
        call    LTree$Search
        add     %esp, 8
        mov     t67, %eax
        push    t67
        call    L_println_int
        add     %esp, 4
        mov     t11, %eax
        mov     t12, 0
L$79:
        mov     %eax, t12
        mov     %edi, t100
        mov     %esi, t99
        mov     %ebx, t98
        leave
        ret

        .global LTree$Init
        .type LTree$Init, @function
LTree$Init:
        push    %ebp
        mov     %ebp, %esp
        mov     t105, %ebx
        mov     t106, %esi
        mov     t107, %edi
L$80:
        mov     t103, DWORD PTR [%ebp+8]
        mov     t104, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t103+12], t104
        mov     t102, DWORD PTR [%ebp+8]
        mov     DWORD PTR [t102+4], 0
        mov     t101, DWORD PTR [%ebp+8]
        mov     DWORD PTR [t101+8], 0
        mov     t13, 1
L$81:
        mov     %eax, t13
        mov     %edi, t107
        mov     %esi, t106
        mov     %ebx, t105
        leave
        ret

        .global LTree$SetRight
        .type LTree$SetRight, @function
LTree$SetRight:
        push    %ebp
        mov     %ebp, %esp
        mov     t110, %ebx
        mov     t111, %esi
        mov     t112, %edi
L$82:
        mov     t108, DWORD PTR [%ebp+8]
        mov     t109, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t108+20], t109
        mov     t14, 1
L$83:
        mov     %eax, t14
        mov     %edi, t112
        mov     %esi, t111
        mov     %ebx, t110
        leave
        ret

        .global LTree$SetLeft
        .type LTree$SetLeft, @function
LTree$SetLeft:
        push    %ebp
        mov     %ebp, %esp
        mov     t115, %ebx
        mov     t116, %esi
        mov     t117, %edi
L$84:
        mov     t113, DWORD PTR [%ebp+8]
        mov     t114, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t113+16], t114
        mov     t15, 1
L$85:
        mov     %eax, t15
        mov     %edi, t117
        mov     %esi, t116
        mov     %ebx, t115
        leave
        ret

        .global LTree$GetRight
        .type LTree$GetRight, @function
LTree$GetRight:
        push    %ebp
        mov     %ebp, %esp
        mov     t119, %ebx
        mov     t120, %esi
        mov     t121, %edi
L$86:
        mov     t118, DWORD PTR [%ebp+8]
        mov     t16, DWORD PTR [t118+20]
L$87:
        mov     %eax, t16
        mov     %edi, t121
        mov     %esi, t120
        mov     %ebx, t119
        leave
        ret

        .global LTree$GetLeft
        .type LTree$GetLeft, @function
LTree$GetLeft:
        push    %ebp
        mov     %ebp, %esp
        mov     t123, %ebx
        mov     t124, %esi
        mov     t125, %edi
L$88:
        mov     t122, DWORD PTR [%ebp+8]
        mov     t17, DWORD PTR [t122+16]
L$89:
        mov     %eax, t17
        mov     %edi, t125
        mov     %esi, t124
        mov     %ebx, t123
        leave
        ret

        .global LTree$GetKey
        .type LTree$GetKey, @function
LTree$GetKey:
        push    %ebp
        mov     %ebp, %esp
        mov     t127, %ebx
        mov     t128, %esi
        mov     t129, %edi
L$90:
        mov     t126, DWORD PTR [%ebp+8]
        mov     t18, DWORD PTR [t126+12]
L$91:
        mov     %eax, t18
        mov     %edi, t129
        mov     %esi, t128
        mov     %ebx, t127
        leave
        ret

        .global LTree$SetKey
        .type LTree$SetKey, @function
LTree$SetKey:
        push    %ebp
        mov     %ebp, %esp
        mov     t132, %ebx
        mov     t133, %esi
        mov     t134, %edi
L$92:
        mov     t130, DWORD PTR [%ebp+8]
        mov     t131, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t130+12], t131
        mov     t19, 1
L$93:
        mov     %eax, t19
        mov     %edi, t134
        mov     %esi, t133
        mov     %ebx, t132
        leave
        ret

        .global LTree$GetHas_Right
        .type LTree$GetHas_Right, @function
LTree$GetHas_Right:
        push    %ebp
        mov     %ebp, %esp
        mov     t136, %ebx
        mov     t137, %esi
        mov     t138, %edi
L$94:
        mov     t135, DWORD PTR [%ebp+8]
        mov     t20, DWORD PTR [t135+8]
L$95:
        mov     %eax, t20
        mov     %edi, t138
        mov     %esi, t137
        mov     %ebx, t136
        leave
        ret

        .global LTree$GetHas_Left
        .type LTree$GetHas_Left, @function
LTree$GetHas_Left:
        push    %ebp
        mov     %ebp, %esp
        mov     t140, %ebx
        mov     t141, %esi
        mov     t142, %edi
L$96:
        mov     t139, DWORD PTR [%ebp+8]
        mov     t21, DWORD PTR [t139+4]
L$97:
        mov     %eax, t21
        mov     %edi, t142
        mov     %esi, t141
        mov     %ebx, t140
        leave
        ret

        .global LTree$SetHas_Left
        .type LTree$SetHas_Left, @function
LTree$SetHas_Left:
        push    %ebp
        mov     %ebp, %esp
        mov     t145, %ebx
        mov     t146, %esi
        mov     t147, %edi
L$98:
        mov     t143, DWORD PTR [%ebp+8]
        mov     t144, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t143+4], t144
        mov     t22, 1
L$99:
        mov     %eax, t22
        mov     %edi, t147
        mov     %esi, t146
        mov     %ebx, t145
        leave
        ret

        .global LTree$SetHas_Right
        .type LTree$SetHas_Right, @function
LTree$SetHas_Right:
        push    %ebp
        mov     %ebp, %esp
        mov     t150, %ebx
        mov     t151, %esi
        mov     t152, %edi
L$100:
        mov     t148, DWORD PTR [%ebp+8]
        mov     t149, DWORD PTR [%ebp+12]
        mov     DWORD PTR [t148+8], t149
        mov     t23, 1
L$101:
        mov     %eax, t23
        mov     %edi, t152
        mov     %esi, t151
        mov     %ebx, t150
        leave
        ret

        .global LTree$Compare
        .type LTree$Compare, @function
LTree$Compare:
        push    %ebp
        mov     %ebp, %esp
        mov     t154, %ebx
        mov     t155, %esi
        mov     t156, %edi
L$102:
        mov     t24, 0
        mov     t25, DWORD PTR [%ebp+16]
        inc     t25
        mov     t153, DWORD PTR [%ebp+12]
        cmp     t153, DWORD PTR [%ebp+16]
        jl      L$3
L$4:
        cmp     DWORD PTR [%ebp+12], t25
        jl      L$0
L$1:
        mov     t24, 0
L$2:
L$5:
        mov     t26, t24
        jmp     L$103
L$0:
        mov     t24, 1
        jmp     L$2
L$3:
        mov     t24, 0
        jmp     L$5
L$103:
        mov     %eax, t26
        mov     %edi, t156
        mov     %esi, t155
        mov     %ebx, t154
        leave
        ret

        .global LTree$Insert
        .type LTree$Insert, @function
LTree$Insert:
        push    %ebp
        mov     %ebp, %esp
        mov     t157, %ebx
        mov     t158, %esi
        mov     t159, %edi
L$104:
        push    24
        call    L_halloc
        add     %esp, 4
        mov     t27, %eax
        push    DWORD PTR [%ebp+12]
        push    t27
        call    LTree$Init
        add     %esp, 8
        mov     t28, %eax
        mov     t31, DWORD PTR [%ebp+8]
        mov     t29, 1
L$6:
        cmp     t29, 0
        je      L$8
L$7:
        push    t31
        call    LTree$GetKey
        add     %esp, 4
        mov     t30, %eax
        cmp     DWORD PTR [%ebp+12], t30
        jl      L$15
L$16:
        push    t31
        call    LTree$GetHas_Right
        add     %esp, 4
        mov     t68, %eax
        cmp     t68, 0
        je      L$13
L$12:
        push    t31
        call    LTree$GetRight
        add     %esp, 4
        mov     t31, %eax
L$14:
L$17:
        jmp     L$6
L$10:
        mov     t29, 0
        push    1
        push    t31
        call    LTree$SetHas_Left
        add     %esp, 8
        mov     t28, %eax
        push    t27
        push    t31
        call    LTree$SetLeft
        add     %esp, 8
        mov     t28, %eax
L$11:
        jmp     L$17
L$13:
        mov     t29, 0
        push    1
        push    t31
        call    LTree$SetHas_Right
        add     %esp, 8
        mov     t28, %eax
        push    t27
        push    t31
        call    LTree$SetRight
        add     %esp, 8
        mov     t28, %eax
        jmp     L$14
L$15:
        push    t31
        call    LTree$GetHas_Left
        add     %esp, 4
        mov     t69, %eax
        cmp     t69, 0
        je      L$10
L$9:
        push    t31
        call    LTree$GetLeft
        add     %esp, 4
        mov     t31, %eax
        jmp     L$11
L$8:
        mov     t32, 1
L$105:
        mov     %eax, t32
        mov     %edi, t159
        mov     %esi, t158
        mov     %ebx, t157
        leave
        ret

        .global LTree$Delete
        .type LTree$Delete, @function
LTree$Delete:
        push    %ebp
        mov     %ebp, %esp
        mov     t160, %ebx
        mov     t161, %esi
        mov     t162, %edi
L$106:
        mov     t33, DWORD PTR [%ebp+8]
        mov     t34, DWORD PTR [%ebp+8]
        mov     t35, 1
        mov     t36, 0
        mov     t37, 1
L$18:
        cmp     t35, 0
        je      L$20
L$19:
        push    t33
        call    LTree$GetKey
        add     %esp, 4
        mov     t38, %eax
        cmp     DWORD PTR [%ebp+12], t38
        jl      L$37
L$38:
        cmp     t38, DWORD PTR [%ebp+12]
        jl      L$34
L$35:
        cmp     t37, 0
        je      L$32
L$31:
        push    t33
        call    LTree$GetHas_Right
        add     %esp, 4
        mov     t70, %eax
        cmp     t70, 0
        je      L$30
L$28:
        push    t33
        push    t34
        push    DWORD PTR [%ebp+8]
        call    LTree$Remove
        add     %esp, 12
        mov     t39, %eax
L$29:
L$33:
        mov     t36, 1
        mov     t35, 0
L$36:
L$39:
        mov     t37, 0
        jmp     L$18
L$20:
        mov     t40, t36
        jmp     L$107
L$21:
        mov     t34, t33
        push    t33
        call    LTree$GetLeft
        add     %esp, 4
        mov     t33, %eax
L$23:
        jmp     L$39
L$22:
        mov     t35, 0
        jmp     L$23
L$24:
        mov     t34, t33
        push    t33
        call    LTree$GetRight
        add     %esp, 4
        mov     t33, %eax
L$26:
        jmp     L$36
L$25:
        mov     t35, 0
        jmp     L$26
L$27:
        mov     t39, 1
        jmp     L$29
L$30:
        push    t33
        call    LTree$GetHas_Left
        add     %esp, 4
        mov     t71, %eax
        cmp     t71, 0
        je      L$27
        jmp     L$28
L$32:
        push    t33
        push    t34
        push    DWORD PTR [%ebp+8]
        call    LTree$Remove
        add     %esp, 12
        mov     t39, %eax
        jmp     L$33
L$34:
        push    t33
        call    LTree$GetHas_Right
        add     %esp, 4
        mov     t72, %eax
        cmp     t72, 0
        je      L$25
        jmp     L$24
L$37:
        push    t33
        call    LTree$GetHas_Left
        add     %esp, 4
        mov     t73, %eax
        cmp     t73, 0
        je      L$22
        jmp     L$21
L$107:
        mov     %eax, t40
        mov     %edi, t162
        mov     %esi, t161
        mov     %ebx, t160
        leave
        ret

        .global LTree$Remove
        .type LTree$Remove, @function
LTree$Remove:
        push    %ebp
        mov     %ebp, %esp
        mov     t163, %ebx
        mov     t164, %esi
        mov     t165, %edi
L$108:
        push    DWORD PTR [%ebp+16]
        call    LTree$GetHas_Left
        add     %esp, 4
        mov     t74, %eax
        cmp     t74, 0
        je      L$47
L$46:
        push    DWORD PTR [%ebp+16]
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+8]
        call    LTree$RemoveLeft
        add     %esp, 12
        mov     t41, %eax
L$48:
        mov     t44, 1
        jmp     L$109
L$40:
        push    0
        push    DWORD PTR [%ebp+12]
        call    LTree$SetHas_Left
        add     %esp, 8
        mov     t41, %eax
L$42:
L$45:
        jmp     L$48
L$41:
        push    0
        push    DWORD PTR [%ebp+12]
        call    LTree$SetHas_Right
        add     %esp, 8
        mov     t41, %eax
        jmp     L$42
L$43:
        push    DWORD PTR [%ebp+16]
        push    DWORD PTR [%ebp+12]
        push    DWORD PTR [%ebp+8]
        call    LTree$RemoveRight
        add     %esp, 12
        mov     t41, %eax
        jmp     L$45
L$44:
        push    DWORD PTR [%ebp+16]
        call    LTree$GetKey
        add     %esp, 4
        mov     t42, %eax
        push    DWORD PTR [%ebp+12]
        call    LTree$GetLeft
        add     %esp, 4
        mov     t76, %eax
        push    t76
        call    LTree$GetKey
        add     %esp, 4
        mov     t43, %eax
        push    t43
        push    t42
        push    DWORD PTR [%ebp+8]
        call    LTree$Compare
        add     %esp, 12
        mov     t77, %eax
        cmp     t77, 0
        je      L$41
        jmp     L$40
L$47:
        push    DWORD PTR [%ebp+16]
        call    LTree$GetHas_Right
        add     %esp, 4
        mov     t75, %eax
        cmp     t75, 0
        je      L$44
        jmp     L$43
L$109:
        mov     %eax, t44
        mov     %edi, t165
        mov     %esi, t164
        mov     %ebx, t163
        leave
        ret

        .global LTree$RemoveRight
        .type LTree$RemoveRight, @function
LTree$RemoveRight:
        push    %ebp
        mov     %ebp, %esp
        mov     t168, %ebx
        mov     t169, %esi
        mov     t170, %edi
L$49:
        push    DWORD PTR [%ebp+16]
        call    LTree$GetHas_Right
        add     %esp, 4
        mov     t78, %eax
        cmp     t78, 0
        je      L$51
L$50:
        mov     t81, DWORD PTR [%ebp+16]
        push    DWORD PTR [%ebp+16]
        call    LTree$GetRight
        add     %esp, 4
        mov     t79, %eax
        push    t79
        call    LTree$GetKey
        add     %esp, 4
        mov     t80, %eax
        push    t80
        push    t81
        call    LTree$SetKey
        add     %esp, 8
        mov     t45, %eax
        mov     t167, DWORD PTR [%ebp+16]
        mov     DWORD PTR [%ebp+12], t167
        push    DWORD PTR [%ebp+16]
        call    LTree$GetRight
        add     %esp, 4
        mov     t166, %eax
        mov     DWORD PTR [%ebp+16], t166
        jmp     L$49
L$51:
        push    0
        push    DWORD PTR [%ebp+12]
        call    LTree$SetHas_Right
        add     %esp, 8
        mov     t45, %eax
        mov     t46, 1
L$110:
        mov     %eax, t46
        mov     %edi, t170
        mov     %esi, t169
        mov     %ebx, t168
        leave
        ret

        .global LTree$RemoveLeft
        .type LTree$RemoveLeft, @function
LTree$RemoveLeft:
        push    %ebp
        mov     %ebp, %esp
        mov     t173, %ebx
        mov     t174, %esi
        mov     t175, %edi
L$52:
        push    DWORD PTR [%ebp+16]
        call    LTree$GetHas_Left
        add     %esp, 4
        mov     t82, %eax
        cmp     t82, 0
        je      L$54
L$53:
        mov     t85, DWORD PTR [%ebp+16]
        push    DWORD PTR [%ebp+16]
        call    LTree$GetLeft
        add     %esp, 4
        mov     t83, %eax
        push    t83
        call    LTree$GetKey
        add     %esp, 4
        mov     t84, %eax
        push    t84
        push    t85
        call    LTree$SetKey
        add     %esp, 8
        mov     t47, %eax
        mov     t172, DWORD PTR [%ebp+16]
        mov     DWORD PTR [%ebp+12], t172
        push    DWORD PTR [%ebp+16]
        call    LTree$GetLeft
        add     %esp, 4
        mov     t171, %eax
        mov     DWORD PTR [%ebp+16], t171
        jmp     L$52
L$54:
        push    0
        push    DWORD PTR [%ebp+12]
        call    LTree$SetHas_Left
        add     %esp, 8
        mov     t47, %eax
        mov     t48, 1
L$111:
        mov     %eax, t48
        mov     %edi, t175
        mov     %esi, t174
        mov     %ebx, t173
        leave
        ret

        .global LTree$Search
        .type LTree$Search, @function
LTree$Search:
        push    %ebp
        mov     %ebp, %esp
        mov     t176, %ebx
        mov     t177, %esi
        mov     t178, %edi
L$112:
        mov     t51, DWORD PTR [%ebp+8]
        mov     t49, 1
        mov     t50, 0
L$55:
        cmp     t49, 0
        je      L$57
L$56:
        push    t51
        call    LTree$GetKey
        add     %esp, 4
        mov     t52, %eax
        cmp     DWORD PTR [%ebp+12], t52
        jl      L$67
L$68:
        cmp     t52, DWORD PTR [%ebp+12]
        jl      L$64
L$65:
        mov     t50, 1
        mov     t49, 0
L$66:
L$69:
        jmp     L$55
L$57:
        mov     t53, t50
        jmp     L$113
L$58:
        push    t51
        call    LTree$GetLeft
        add     %esp, 4
        mov     t51, %eax
L$60:
        jmp     L$69
L$59:
        mov     t49, 0
        jmp     L$60
L$61:
        push    t51
        call    LTree$GetRight
        add     %esp, 4
        mov     t51, %eax
L$63:
        jmp     L$66
L$62:
        mov     t49, 0
        jmp     L$63
L$64:
        push    t51
        call    LTree$GetHas_Right
        add     %esp, 4
        mov     t86, %eax
        cmp     t86, 0
        je      L$62
        jmp     L$61
L$67:
        push    t51
        call    LTree$GetHas_Left
        add     %esp, 4
        mov     t87, %eax
        cmp     t87, 0
        je      L$59
        jmp     L$58
L$113:
        mov     %eax, t53
        mov     %edi, t178
        mov     %esi, t177
        mov     %ebx, t176
        leave
        ret

        .global LTree$Print
        .type LTree$Print, @function
LTree$Print:
        push    %ebp
        mov     %ebp, %esp
        mov     t179, %ebx
        mov     t180, %esi
        mov     t181, %edi
L$114:
        mov     t54, DWORD PTR [%ebp+8]
        push    t54
        push    DWORD PTR [%ebp+8]
        call    LTree$RecPrint
        add     %esp, 8
        mov     t55, %eax
        mov     t56, 1
L$115:
        mov     %eax, t56
        mov     %edi, t181
        mov     %esi, t180
        mov     %ebx, t179
        leave
        ret

        .global LTree$RecPrint
        .type LTree$RecPrint, @function
LTree$RecPrint:
        push    %ebp
        mov     %ebp, %esp
        mov     t182, %ebx
        mov     t183, %esi
        mov     t184, %edi
L$116:
        push    DWORD PTR [%ebp+12]
        call    LTree$GetHas_Left
        add     %esp, 4
        mov     t88, %eax
        cmp     t88, 0
        je      L$71
L$70:
        mov     t90, DWORD PTR [%ebp+8]
        push    DWORD PTR [%ebp+12]
        call    LTree$GetLeft
        add     %esp, 4
        mov     t89, %eax
        push    t89
        push    t90
        call    LTree$RecPrint
        add     %esp, 8
        mov     t57, %eax
L$72:
        push    DWORD PTR [%ebp+12]
        call    LTree$GetKey
        add     %esp, 4
        mov     t91, %eax
        push    t91
        call    L_println_int
        add     %esp, 4
        mov     t58, %eax
        push    DWORD PTR [%ebp+12]
        call    LTree$GetHas_Right
        add     %esp, 4
        mov     t92, %eax
        cmp     t92, 0
        je      L$74
L$73:
        mov     t94, DWORD PTR [%ebp+8]
        push    DWORD PTR [%ebp+12]
        call    LTree$GetRight
        add     %esp, 4
        mov     t93, %eax
        push    t93
        push    t94
        call    LTree$RecPrint
        add     %esp, 8
        mov     t57, %eax
L$75:
        mov     t59, 1
        jmp     L$117
L$71:
        mov     t57, 1
        jmp     L$72
L$74:
        mov     t57, 1
        jmp     L$75
L$117:
        mov     %eax, t59
        mov     %edi, t184
        mov     %esi, t183
        mov     %ebx, t182
        leave
        ret
