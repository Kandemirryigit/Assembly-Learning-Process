;--------------
;NEW LINE MACRO
;--------------

code segment
assume cs:code,ds:code

NEWLINE MACRO
    mov ah,02h
    mov dl,13
    int 21h
    mov dl,10
    int 21h
ENDM

start:
    ; To display 'A' character on the screen
    mov ah,02h
    mov dl,'A'
    int 21h
    
    NEWLINE    ; Called NEWLINE macro
    
    ; To display 'B' character on the screen
    mov ah,02h
    mov dl,'B'
    int 21h
    
    ; To exit from program
    mov ah,4Ch
    int 21h
    
code ends
end start
