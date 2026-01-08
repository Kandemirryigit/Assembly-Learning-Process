;------------------------------------------
; COUNT HOW MUCH ELEMENT IS LOWER THAN ZERO
; DISPLAY THE RESULT ON THE SCREEN
;------------------------------------------


data segment
    array db -12,-3,21,0,-8,50,9,-5,-11,45,-4,-5,25,-1,7,-15,2,-10,-7,-22
    message1 db 10,13,"Result: $"
    quotient db ?
    remainder db ?
    ten db 10
data ends


code segment
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    mov bl,0  ; To count the numbers of zero
    mov si,0  ; To be able to move inside elements
    mov cl,20 ; Loop 20 cause we have 20 number
    
    
control:
    mov al,array[si]
    cmp al,0
    jge skip_inc
    
    inc bl
    dec cl
    inc si
    
    cmp cl,0
    je showResult
    jmp control
    
    
skip_inc:
    inc si
    dec cl
    jmp control
    
    
    
showResult:
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    mov al,bl
    mov ah,0
    div ten
    mov quotient,al
    mov remainder,ah
    
    
    ; tens
    mov dl,quotient
    add dl,30h
    mov ah,02h
    int 21h
    
    ; ones
    mov dl,remainder
    add dl,30h
    mov ah,02h
    int 21h
    
    
exitProgram:
    mov ah,4Ch
    int 21h
    
    
code ends
end start
    
    
    
    
    
    
    
    
    
    
    