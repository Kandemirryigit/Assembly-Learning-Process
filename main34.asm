;---------------------------------
;DISPLAY 3RD CHARACTER OF A STRING
;---------------------------------


data segment
    msg db "Hello$"
    message1 db 10,13,"3rd character is: $"
data ends

code segment
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    ; To display message1 one the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    ; Point to the string
    mov si,offset msg   ; SI -> String
    add si,2    ; SI -> 3rd character
    
    mov dl,[si]   ; load 3rd character
    mov ah,02h
    int 21h
    
    ;Exit
    mov ah,4Ch
    int 21h
    
code ends
end start
    