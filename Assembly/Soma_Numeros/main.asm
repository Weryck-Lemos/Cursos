%include 'biblioteca.inc'

section .data
    v1 db '105'
    v2 db '225', LF NULL

section .bss
    soma resd 1

section .text

global _start

_start:
    ;converte v1 para inteiro
    lea esi, [v1]    ;carrega o endereco da string "105"
    mov ecx, 3       ;comprimento de "105"
    call string_to_int
    mov [soma], eax    ;armazena o resultado

    ;converter v2 para inteiro
    lea esi, [v2]      ;carrega o endereco da string "225"
    mov ecx, 3         ;comprimento de "225"
    call string_to_int
    add [soma], eax     ; soma com o valor de v1

    ;mostrar resultado
    mov eax, [soma]
    call int_to_string
    call saidaResultado

    ; encerrar
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL
;-------------------------------
;      String para Inteiro
;-------------------------------
; Entrada: ESI (valor conv)  ECX (tam)
; Saida: EAX
;-------------------------------
string_to_int:
    xor ebx, ebx  ;EBX = 0
.prox_digito:
    movzx eax, byte[esi]
    inc esi ;avanca o ponteiro
    sub al,'0' ;converte
    imul ebx, 10 ;multiplica o acumulador por 10
    add ebx, eax ;soma o novo digito ao acumuludaor 
    loop .prox_digito ;while(--ecx) se ecx !=0, pula para .prox_digito
    mov eax, ebx ;move o resultado final para eax
    ret

;-------------------------------
;      Inteiro para String
;-------------------------------
; Entrada: inteiro em EAX
; Saida: BUFFER (valor ECX) TAM_BUFFER (EDX)
;-------------------------------

int_to_string:
    lea esi, [BUFFER + 9]    ; final do buffer
    mov byte [esi], 0xA      ; newline
    dec esi
    mov ebx, 10

.prox_digito:
    xor edx, edx
    div ebx
    add dl, '0'
    mov [esi], dl
    dec esi
    test eax, eax
    jnz .prox_digito

    ret