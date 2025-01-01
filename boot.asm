;-----------------------------------;
; Project Initialized in 01-01-2025 ;
;-----------------------------------; 


ORG 0x7c00 
BITS 16


start:
    mov si, msg
    call print
    jmp $


print:
    mov bx,0 

repete:
    lodsb
    cmp al,0
    je done
    call print_char
    jmp repete
    
done:
    ret
 

print_char:
   mov ah,0eh
   int 0x10
   ret


msg db 'Hello World',0

times 510-($-$$) db 0
dw 0xAA55


