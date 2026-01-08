;--------------------------------------------------------------
; TAKE 15 NUMBER (0-99) AND LOOK HOW MANY NUMBER IS DIVIED BY 7
; SHOW THE RESULT
;--------------------------------------------------------------


data segment
    message1 db 10,13,"Number: $"
    message2 db 10,13,"Result: $"
    seven db 7
    ten db 10
    number db ?
    remainder db ?
data ends


code segment
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    mov bl,0      ; Count divisible by 7
    mov cl,15     ; Number of inputs
    
takeNumber:
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mov ah,0
    mul ten
    mov bh,al
    
    mov ah,01h
    int 21h
    
    sub al,30h
    add bh,al
    mov number,bh
        
    
    mov al,number
    mov ah,0
    div seven     ; ah=remainder
    mov remainder,ah
  
   
    cmp remainder,0
    jne notDiv
    
    inc bl   ; Divisible by 7
    

    
    
notDiv:
    dec cl
    cmp cl,0
    jne takeNumber
    
   
    
    

    
    
showResult:
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    add bl,30h
    mov dl,bl
    mov ah,02h
    int 21h
    
    
exitProgram:
    mov ah,4Ch
    int 21h
    
    
    
code ends
end start
     