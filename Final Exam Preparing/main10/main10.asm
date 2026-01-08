;-----------------------------
; TAKE 2 NUMBER(0-9) FROM USER
; CALCULATE THAT NUMBERS
; SHOW RESULT (0-99)
;-----------------------------


data segment
    message1 db 10,13,"Number-1: $"
    message2 db 10,13,"Number-2: $"
    message3 db 10,13,"Result: $"
    num1 db ?
    num2 db ?
    result db ?
    quotient db ?
    remainder db ?
    ten db 10
data ends


code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
    
takeNumber1:
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mov num1,al
    
takeNumber2:
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mov num2,al
    
    
calculation:
    mov al,num1
    add al,num2
    mov result,al
    
showResult:
    mov ah,0
    mov al,result
    div ten
    
    mov quotient,al
    mov remainder,ah
    
    
    mov ah,09h
    mov dx,offset message3
    int 21h
    
    ; To show quotient (al) (tens)
    mov dl,quotient
    add dl,30h
    mov ah,02h
    int 21h
    
    
    ; To show remainder (ah) (ones)
    mov dl,remainder
    add dl,30h
    mov ah,02h
    int 21h
    
    
exitProgram:
    mov ah,4Ch
    int 21h
    
    
    
code ends
end start
    
    
    
    
    
    
    
    
    
    