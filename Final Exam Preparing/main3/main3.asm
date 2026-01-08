--------------------------------------------------------------
; TAKE 2 NUMBER FROM KEYBOARD (0-9) 
; IF NUMBER-1 IS GREATER THAN NUMBER-2 MAKE SUB OPERATION.RESULT<10
; IF NUMBER-2 IS GREATER THAN NUMBER-1 MAKE ADD OPERATION.RESULT<10
; IF NUMBER-1 = NUMBER-2 PRINT NUMBERS ARE EQUAL ON THE SCREEN
;--------------------------------------------------------------


data segment
    message1 db 10,13,"Number-1: $"
    message2 db 10,13,"Number-2: $"
    message3 db 10,13,"Result: $"
    message4 db 10,13,"Numbers are equal$"
data ends


code segment
assume cs:code,ds:data

start:  
    mov ax,data
    mov ds,ax

    
takeNumber1:
    
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    mov ah,01h
    int 21h
    
    mov bl,al
    sub bl,30h
    
    
takeNumber2:
    
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    
    
compare:
    
    ; Compare number1 and number2
    cmp bl,al
    
    je equalNumbers   ; Jump if equal to equal
    jg subNumbers  ; Jump if greater to subNumbers
    jl addNumbers  ; Jumo if lower to addNumbers
    
    
equalNumbers:
    
    mov ah,09h
    mov dx,offset message4
    int 21h
    
    jmp exitProgram
    
subNumbers:
    
    sub bl,al
    mov dl,bl
    add dl,30h
    
    mov ah,09h
    mov dx,offset message3
    int 21h
    
    mov ah,02h
    int 21h
    
    jmp exitProgram
    
    
addNumbers:
    
    add bl,al
    mov dl,bl
    add dl,30h
    
    mov ah,09h
    mov dx,offset message3
    int 21h
    
    mov ah,02h
    int 21h
    
    jmp exitProgram
    
    
exitProgram:
    mov ah,4Ch
    int 21h
    
    
code ends
end start
    
    
 