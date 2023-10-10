.arch armv7-a
.section .data
num:
    .word 0
fact:
    .word 1
fmt_in:
    .asciz "%d"
fmt_out:
    .asciz "%d\n"

.section .text
.global main
main:
    @ 保存寄存器
    push {r4, lr}

    @ 读取输入
    ldr r0, =fmt_in
    ldr r1, =num
    bl scanf

    @ 初始化循环计数器
    mov r2, #1

loop:
    @ 检查循环条件
    ldr r3, =num
   
    ldr r3,[r3]
    cmp r2, r3
    bgt done

    @ 计算阶乘
    ldr r3, =fact
    ldr r4, [r3]
    mul r4, r4, r2
    str r4, [r3]

    @ 递增计数器
    add r2, r2, #1
    b loop

done:
    @ 打印结果
    ldr r0, =fmt_out
    ldr r1, =fact
    ldr r1,[r1]
    bl printf

    @ 恢复寄存器并退出
    pop {r4, pc}
