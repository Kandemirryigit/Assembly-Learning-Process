;-------------------------------------------------------
;FIND LENGHT OF STRING AND DISPLAY IT (SINGLE CHARACTER)
;-------------------------------------------------------


data segment
    msg db 'H','e','l','l','o','$'
    message1 db 10,13,"Lenght of the string: $"
data ends


code segment
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    mov si,offset msg   ; SI-> String
    mov cx,0   ; Counter
    
    
count_loop:
    mov al,[si]   ; First character of the string
    cmp al,'$'    ; Compare the character with $
    je finish     ; If character equals $ jump to finish
    
    inc cx        ; If not equal to $ increase cx 
    inc si        ; If not equal to $ increase si
    jmp count_loop  ; make same operations again
    
 
finish:
    
    ; To display message1 on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    ; Convert cx to ASCII(single digit)
    mov ax,cx
    add al,'0'     ; 5-> '5'
    
    ; To be able to show a character on the screen that character should be inside dl register
    mov dl,al
    mov ah,02h
    int 21h
    
    
    ; Exit
    mov ah,4Ch
    int 21h
    
    
code ends
end start

    
