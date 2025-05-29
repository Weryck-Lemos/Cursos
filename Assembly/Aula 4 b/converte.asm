%include 'biblioteca.inc'

section .data
    v1 dw '105', LF, NULL

section .text

global _start

_start:
    call converte_valor
    call mostrar_valor

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL

converte_valor:
    lea esi, [v1]
    mov ecx, 0x3
    call string_to_int
    ret

mostrar_valor:
    call int_to_string
    call saidaResultado
    ret
;-------------------------------
;      String para Inteiro
;-------------------------------
; Entrada: ESI (valor conv)  ECX (tam)
; Saida: EAX
;-------------------------------
string_to_int:
    xor ebx, ebx  ;EBX = 0, vai acumular o valor inteiro convertido
.prox_digito:
    movzx eax, byte[esi]
    inc esi ;avanca o ponteiro
    sub al,'0' ;converte
    imul ebx, 0xA ;multiplica o acumulador por 10
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
    lea esi, [BUFFER] ;aponta esi para o inicio do buffer
    add esi, 0x9 ;move esi para o final do buffer (assumindo tamanho 10)
    mov byte[esi], 0xA ;coloca um caractere de nova linha
    mov ebx, 0xA ;divisor = 10
.prox_digito:
    xor edx, edx ;limpa edx
    div ebx 
    add dl,'0'
    dec esi ;volta um byte no buffer para armazenar o digito
    mov[esi], dl ;salva o digito no buffer
    test eax, eax ; testa se o quociente é zero (acabou)
    jnz .prox_digito ;se nao, reprete para o proximo digito
    ret