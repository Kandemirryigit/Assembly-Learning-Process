;--------------------------------------
;SHL (LOGICAL SHIFT LEFT) PROGRAM
; DISPLAY THE NUMBER ON THE SCREEN (0-9)
;---------------------------------------


data segment
    num db 3   ; 00000011
    result db ?
data ends

code segment
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    mov al,num
    shl al,1   ; shift left by 1
    mov result,al  ; result= 00000110 =6
    
    ;printf result as decimal
    mov dl,result
    add dl,30h   ; Convert to ASCII
    mov ah,02h
    int 21h
    
    mov ah,4Ch
    int 21h
    
code ends
end start