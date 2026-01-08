;---------------------------------------
; DISPLAY A SPECIFIC ELEMENT OF AN ARRAY
;----------------------------------------


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
    
    
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    mov al,array[2]
    add al,30h
    mov dl,al
    
    mov ah,02h
    int 21h
    
code ends
end start
    