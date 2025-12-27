;--------------------
;BITWISE AND PROGRAM
;--------------------


data segment
    num1 db 12   ; 00001100
    num2 db 10   ; 00001010
    message1 db 10,13,"Result: $"
    result db ?
data ends


code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
    mov al,num1   ; al=12 
    and al,num2   ; al=12 AND 10 = 8
    mov result,al  ; result variable has al  result: 00001000 =8
    
    
    
    ; To display message1 on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    
    ; Printf result as decimal
    mov al,result   ; dl register has result variable
    add al,30h   ; Converts a numeric value to its ASCII character
    mov dl,al
    mov ah,02h
    int 21h
    
    mov ah,4Ch
    int 21h
    
code ends
end start




; You already know bitwise operations cuz of that I think I don't need to explain it
; I aslo saw them in C 
    
    