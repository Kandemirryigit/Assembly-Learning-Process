;-----------------------------------------------------------
; BITWISE NOT PEROGRAM.DISPLAY THE NUMBER ON THE SCREEN (0-9)
;------------------------------------------------------------

data segment
    num db 253   ; 11111101
    result db ?
data ends


code segment 
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
    mov al,num
    not al
    mov result,al    ; result= 00000010
    
    
    ; Printf result as decimal
    mov dl,result
    add dl,30h
    mov ah,02h
    int 21h
    
    mov ah,4Ch
    int 21h
    
code ends
end start
     
