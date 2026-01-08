;---------------------------------------------------------------------
; TAKE NUMBERS FROM KEYBOARD (0-99) WHILE THE NUMBER IS NOT EQUAL TO 5
; FIND HOW MANY NUMBER CAN DIVIDE BY 5
; SHOW THE RESULT ON THE SCREEN
;----------------------------------------------------------------------

data segment
    message1 db 10,13,"Number: $"
    message2 db 10,13,"Result: $"
    number db ?
    five db 5
    ten db 10
    remainder db ?
    quotientResult db ?
    remainderResult db ?
data ends


code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
    mov bl,0  ; Count divisible by 5
    
takeNumber:
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    cmp al,0
    je showResult
    
    mov ah,0
    mul ten
    mov bh,al
    
    mov ah,01h
    int 21h
    
    sub al,30h
    add bh,al    
    mov number,bh
    
    
    
control:
    mov al,number
    mov ah,0
    div five       ; al=quotient ah=remainder
    mov remainder,ah
    
    cmp remainder,0
    je dividedByFive
    
    jmp takeNumber
    
    
dividedByFive:
    inc bl
    jmp takeNumber
    
    
    
    
    
    
    
showResult:
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    
    mov ah,0
    mov al,bl
    div ten   ; al=quotient ah=remainder
    mov quotientResult,al
    mov remainderResult,ah
    
    
    ; Tens
    mov dl,quotientResult
    add dl,30h 
    mov ah,02h
    int 21h
    
    ; Ones
    mov dl,remainderResult
    add dl,30h
    mov ah,02h
    int 21h
    
    
    
    
exitProgram:
    mov ah,4Ch
    int 21h
    
    
code ends
end start
    
    
    
    
    
    