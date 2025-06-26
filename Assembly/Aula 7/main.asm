%include 'biblioteca.asm'

section .data

    msg      db    'Entre com um valor de 3 digitos: ', LF, NULL
    tam      equ    $- msg
    parMsg   db    'Número par!', LF, NULL
    tamPar   equ    $- parMsg
    imparMsg db    'Numero ímpar!', LF, NULL
    tamImpar equ    $- imparMsg

section .bss
    num resb 1

section .text

global _start

_start:

    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, tam
    int SYS_CALL

    entrada_valor:
        mov eax, SYS_READ
        mov ebx, STD_IN
        mov ecx, num
        mov edx, 0x4
        int SYS_CALL

        lea esi, [num]
        mov ecx, 0x3
        call string_to_int

verificar:
    xor edx, edx
    mov ebx, 0x2
    div ebx
    cmp edx, 0
    jz mostra_par

mostrar_impar:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, imparMsg
    mov edx, tamImpar
    int SYS_CALL
    jmp saida

mostra_par:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, parMsg
    mov edx, tamPar
    int SYS_CALL
    jmp saida

saida:
    mov eax, 0x1
    xor ebx,ebx
    int 0x80