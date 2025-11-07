;===================================================================================
; Take  number1: 2 digit , take number2: 1 digit make this operation number2-number1
;===================================================================================


; Created this macro to display a string on the screen
writeMessage macro msg 
    mov ah,09h
    lea dx,msg
    int 21h
endm

; Created this macro the take a number from keyboard
takeNumber macro
    mov ah,01h
    int 21h
    sub al,30h
endm

; Created this macro to show a character on the screen
writeNumber macro num
    mov ah,02h
    mov dl,num   ; 02h Function takes it's variable inside dl cuz of it we should mov our variable to the dl
    add dl,30h
    int 21h
endm



operation segment
main proc far
assume cs:operation,ds:operation

mov ax,0
mov ax,operation
mov ds,ax


jmp writeMessage1

message1 db 10,13,'Write a number with 2 digit: $'
message2 db 10,13,'Write a number with 1 digit: $'
message3 db 10,13,'Difference between number1 and number2: $'


tensDigit db ?  ; This is going to store tens digit
onesDigit db ?  ; This is going to store ones digit
ten db 10  ; We can't directly give 10 to the mul


writeMessage1:
    
    ; To display - Write a number with 2 digit: - on the screen
    writeMessage message1
    
    
takeTensDigit:
    
    ; Firstly we are going to take tens digit and we are gonna multiple that with 10
    ; After we are gonna add that number to second number 
    ; lets assume
    ; First number is 2 we are going to multiple it with 10 so its 2x10=20
    ; Our second number is 4 
    ; If we add first number to the second number so 20+4=24
    ; In assembly we cannot take directly 24
    ; Because of that we should make this operation
    
    ; To take first digit
    takeNumber
    
    ; The division and multipication operation works in ax register so ( al and ah ) 
    ; Because of that we should give 0 to it before we start the operation
    ; Because if ah has a number in it our operation can return us a wrong result
    ; If you remember in the above we gave ah 01h function and it is still in it so if we don't give 0 to it that 01h function is gonna affect us.
    mov ah,0
    
    ; To multiple the input with ten
    mul ten ; ax x 10
    
    ; We changed the location of our number because we are gonna take other inputs in al 
    ; Because of that we should take to the bl 
    mov bl,al
    
    
    
takeOnesDigit:
    
    ; Take the second digit
    takeNumber
    
    ; add bl+al
    add bl,al
    
    ; With this operation we took our tens digit number 
    
    
takeSecondNumber:
    
    ; To display - Write a number with 1 digit: - message on the screen
    writeMessage message2
    
    ; Take second number
    takeNumber
    
 
subscription:
    
    ; Our first number was in bl and the second number is in al 
    ; bl - al
    sub bl,al 
    
    ; Sub operations result is inside bl div works al/dividing
    ; Cuz of that I should mov bl to al
    mov al,bl
    
    ; Before division we should make ah 0 because it can affect our operation
    mov ah,0

    ; **** This division is for be able to write the number with 2 digits on the screen ****
    ; al/ten
    div ten
    
    ; al has division
    ; ah has remainder
    mov tensDigit,al
    mov onesDigit,ah
    

writeMessage3:
        
        ; To display - Difference between number1 and number2: - message on the screen
        writeMessage message3
    
    
writeTens:
    
    cmp tensDigit,0
    je writeOnes
    
    writeNumber tensDigit
    
    
    
writeOnes:
    
    writeNumber onesDigit
    
    

ret

main endp
operation ends
end main










