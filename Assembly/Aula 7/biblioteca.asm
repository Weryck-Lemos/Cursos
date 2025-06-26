section .data
    LF  equ 0xA
    NULL equ 0xD

    SYS_EXIT equ 0x1
    RET_EXIT equ 0x0

    STD_IN equ 0x0
    STD_OUT  equ 0x1
    SYS_READ equ 0x3
    SYS_WRITE equ 0x4

    SYS_CALL equ 0x80
    tam_buffer equ 0xA

segment .bss
    buffer resb 0x1

segment .text
;------Converte String para Int--------;
    string_to_int:
        xor ebx, ebx
    
    .prox_digito:
        movzx eax, byte[esi]
        inc esi
        sub al, '0'
        imul ebx, 0xA
        add ebx, eax   ; ebx = ebx*10 +eax
        loop .prox_digito   ;while(ecx--)
        mov eax, ebx
        ret

;-----Converte Int para String-------;
    into_to_string:
        lea esi, [buffer]
        add esi, 0x9
        mov byte[esi], 0xA
        mov ebx, 0xA
    
    .prox_digito:
        xor edx, edx
        div ebx
        add dl, '0'
        mov [esi], dl
        cmp eax, 0
        jnz .prox_digito
        ret
    
;--------------Saida----------------;
    saidaResultado:
        mov eax, SYS_WRITE
        mov ebx, STD_OUT
        mov ecx, buffer
        mov edx, tam_buffer
        int SYS_CALL
    ret


