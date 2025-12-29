;----------------------
;PRINT A VARIABLE DIGIT
;----------------------

data segment
    num db 7
data ends

code segment
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    mov dl,num
    add dl,30h   ; To convert ASCII
    mov ah,02h
    int 21h
    
    mov ah,4Ch
    int 21h
    
    
code ends
end start

    