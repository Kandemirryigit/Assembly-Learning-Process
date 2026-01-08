;---------------------------------
; TAKE NUMBER FROM KEYBOARD (0-99)
; IF NUMBER IS EVEN PRINT EVEN
; IF NUMBER IS ODD PRINT ODD
;---------------------------------


data segment
    message1 db 10,13,"Number: $"
    message2 db 10,13,"Number is Even $"
    message3 db 10,13,"Number is Odd $"
    number db ?
    ten db 10
    two db 2
data ends

code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
takeNumber:
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mul ten
    mov bh,al
    
    mov ah,01h
    int 21h
    
    sub al,30h
    add bh,al
    mov number,bh
    
evenOrOdd:
    mov ah,0
    mov al,number
    div two        ; al=quotient ah=remainder
    
    cmp ah,0
    je evenNumber
    jne oddNumber
    
    
evenNumber:
    mov ah,09h
    mov dx,offset message2
    int 21h 
    
    jmp exitProgram
    
    
    
    
oddNumber:
    mov ah,09h
    mov dx,offset message3
    int 21h
    
    
    
exitProgram:
    mov ah,4Ch
    int 21h
    
    
    
code ends
end start
    