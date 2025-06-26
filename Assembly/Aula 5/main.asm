%include 'biblioteca.asm'

section .data
    tit    db LF, '+-------------------+', LF, '|    Calculadora    |', LF, '+-------------------+', LF, NULL
    obVal1 db LF, 'Valor 1: ',                NULL
    obVal2 db LF, 'Valor 2: ',                NULL
    opc1   db LF, '1. Adicionar',             NULL
    opc2   db LF, '2. Subtrair',              NULL
    opc3   db LF, '3. Multiplicar',           NULL
    opc4   db LF, '4. Dividir',               NULL
    msgopc db LF, 'Deseja realizar?: ',       NULL
    msgErro db LF, 'Valor de Opção Inválido', NULL
    p1 db LF, 'Processo de Adicionar',        NULL
    p2 db LF, 'Processo de Subtrair',         NULL
    p3 db LF, 'Processo de Multiplicar',      NULL
    p4 db LF, 'Processo de Dividir',          NULL
    msgfim db LF, 'Teminei',LF,               NULL

section .bss
    opc  resb 1
    num1 resb 1
    num2 resb 1

section .text
    global _start

_start:
    mov ecx, tit
    call mst_saida

    ;mostra opções
    mov ecx, opc1
    call mst_saida
    mov ecx, opc2
    call mst_saida
    mov ecx, opc3
    call mst_saida
    mov ecx, opc4
    call mst_saida

    ;obter opção
    mov ecx, msgopc
    call mst_saida
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, opc
    mov edx, 0x2
    int SYS_CALL

    ;converter e ir para o ponto correto
    mov ah, [opc]
    sub ah, '0'

    cmp ah, 4
    jg msterro
    cmp ah, 1
    jl msterro

    ;obter valores
    mov ecx, obVal1
    call mst_saida
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, num1
    mov edx, 0x3
    int SYS_CALL

    mov ecx, obVal2
    call mst_saida
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, num2
    mov edx, 0x3
    int SYS_CALL

    ;selecionar o ponto
    mov ah, [opc]
    sub ah, '0' 
        
    cmp ah, 1
    je adicionar
    cmp ah, 2
    je subtrair
    cmp ah, 3
    je multiplicar
    cmp ah, 4
    je dividir




saida: 
    mov ecx, msgfim
    call mst_saida

    mov eax, SYS_EXIT
    xor ebx, ebx
    int SYS_CALL 


;Funções à serem realizadas
adicionar:
    mov ecx, p1
    call mst_saida
    jmp saida

subtrair:
    mov ecx, p2
    call mst_saida
    jmp saida

multiplicar:
    mov ecx, p3
    call mst_saida
    jmp saida

dividir:
    mov ecx, p4
    call mst_saida
    jmp saida

msterro:
    mov ecx, msgErro
    call mst_saida
    jmp saida
