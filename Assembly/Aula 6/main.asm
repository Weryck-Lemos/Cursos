%include 'biblioteca.asm'

section .data
            ; 4  8  12 16 18
    array: dd 10,20,30,40,50
    ;como é dd ele armazena de 4 em 4 bytes

section .text

global _start

_start:
    ;multiplicao pela posicao do array
    mov eax, [array + 4*2] 
    call int_to_string
    call saidaResultado

    mov eax, SYS_EXIT
    xor ebx,ebx
    int SYS_CALL