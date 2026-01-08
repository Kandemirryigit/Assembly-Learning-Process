;-----------------------------------------------------
; TAKE 2 NUMBER FROM KEYBOARD (0-9) AND CALCULATE THEM
; THE RESULT IS GOING TO BE LOWER THAN 10
; I'M WORKING WITH 1 DIGIT RIGHT NOW
;-----------------------------------------------------

data segment
    message1 db 10,13,"Number-1: $"
    message2 db 10,13,"Number-2: $"
    message3 db 10,13,"Result: $"
data ends


code segment
assume ds:data,cs:code

start:
    
    ; I should define segments
    mov ax,data
    mov ds,ax
    
    
takeNumber1:
    
    ; TO display message1 on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    ; To take a character from keyboard
    mov ah,01h
    int 21h
    
    ; The character that we took from keyboard is inside al register
    ; I'll take a number from keyboard and Im gonna use it for arihmetic operations
    ; Because of that I should convert the character from ASCII to number
    sub al,30h
    
    ; I'll take another number from keyboard cause of that I sent number1 to bl register
    ; Cause I'll take the other number inside al register
    mov bl,al
    
    
takeNumber2:
    
    ; To display message2 on the screen
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    

calculate:
    ; number1=al number2=bl
    ; al+bl=al
    ; Now the result is inside al register
    add al,bl
    
showResult:
    
    ; To display message3 on the screen
    mov ah,09h
    mov dx,offset message3
    int 21h
    
    ; To be able to show the number on the screen I should add 30h to the number
    ; From number to ASCII
    add al,30h
    
    ; To show a character on the screen the character should be inside dl register
    mov dl,al
    mov ah,02h
    int 21h
    
    
exitProgram:
      
    ; To end program
    mov ah,4Ch
    int 21h
    
    
    
code ends
end start
    
    
    
    
    

    