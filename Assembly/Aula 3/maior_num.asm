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
    STD_IN  equ 0x0
    STD_OUT equ 0x1

section .data
    ;db: 1 byte      define byte (8bits)
    ;dw: 2 bytes     define word (16bits)
    ;dd: 4 bytes     define double word (32bits)
    ;dq: 8 bytes     define quad word (64bits)
    ;dt: 10 bytes    define ten word (80bits)

    x dd 10
    y dd 50
    msg1 db 'X maior que Y', LF, LF, NULL
    tam1 equ $- msg1 ;tamanho logo em seguida, se nao ele pega o tamanho das duas msg

    msg2 db 'Y maior que X', LF, LF, NULL
    tam2 equ $- msg2 

section .text

global _start

_start:
    mov eax, DWORD[x]
    mov ebx, DWORD[y]

    ; if
    cmp eax, ebx
    ; SALTOS CONDICIONAIS
    ;je ==      jump if equal
    ;jg >       jump if not equal
    ;jge >=     jump if greater
    ;jl <       jump if greater or equal
    ;jle <=     jump if less
    ;jne !=     jump if less or equal

    ;SALTO INCONDICIONAL
    ;jmp        jump

    jg maior ;se eax > ebx então salta para maior

    mov ecx, msg2
    mov edx, tam2

    jmp final  ; pula para finalizar o programa


    maior:
        mov ecx, msg1
        mov edx, tam1

    
    final:
        mov eax, SYS_WRITE
        mov ebx, STD_OUT
        int SYS_CALL

        mov eax, SYS_EXIT
        mov ebx, RET_EXIT
        int SYS_CALL