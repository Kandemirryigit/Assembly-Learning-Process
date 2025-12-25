;----------------
;REVERSE A STRING
;----------------


data segment
    msg db 'H','e','l','l','o','$'
    message1 db 10,13,"Reverse of hello: $"
data ends


code segment 
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
    
    ; find end of the string
    mov si,offset msg    ; SI -> String
    
find_end:
    cmp byte ptr [si],'$'
    je set_pointers
    inc si
    jmp find_end
    
set_pointers:
    dec si              ; SI -> Last character
    mov di,offset msg   ; DI -> first character

reverse:
    cmp di,si
    jge done
    
    mov al,[di]
    mov bl,[si]
    
    mov [di],bl
    mov [si],al
    
    inc di
    dec si
    jmp reverse
    
    
done:
    
    ; To display message1 on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    ; To display reverse string on the screen
    mov ah,09h
    mov dx,offset msg
    int 21h
    
    ; Exit
    mov ah,4Ch
    int 21h
    
    
    
code ends
end start
    
    
    
    
    
    
    