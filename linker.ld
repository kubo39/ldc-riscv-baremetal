OUTPUT_ARCH("riscv")

ENTRY(_start)

SECTIONS
{
    . = 0x80000000;

    .text :
    {
        KEEP(*(.init));
        *(.text .text.*);
    }

    .rodata : ALIGN(4)
    {
        *(.rodata .rodata.*);
    }

    .data : ALIGN(4)
    {
        *(.data .data.*);
    }

    .bss : ALIGN(4)
    {
        *(.bss .bss.*);
    }
}
