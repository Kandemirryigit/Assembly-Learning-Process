;-------------------------------
; WE HAVE A NUMBER A6h 
; MAKE SHR OPERATION
;-------------------------------


data segment
    result db ?
data ends

code segment
assume cs:code,ds:Data

start:
    mov ax,data
    mov ds,ax
    
    
operations:
    mov al,A6h
    mov cl,3
    shr al,cl
    
    mov result,al
    
    mov ah,4Ch
    int 21h
    
code ends
end start