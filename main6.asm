
;===========================================
;Swap two values and show them on the screen
;===========================================



change segment    
main proc far

assume cs:change,ds:change

mov ax,0
mov ax,change
mov ds,ax


jmp start

message1 db 10,13,'Al contains: $'
message2 db 10,13,'Bl contains: $'


start:
    mov al,5  ; al register's value is 5
    mov bl,7  ; bl register's value is 7
    
    
swap:
    xchg al,bl  ; al --> 7  bl --> 5
    
    ; to write message1 on the screen
    mov ah,09h  
    mov dx,offset message1
    int 21h
    
    ; To write value of al on the screen
    mov ah,02h   ; To show a string
    mov dl,al
    
    ; If you just make this then the output is going to be 7's ascii code so its a beep voice
    ; If we wanna show the number 7 on the screen then we should add it 48.
    ; If we add 7+48=55 we can see 7 number on the screen not a beep voice
    ; So we can directly add 7+48 but this can be frustrated when we start to work with numbers
    ; So we can add its hexadecimal form 
    ; We just can do this with 0,1,2,3,4,5,6,7,8,9 
  
    add dl,30h  ; dl+30h means dl+48.dl means al.al means 7 so it means 7+48
    int 21h
    
    ; To show message2 on the screen
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    ; To write value of bl on the screen
    mov ah,02h   ; to show a string
    mov dl,bl
    
    ; as a told before we can't dirctly show 0,1,2,3,4,5,6,7,8,9 on the screen becuase when we write it it 
    ; shows ascii characters.If we wanna see the number format we shoul add 48 to that number
    
    add dl,30h ; dl+30h means dl+48.dl means bl.bl means 5 so it means 5+48
    int 21h
   
    
ret

main endp
change ends
end main