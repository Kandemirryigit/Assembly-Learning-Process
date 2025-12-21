;--------------------
; COMPARE TWO STRINGS
;--------------------

data segment
    str1 db "Hello",'$'
    str2 db "hello",'$'
    message1 db 10,13,"Not Equal $"
    message2 db 10,10,"Equal $"
data ends



code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov si,offset str1   ; pointer to the source string
    mov di,offset str2   ; pointer to the destination string
    mov cx,5   ; Number of bbytes to compare
    
 
compare_loop:
    cmpsb  ; Compare [si] with [di]
    jne not_equal   ; Jumop if not equal
    loop compare_loop  ;repeat cx times
    jmp equal
    
    
not_equal:
    
    ; To display message1 on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    jmp end_program
    
    
equal:
    
    ; To display message2 on the screen
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    
    
end_program:
    mov ah,4Ch
    int 21h
    
    
code ends
end start
    
       
    
    