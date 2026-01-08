;----------------------------------
; TAKE 2 ONE-DIGIT NUMBER FROM USER 
; MULTIPLE THAT NUMBERS
; RESULT<10
;----------------------------------


data segment
    message1 db 10,13,"Number1: $"
    message2 db 10,13,"Number2: $"
    message3 db 10,13,"Result: $"
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
    mov bl,al    ; Number1 inside bl
    
takeNumber2:
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    mov ah,01h
    int 21h
     
    sub al,30h   ; Number2 inside al
    
    
multiple:
    mul bl     ; al x bl
    
showResult:
    
    mov ah,09h
    mov dx,offset message3
    int 21h
    
    add al,30h
    mov dl,al
    
    mov ah,02h
    int 21h
    
exitProgram:
    mov ah,4Ch
    int 21h
    
    
code ends
end start
    
    
    
    
    
    