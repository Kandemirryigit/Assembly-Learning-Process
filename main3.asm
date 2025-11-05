
;===============================
; I Created a loop to count 0-9
;===============================




myLoop segment  ; My program lives here inside my memory
main proc far   ; I created a function named main.And I can call it in another segment ( because I used far)

assume cs:myLoop,ds:myLoop  ; Defined my segments' registers

mov ax,0  ; To clear ax
mov ax,myLoop   ;Load segment address into ax
mov ds,ax       ;Copy it into DS so data instructions work properly


jmp start  ; don't see the message1 variable.Jump to the start label

; db means define byte
; 10 Moves the cursor down one line
; 13 Moves the cursor to the beginning of the line
; So 10,13 means ?Go to the beginning of the next line.?


message1 db,10,13,'Hello This is a loop from 0-10$'  ; A string variable 



start:  ; Start label
 
    mov cl,9  ; The loop's repeat number - 10 -
    mov dl, '1' ; ascii code for 1
   
    
show:  ; Show label
     
    mov ah,02h  ; To show a character at the screen
    int 21h
    
    inc dl ; move to next number ( so next ascii character )
    loop show  ; Repeat until cl is 0 
    
    
stop:  ; Stop label
    
    mov ah,09h  ; To show a string on the screen
    mov dx,offset message1
    int 21h
    
    
main endp
myLoop ends
end main
    
  


