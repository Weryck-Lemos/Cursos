segment .data
    LF equ 0xA         ; Line feed
    NULL equ 0xD       ; Ponteiro para final da String
    SYS_CALL equ 0x80  ; Envia informação ao SO

    ;EAX
    SYS_EXIT equ 0x1  ; Codigo de chamada para finalizar
    SYS_READ equ 0x3  ; Operecao de leitura
    SYS_WRITE equ 0x4 ; Operacao de escrita

    ;EBX
    RET_EXIT equ 0x0 ; Operacao realizada com sucesso
    STD_IN equ 0x0   ; Entrada padrão
    STD_OUT equ 0x1  ; Saida padrao

section .data ;constantes
msg db "Entre com seu nome: ", LF, NULL
tam equ $- msg

section .bss ;modificáveis
    nome resb 1

section .text

global _start

_start:
    mov eax, SYS_WRITE 
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, tam
    int SYS_CALL

    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, nome
    mov edx, 0xA ;colocamos tamanho de 10
    int SYS_CALL    

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL