;==============================================================================
; Subscription with numbers between 0-9 and I assume the result is between 0-9
;==============================================================================


subscription segment
main proc far

assume cs:subscription,ds:subscription

mov ax,0
mov ax,subscription
mov ds,ax


jmp takeNumber1

message1 db 10,13,'Number1: $'
message2 db 10,13,'Number2: $'
message3 db 10,13,'Result: $'


takeNumber1:

    ; to display - Number1: - message on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    ; To take number1 from keyboard
    mov ah,01h
    int 21h
    
    ; to store number1 inside bl
    mov bl,al
    
    ; To convert number1 ascii to number
    sub bl,30h
    
    
    
   
takeNumber2:
    
    ; to display - Number2: - message on the screen
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    ; To take number2 from keyboard
    mov ah,01h
    int 21h
    
    ; To convert number1 ascii to number
    sub al,30h
    
    
subs:
    
    ; Number1 is inside bl,number2 is inside al
    ; so bl-al is equal number1-number2
    sub bl,al

    
result:
    
    ; to display - Result: - message on the screen
    mov ah,09h
    mov dx,offset message3
    int 21h
    
    ; To display the result of the subscription
    mov ah,02h   ; To display a character on the screen
    mov dl,bl    ; to display a character on the screen we should take data from dl cause of that I sent bl to dl
    add dl,30h   ; To display a number not an ascii code I converted it 
    int 21h 
    
    
ret 
    

main endp
subscription ends
end main