[ORG 0X7C00]
[BITS 16]

MOV AH,0x00     ; Define mode video
MOV AL,0x13      
INT 0x10        


MOV AL, 0x05
MOV BX, 0x00       ; Page 0
MOV CX, 0x00       ; Column 
MOV DX, 0x00       ; Row
 
_LOOP:
    MOV AH,0x0C 
    INT 0x10

    INC CX
    CMP CX,0x0140
    JNE _LOOP

    MOV CX,0x00
    INC DX
    CMP DX,0xC8
    JNE _LOOP
    MOV DX,0x00
    INC AL
    
    CMP AL,0xFF
    JE RESET_COLOR
    JMP _LOOP

RESET_COLOR:
    MOV AL, 0x00
    JMP _LOOP

PRINT_COLOR:
    MOV AH,0x0C
    INT 0x10
    RET

times 510-($-$$) db 0

DB 0X55
DB 0xAA

