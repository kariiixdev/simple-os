.intel_syntax noprefix
.code16

.section .text
.global _start

_start:
    mov ah, 0x0E
    mov al, 'A'
    mov bx, 0
    int 0x10

    jmp .

.fill 510-(.-_start), 1, 0
.word 0xAA55
