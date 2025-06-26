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

segment .text
    ;-----------------------------------------
    ;      Saida no terminal da String
    ;-----------------------------------------
    mst_saida:
        call tamStr
        mov eax, SYS_WRITE
        mov ebx, STD_OUT
        int SYS_CALL
        ret

    ;-----------------------------------------
    ;      Calcular o tamanho da String
    ;-----------------------------------------
    ;      Entrada: valor da string em ecx
    ;      Saida: tamanho da string em edx
    ;-----------------------------------------

    tamStr:
        mov edx, ecx
    proxchar:
        cmp byte[edx], NULL ; comparar se o byte é nulo
        jz terminei         ; jump if zero
        inc edx
        jmp proxchar
    terminei:
        sub edx, ecx
        ret