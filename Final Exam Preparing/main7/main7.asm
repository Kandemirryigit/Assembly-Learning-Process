;-----------------------
; DIV 2 NUMBER (1-DIGIT)
; RESULT<10
;-----------------------


data segment
    num1 db 6
    num2 db 2
    quotient db ?
    remainder db ?
    message1 db 10,13,"Quotient: $"
    message2 db 10,13,"Remainder: $"
data ends


code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
    
division:
    mov al,num1
    mov ah,0     ; the remainder is gonna be inside ah cause of that 
    mov bl,num2
    div bl       ; al=quotient ah=remainder
    
    mov quotient,al
    mov remainder,ah
    

showQuotient:
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    
    add quotient,30h
    mov dl,quotient
  
    mov ah,02h
    int 21h
    
    
    
showRemainder:
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    add remainder,30h
    mov dl,remainder
    
    mov ah,02h
    int 21h
    
    
exitProgram:
    
    mov ah,4Ch
    int 21h
    
    
code ends
end start
    
    