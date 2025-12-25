;----------------------
;COUNT VOWELS IN STRING
;----------------------


data segment
    msg db 'A','s','s','e','m','b','l','y','$'
    result db 10,13,"Total Vowels: $"
data ends


code segment
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    mov si,offset msg    ; SI -> A
    mov cx,0   ; CX=0
    
next:
    mov al,[si]   ; al=si so al -> A
    cmp al,'$'    ; If al=$ jump to show
    je show
    
    cmp al,'A'
    je incv
    cmp al,'E'
    je incv
    cmp al,'I'
    je incv
    cmp al,'o'
    je incv
    cmp al,'U'
    je incv
    
    inc si   ; Increase si
    jmp next
    
incv:
    
    inc cx   ; Increase cx
    inc si   ; Increase si
    jmp next
    

show:
    
    ; To display result message on the screen
    mov ah,09h
    mov dx,offset result
    int 21h
    
    mov ax,cx
    add al,'0'
    
    mov dl,al   ; To be able to show the character on the screen
    mov ah,02h
    int 21h
    
    ; Exit
    mov ah,4CH
    int 21h
    

code ends
end start
    
    
    
    
    
    