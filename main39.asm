;-----------------
;STRLEN PROCEDURE
;-----------------


data segment
    msg db 'A','s','s','e','m','b','l','y','$'
    message1 db 10,13,"Result: $"
data ends


code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
    mov si,offset msg
    call strlen   ; Returns lenght in CX
    
    ; To dislpay message1 on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    mov ax,cx
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h
    
    mov ah,4Ch
    int 21h
    
   
    
 ;----------------------
 ; STRLEN PROCEDURE
 ; SI -> string
 ; returns CX = lenght
 ;-----------------------
 
 strlen proc
    mov cx,0
    
    
next_char:
    cmp byte ptr [si],'$'
    je done
    inc cx
    inc si
    jmp next_char
    
    
done:
    ret
strlen endp


code ends
end start
    
    
    
    
    
    
    
    
    
    
    
    
    
 
 
 
 
 
 
    
    