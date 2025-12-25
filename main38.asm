;-------------------------
;REMOVE SPACES FROM STRING
;-------------------------


data segment
    msg db 'A','s','s','e','m',' ','b','l','y','$'
data ends

code segment
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    mov si,offset msg
    mov di,offset msg

remove:
    mov al,[si]
    cmp al,'$'
    je done
    
    cmp al,' '
    je skip
    
    mov [di],al
    inc di
    
skip:
    inc si
    jmp remove
   
done:
    mov byte ptr [di],'$'
    
    mov ah,09h
    mov dx,offset msg
    int 21h
    
    mov ah,4Ch
    int 21h
    
 code ends
 end start