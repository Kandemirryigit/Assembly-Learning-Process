;-----------------------------
; DISPLAY AN ARRAY'S ELEMENTS
;-----------------------------


data segment
    array db 5,6,7,1,2
    size db 5
    message1 db 10,13,"Element: $"
data ends


code segment
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    
    mov si,0    ; Index
    mov cx,5    ; array size
    
    
printLoop:
    
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    mov al,array[si]
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h
    
    inc si
    loop printLoop   ; While cx is not equal to 0.This automaticly decrease the cx
    
    mov ah,4Ch
    int 21h
    
    
code ends
end start
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    