.section .init
.globl _start
_start:
    lui sp, %hi(_estack)
    addi sp, sp, %lo(_estack)
    call main
