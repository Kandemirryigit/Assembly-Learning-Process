
;=========================================
; Write 5 times I love you on the screen
;=========================================




sendMessage segment  ; My program lives inside sendMessage segment in my memory
main proc far        ; I created a dunction named main.I can call it from another segment cuz I used far

assume cs:sendMessage,ds:sendMessage  ; I defined segment's registers

mov ax,0  ; To clear ax
mov ax,sendMessage  ;Load segment address into ax
mov ds,ax   ; ;Copy it into DS so data instructions work properly

jmp start ; Dont see message variable.Jump to start label

message1 db 10,13,'I love You$'  ; Variable1
message2 db 10,13,'The loop is over$' ; Variable2


start:  ; Start label

    mov cl,5 ;Loop going to repeat itself 100 times
   
show:  ; Show label
    
    mov ah,09h  ; to show a string on the scren
    mov dx,offset message1   ; ?Put the address of message1 into dx.?
    int 21h
    
    loop show ; Decrases cl and when cl reaches 0 lopp is over
   
    
stop:   ; Stop label
    mov ah,09h 
    mov dx,offset message2   ; ?Put the address of message2 into dx.?
    int 21h
   
ret ; return
    
main endp
senMessage ends
end main
    
