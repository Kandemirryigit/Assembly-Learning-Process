;=============================================================================
; To control the number we took from keyboard is lower,equal or greater than 5
;=============================================================================



control segment
main proc far
assume cs:control,ds:control

mov ax,0
mov ax,control
mov ds,ax

jmp start

message1 db 10,13,'Enter a number: $'
message2 db 10,13,'Number is lower than 5 $'
message3 db 10,13,'Number is equal to 5 $'
message4 db 10,13,'Number is greater than 5 $'


start:

    ; lea means -load effective address- for example
    ; mov dx,offset message1 is equal to lea dx,message1 
    ; offset is for the address of the message1 variable
    ; lea handle it by just itself
    ; So when I use lea I don't have to use offset
   
    
    ; To display - Enter a number - message on the screen
    mov ah,09h
    lea dx,message1  
    int 21h

    
    ; To take a number from keyboard
    ; This takes the number directly to al register
    mov ah,01h
    int 21h
    
    
    ; To compare
    cmp al,'5'  ; I should start 5 with al register cause my input is in the al register
    
    
    ; To decide where to go
    ; Conditional statements
    jl lower    ; Jump if lesser to the lower label
    je equal    ; Jump if equal to the equal label
    jg greater  ; Jump if greater to the greater label
    

lower:
    
    ; To display - Number is lower than 5 - message on the screen
    mov ah,09h
    lea dx,message2
    int 21h
    
    ret
    
equal:
    
    ; To display - Number is equal to 5 - message on the screen
    mov ah,09h
    lea dx,message3
    int 21h
    
    ret
    
    
    
greater:
    
    ; To display - Number is greater than 5 - message on the screen
    mov ah,09h
    lea dx,message4
    int 21h
    
    ret
    


main endp
control ends
end main