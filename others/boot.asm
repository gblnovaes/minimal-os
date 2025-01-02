;-----------------------------------;
; Author: Gabriel Novaes            ;
; Project Initialized in 01-01-2025 ;
;-----------------------------------; 


ORG 0 
BITS 16

jmp 0x7c0:start

start:
    cli ; Clear interrupts

    mov ax,0x7c0
    mov ds,ax
    mov es,ax
    mov ax,0x00
    mov ss,ax
    mov sp,0x7c00

    sti ; Enables interrupts

    mov si, msg
    call print
    jmp $


print:
    mov bx,0 

.loop:
    lodsb
    cmp al,0
    je .done
    call print_char
    jmp .loop

.done:
    ret
 

print_char:
   mov ah,0eh
   int 0x10
   ret


msg db 'Hello World',0

times 510-($-$$) db 0
dw 0xAA55


