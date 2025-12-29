;---------------------
;LOWERCASE TO UPERCASE
;---------------------

data segment
    message1 db 10,13,"Enter a lowercase letter: $" 
    message2 db 10,13,"Yppercase letter: $"
data ends

code segment
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    ; To display message1 on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    ; To take a character from user
    mov ah,01h   ; al= input character
    int 21h   
    
    ; Convert to uppercase
    sub al,20h   ; 'a' -> 'A'
    
    ; To display message2 on the screen
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    ; Print character
    mov dl,al  ; To be able to display the character on the screen
    mov ah,02h
    int 21h
    
    ; Exit
    mov ah,4Ch
    int 21h
    
    
code ends
end start
    
    
    