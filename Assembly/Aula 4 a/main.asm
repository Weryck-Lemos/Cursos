%include 'biblioteca.inc'

section .text

global _start

_start:
    lea esi, [BUFFER] ; load effective address (esi é um ponteiro) 
    add esi, 0x9
    mov byte[esi], 0xA

    dec esi ;realoca o ponteiro
    mov dl, 0x13 ;0x11=='C'
    add dl, '0' ;converter 0x11 para caractere (+= '0')
    mov [esi] ,dl

    dec esi
    mov dl, 0x12 ;B
    add dl, '0'
    mov [esi], dl

    dec esi
    mov dl, 0x12 ;B
    add dl, '0'
    mov [esi], dl

    dec esi
    mov dl, 0x11 ;A
    add dl, '0'
    mov [esi], dl

    call saidaResultado

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL
