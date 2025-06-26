segment .data
    LF equ 0xA
    NULL equ 0xD
    SYS_CALL equ 0x80

    ;EAX
    SYS_EXIT equ 0x1
    SYS_READ equ 0x3
    SYS_WRITE equ 0x4

    ;EBX
    RET_EXIT equ 0x0
    STD_IN equ 0x0
    STD_OUT equ 0x1

    TAM_BUFFER equ 0xA

segment .bss
    BUFFER resb 10

segment .text

saidaResultado:
    ;jump ->GOTO vai para algum ponto e nao volta
    ;call ->GOSUB vai para um ponto, acha o ret e depois retorna
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, BUFFER
    mov edx, TAM_BUFFER
    int SYS_CALL
    ret