;-------------
;WORD COUNTER
;-------------


data segment
    message1 db 10,13,"Enter a sentence: $"
    message2 db 10,13,"Word count: $"
    
    ; Defined for store the string
    buffer db 80  ; Max lenght
           db ?   ; Actual Lenght
           db 80 dup(?)  ; String
           
    ; Defined for store the count of the word
    count db 0
    
data ends


code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
    ; To display message1 on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    ; Take string from user
    mov ah,0Ah
    mov dx,offset buffer
    int 21h
    
    mov si,offset buffer+2   ; SI -> String start
    mov cl,buffer+1   ; CL -> Lenght
    mov ch,0
    
    
    mov count,0
    mov bl,0
    
    
    
countLoop:
    mov al,[si]
    
    cmp al,' '
    je  spaceFound   ; Jump if equal
    
    ; Non-space character
    cmp bl,0
    jne continue1
    
    ; New word found
    inc count
    mov bl,1
    jmp continue1
    
  
spaceFound:
    mov bl,0   ; Leave word
    
    
continue1:
    inc si
    loop countLoop
    
    ; Print result
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    mov al,count
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h
    
    mov ah,4Ch
    int 21h
    
    
code ends
end start
    
    
    
    
    
    
    
    
    
    
    
    