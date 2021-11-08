ENTRY(vector_start)
SECTIONS
{
    /* Reset Address */
    . = 0x0;

    /* text section - code */
    .text :
    {
        *(vector_start)
        *(.text .rodata)
    }
    /* data section - global variable */
    .data :
    {
        *(.data)
    }
    /* bss section - non initialized global variable */
    .bss :
    {
        *(.bss)
    }
}
