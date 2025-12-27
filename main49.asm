;---------------------
;PRINT CHARACTER MACRO
;---------------------



code segment
assume cs:code,ds:code


PRINTCHAR MACRO c

    ; To display a character on the screen
    mov ah,02h
    mov dl,c
    int 21h
ENDM


start:
    mov ax,code
    mov ds,ax
   
    PRINTCHAR 'H'   ; print 'H'
    PRINTCHAR 'E'   ; print 'E'
    PRINTCHAR 'L'   ; print 'L'
    PRINTCHAR 'L'   ; print 'L'
    PRINTCHAR 'O'   ; print 'O'
    
    
    
    mov ah,4Ch
    int 21h
    
    
code ends
end start