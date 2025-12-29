;------------------------------------------------------------------------------------
;Using scrolling commands, show how many even numbers are among the 5 numbers entered.
;------------------------------------------------------------------------------------

PRINT_MESSAGE MACRO msg
    mov ah,09h  ; To show a string on the screen
    mov dx,offset msg
    int 21h
ENDM


PRINT_NUMBER MACRO number
    mov ah,02h   ; To show a character on the screen
    mov dl,number
    add dl,30h   ; To convert ASCII
    int 21h
ENDM


TAKE_NUMBER MACRO 
    mov ah,01h   ; To take a character from user
    int 21h
    sub al,30h   ; To convert ASCII
ENDM


data segment
    message1 db 10,13,"Enter a number: $"
    message2 db 10,13,"Count of even numbers: $"
    message3 db 10,13,"Count of odd numbers: $"
data ends


code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
    mov cx,5  ; We will take 5 numbers
    mov bl,0  ; Even counter
    mov bh,0  ; Odd counter
    
    
    
inputLoop:
    
    PRINT_MESSAGE message1
    TAKE_NUMBER   ; Number is now in AL
    
    test al,1   ; Check LSB ( bitwise AND with 1)
    jz evenNumber  ; Jump if zero -> even
    
    ; If not even than its odd so increase odd counter
    inc bh  ; odd count++
    jmp nextNumber
    
    
evenNumber:
    inc bl  ; even count++
    
    
nextNumber:
    loop inputLoop
    
    PRINT_MESSAGE message2
    PRINT_NUMBER bl
    
    PRINT_MESSAGE message3
    PRINT_NUMBER bh
    
    mov ah,4Ch
    int 21h
    
code ends
end start
    
    
    
    
     
