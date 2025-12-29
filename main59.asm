;--------------------------------------
;MULTIPLY TWO ONE-DIGIT NUMBERS (NO MUL)
;---------------------------------------

data segment
    message1 db 10,13,"Enter first digit (0-9) $"
    message2 db 10,13,"Enter second digit (0-9) $"
    message3 db 10,13,"Result: $"
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
    
    ; To take first number
    mov ah,01h
    int 21h
    sub al,30h   ; to convert ASCII
    mov bl,al   ; bl= First Number
    
    ; To display message2 on the screen
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    ; To take second number
    mov ah,01h
    int 21h
    sub al,30h
    mov cl,al   ; cl= Second Number
    
    
    ; Multiply using addition
    mov al,0   ; result=0
    
    
multiply:
    ; the multiply logic (easy)
    add al,bl
    dec cl
    jnz multiply
    
    ; Print result message
    mov ah,09h
    mov dx,offset message3
    int 21h
    
    ; Convert result to decimal
    mov ah,0
    mov bl,10
    div bl   ; al=tens , ah=ones
    
    
    ; Print tens digit
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h
    
    
    ; Print ones digit
    mov al,ah
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h
    
    
    ;Exit
    mov ah,4Ch
    int 21h
    
    
code ends
end start
    