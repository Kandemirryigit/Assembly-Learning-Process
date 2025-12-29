;------------------------------
;PRINT A DIGIT WITH MACRO (0-9)
;------------------------------

code segment
assume cs:code,ds:code

PRINTDIGIT MACRO n
    mov ah,02h
    mov dl,n
    add dl,30h
    int 21h
ENDM

start:
    PRINTDIGIT 3
    PRINTDIGIT 7
    
    mov ah,4Ch
    int 21h
    
    
code ends
end start