;------------------------------------------------------------------
;BITWISE XOR PROGRAM DISPLAY ON THE SCREEN THE DECIMAL NUMBER (0-9)
;------------------------------------------------------------------

data segment
    num1 db 12  ; 00001100
    num2 db 10  ; 00001010
    message1 db 10,13,"Result: $"
    result db ?
data ends

code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
    ; Bitwise xor operation
    mov al,num1   ; al=12
    xor al,num2   ; al= 12 XOR 10 = 00000110 = 6
    mov result,al
    
    ; To display message1 on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    ; To display Decimal number on the screen
    mov dl,result
    add dl,30h
    mov ah,02h
    int 21h
    
    mov ah,4Ch
    int 21h
    
    
code ends
end start