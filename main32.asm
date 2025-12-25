;---------------------------------
; READ FIRST CHARACTER OF A STRING
;---------------------------------


data segment
    msg db  'H','e','l','l','o','$'
data ends


code segment 
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    mov si,offset msg  ; SI -> String
    mov dl,[si]        ; DL= First Character
    
    ; To display a character on the screen
    mov ah,02h         
    int 21h
    
    ; Exit the program
    mov ah,4Ch
    int 21h
    
    
code ends
end start
    