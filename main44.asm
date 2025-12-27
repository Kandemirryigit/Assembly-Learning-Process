;-----------------------------------------------------------------
;BITWISE OR PROGRAM DISPLAY ON THE SCREEN THE DECIMAL NUMBER (0-9)
;-----------------------------------------------------------------


data segment
    num1 db 5  ; 00000101
    num2 db 3  ; 00000011
    message1 db 10,13,"Result: $"
    result db ?
data ends

code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
  
    mov al,num1  ; al=5
    or al,num2   ; al= 5 OR 3
    mov result,al  ; result= 00110111 = 7
    
    ; Print Decimal Number
    mov al,result
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h
    
    
    ; Exit program
    mov ah,4Ch
    int 21h
    
    
code ends
end start
    