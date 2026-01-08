;----------------------------------
; TAKE 2 ONE-DIGIT NUMBER FROM USER 
; DIV THAT NUMBERS
; RESULT<10
;-----------------------------------




data segment
    message1 db 10,13,"Number1: $"
    message2 db 10,13,"Number2: $"
    message3 db 10,13,"Quotient: $"
    message4 db 10,13,"Remainder: $"
    num1 db ?
    num2 db ?
    quotient db ?
    remainder db ?
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
    
    sub al,30h
    mov num1,al
    
    
takeNumber2:
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    mov ah,01h
    int 21h
     
    sub al,30h   
    mov num2,al
    
    
division:
    mov al,num1
    mov ah,0
    div num2  ; ax/bl   al=quotient ah=remainder
    
    
    mov quotient,al
    mov remainder,ah
    
    

showQuotient:
    mov ah,09h
    mov dx,offset message3
    int 21h
    
    
    add quotient,30h
    mov dl,quotient
  
    mov ah,02h
    int 21h
    
    
    
showRemainder:
    mov ah,09h
    mov dx,offset message4
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
    
    
    


    
    
    
    
    
    
