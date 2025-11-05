;====================================
; To find series' 5. indis character
;====================================



find segment
main proc far

assume cs:find,ds:find

mov ax,0
mov ax,find
mov ds,ax

jmp displayMessage1

message1 db 10,13,'Give a series: $'
message2 db 10,13,'indis fives value is: $'


; I'll take a string input so I should store in in my memory 
; I created a max character lenght 30 buffer
; I can write max 30 character inside my input

buffer db 30
       db ?
       db 30 dup ("$")
      


       
displayMessage1:
       
       ; To display - Give a series - message on the screen
       mov ah,09h
       mov dx,offset message1
       int 21h
       
       
takeInput:
       
       ; To read a string from keyboard
       mov ah,0Ah     ; read a string from keyboard
       mov dx,offset buffer    ; Write this location the things you read
       int 21h
       
       
findIndis:
       
       ; get 5th character
       ; Buffer+2 you know why it is like that
       ; buffer+4 means 5th character cause it starts from 0
       mov al, [buffer+2+4]  
       
displayMessage2:
       
       ; To display - indis fives value is:  - message on the screen
       mov ah,09h
       mov dx,offset message2
       int 21h
       
displayIndis:
       
       ; To display 5. indis on the screen
       mov dl,al
       mov ah,02h
       int 21h
       

ret

main endp
find ends
end main



; If the thing is string then memory stores it's address inside dx

; If the thing is a character then memory stores it inside dl
