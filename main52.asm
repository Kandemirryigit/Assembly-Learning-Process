;------------------------
;TWO PARAMETER WITH MACRO
;------------------------

code segment
assume cs:code,ds:code

PRINT2 MACRO a,b
    mov ah,02h
    mov dl,a
    int 21h
    
    mov dl,b
    int 21h
    
ENDM

start:
    PRINT2 'H','i'
    PRINT2 'A','b'
    
    mov ah,4Ch
    int 21h
    
code ends
end start

