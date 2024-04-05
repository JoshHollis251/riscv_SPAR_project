/* Define the stack size */
_stack_size = 0x1000; /* Example: 4KB stack */

/* Set the top of the stack to the end of the dual-port RAM */
_stack_end = 0xC0004000; 
_stack_start = _stack_end - _stack_size;

MEMORY
{
    ROM (rx)  : ORIGIN = 0x00100000, LENGTH = 0x1FFFF
    RAM (rwx) : ORIGIN = 0xC0000000, LENGTH = 0x4000
}

SECTIONS 
{
    .init : ALIGN(4K)
    {
        KEEP(*(.init))
    } > ROM
    .text.startup : ALIGN(4K)
    {
        *(.text.startup)
    } > ROM

    .text : ALIGN(4K)
    {
        *(.text)
    } > ROM

    .rodata : ALIGN(4K)
    {
        *(.rodata)
    } > ROM

    .data : ALIGN(4K)
    {
        *(.data)
    } > ROM

    .bss : ALIGN(4K)
    {
        *(COMMON)
        *(.bss)
    } > RAM
    .stack (NOLOAD) : ALIGN(4K)
    {
        . = ALIGN(4);
        . += _stack_size;
        . = ALIGN(4);
    } > RAM
}

PROVIDE(_estack = _stack_end);
