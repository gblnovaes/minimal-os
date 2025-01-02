ORG 0X7C00
BITS 16


;define mode video
mov ah,0x00
mov al,0x13
int 0x10

_LOOP:
    jmp _LOOP

mov ah,0x0C
int 0x10


times 510-($-$$) db 0

DB 0X55
DB 0xAA

