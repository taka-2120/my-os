global loader

extern kmain

MAGIC_NUMBER        equ 0x1BADB002
FLAGS               equ 0x00000001
CHECKSUM            equ -(MAGIC_NUMBER + FLAGS)
KERNEL_STACK_SIZE   equ 4096


section .bss
align 4
kernel_stack:
    resb KERNEL_STACK_SIZE


section .text:
align 4
    dd MAGIC_NUMBER
    dd FLAGS
    dd CHECKSUM


mov esp, kernel_stack + KERNEL_STACK_SIZE

loader:
    mov eax, 0xCAFEBABE
    mov esp, kernel_stack + KERNEL_STACK_SIZE

    extern sum_of_three

    push dword 3
    push dword 2
    push dword 1
    call sum_of_three

.loop:
    jmp .loop