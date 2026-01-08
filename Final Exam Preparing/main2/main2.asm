;-----------------------------------------------
; TAKE 2 NUMBER FROM KEYBOARD (0-9) AND SUB THEM
; THE RESULT IS GOING TO BE LOWER THAN 10
; I'M WORKING WITH 1 DIGIT RIGHT NOW
;-----------------------------------------------

data segment
    message1 db 10,13,"Number-1: $"
    message2 db 10,13,"Number-2: $"
    message3 db 10,13,"Result: $"
data ends


code segment
assume cs:code,ds:data

start:
    ; I should define the segments
    mov ax,data
    mov ds,ax
    
    
takeNumber1:
    
        mov ah,09h
        mov dx,offset message1
        int 21h
        
        mov ah,01h
        int 21h
        
        mov bl,al
        sub bl,30h
        
        
takeNumber2:
        
        mov ah,09h
        mov dx,offset message2
        int 21h
        
        mov ah,01h
        int 21h
        
        sub al,30h
        
subNumbers:
        
        ; number1-number2
        ; The result is going to be inside bl register
        sub bl,al
        
        
showResult:
        mov ah,09h
        mov dx,offset message3
        int 21h
        
        mov dl,bl
        add dl,30h
        
        mov ah,02h
        int 21h
        
        
exitProgram:
        mov ah,4Ch
        int 21h
        
        
        
code ends
end start
        
       
        
        
        
        
        
        
        
        