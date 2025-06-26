section .data
    LF          equ 0xA
    NULL        equ 0x0
    SYS_CALL    equ 0x80

    ;EAX
    SYS_EXIT    equ 0x1
    SYS_READ    equ 0x3
    SYS_WRITE   equ 0x4

    ;EBX
    RET_EXIT    equ 0x0
    STD_IN      equ 0x0
    STD_OUT     equ 0x1

    tam_buffer equ 0xA

section .bss
    buffer     resb 0x4

section .text
    
    int_to_string:
        lea esi, [buffer]
        add esi, 0x9
        mov byte[esi], 0xA
        mov ebx, 0xA

    .prox_digito:
        xor edx,edx
        div ebx
        add dl,'0'
        dec esi
        mov [esi], dl
        cmp eax, 0
        jnz .prox_digito
        ret

    saidaResultado:
        mov eax, SYS_WRITE
        mov ebx, STD_OUT
        mov ecx, buffer
        mov edx, tam_buffer
        int SYS_CALL
        ret
