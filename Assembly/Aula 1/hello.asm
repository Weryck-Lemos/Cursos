; Executar
; nasm -f elf64 hello.asm

;Linkeditar - Transformar o programa em linguagem de máquina para um executável
; ld -s -o hello hello.o

section .data ;constantes
    msg: db "Hello World!", 0xA  
    ;0xA == "\n"
    tam equ $- msg ;tamanho mensagem

section .text

global _start

_start:
    ;eax chama SO e ebx, exc e edx são os parâmetros 
    mov eax, 0x4  ;chamada do syscall
    mov ebx, 0x1 ;stdout - tela
    mov ecx, msg  ;endereço da mensagem
    mov edx, tam ;quantidade de bytes
    int 0x80 

    mov eax, 0x1 ;syscall exit
    mov ebx, 0x0 ;codigo de saida 0 (sucesso)
    int 0x80 