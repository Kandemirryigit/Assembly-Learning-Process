;-----------------------------------------------------
; FIND THE POSITION OF THE CHARACTER 'e' IN THE STRING
;------------------------------------------------------


data segment
    str db "Hello",'$'  ; String to search
    message1 db,10,13,"The string has got the character e $"
    message2 db,10,13,"The string hasn't got the character e $"
data ends



code segment
assume cs:code,ds:data

jmp start


start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov di,offset str  ; Pointer to the string
    mov al,'e'   ; character to the search
    mov cx,5   ; Number of bytes in string
    
    
search_loop:
    scasb   ; Compare al with [di]
    je found  ; Jump if equal to found
    loop search_loop
    jmp not_found
    
    
found:
    
    ; To dislpay message1 on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    jmp programEnds
    

not_found:
    
    ; To dislpay message2 on the screen
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    
    
programEnds:
    ; To end the program
    mov ah,4Ch 
    int 21h
    
    
code ends
end start
    
    