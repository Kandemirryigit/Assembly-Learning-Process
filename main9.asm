
;==========================================================
; Read a character from keyboard and show it on the screen
;==========================================================




takeInput segment
main proc far

assume cs:takeInput,ds:takeInput

mov ax,0
mov ax,takeInput
mov ds,ax

jmp showMessage

message1 db 10,13,'Please write a character: $'
message2 db 10,13,'the character is: $'



showMessage:

    ; To show - please write a character - message
    
    mov ah,09h   ; To show a string on the screen
    mov dx,offset message1   ; message1's address to dx
    int 21h
    
Input:
    
    ; To take a character input from user
    
    mov ah,01h   ; To take a character input
    int 21h
   
showcharacter:
    
    ; To show - the character is - message
    
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    
    ; To show the character that we took from user
    
    mov dl,al  ; Move character into dl
    mov ah,02h ; To show a character on the screen
    int 21h
 
    
ret
    
    
main endp
takeInput ends
end main    
    
    
    