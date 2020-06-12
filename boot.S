    .section .init, "ax"
    .global _start

_start:
    lui sp, %hi(stacks + 1024)
    ori sp, sp, %lo(stacks + 1024)
    j __start_ldc

    .global stacks
stacks:
    .skip 1024
