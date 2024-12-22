.intel_syntax noprefix
.code16

.global _start

_start:
    mov si, offset msg
    mov ah, 0x00
    mov al, 0x0D
    int 0x10

    mov ah, 0x0E
    mov bl, 0x0C
print_char:
    lodsb
    cmp al, 0
    je done
    int 0x10
    jmp print_char
done:
    hlt
msg: .string "Hello world!"
.fill 510-(.-_start), 1, 0
.word 0xAA55
