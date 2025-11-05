;===================================
; To compare two numbers between 0-9
;===================================


compare segment
main proc far
assume cs:compare,ds:compare

mov ax,0
mov ax,compare
mov ds,ax


jmp firstNumberTake

message1 db 10,13,'First Number: $'
message2 db 10,13,'Second Number: $'
message3 db 10,13,'First number is greater than Second number $'
message4 db 10,13,'Second number is greater than First number $'
message5 db 10,13,'First number and Second number is equal $'



firstNumberTake:

    ; to display - First number: - message on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    ; To take a number from user.Between 0-9
    mov ah,01h
    int 21h  ; If you don't use this program is not gonna wait you to input
     
    ; To convert ascii to number
    sub al,30h
    
    ; To store number1 inside bl
    mov bl,al 
    
   
secondNumberTake:
    
    ; to display - Second number: - message on the screen
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    ; To take a number from user.Between 0-9
    mov ah,01h
    int 21h   ; If you don't use this program is not gonna wait you to input
    
    ; To convert ascii to number
    sub al,30h
    
    ; To store number2 inside bh
    mov bh,al
   
    
comp:
     
    ; Compare bl and bh
    cmp bl,bh 
    
    ja number1Greater    ; Jump if above
    je equal             ; Jump if equal
    jb number2Greater    ; Jump if below
   
 
    
number1Greater:
    
    ; To display - First number is greater than Second number - message on the screen
    mov ah,09h
    mov dx,offset message3
    int 21h
    
    ret ; To stop program
    
    
    
equal:
    
    ; To display - First number and Second number is equal - message on the screen
    mov ah,09h
    mov dx,offset message5
    int 21h
    
    ret  ; To stop program
   
    
number2Greater: 
    
    ; To display - Second number is greater than First number - message on the screen
    mov ah,09h
    mov dx,offset message4
    int 21h
    
    ret ; To stop program
    
   
    
main endp
compare ends
end main