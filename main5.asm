;===============================
;Write hello world on the screen
;===============================



helloWorld segment  ; My program lives here inside my memory
main proc far       ; I created a function named main.I can call it in another segment

assume cs:helloWorld,ds:helloWorld  ; I defined segment's registers

mov ax,0  ; To clear ax
mov ax,helloWorld  ; Load segment address into ax
mov ds,ax          ;Copy it into DS so data instructions work properly

jmp start 

message db 10,13,'Hello World$'  ; Variable1


start:  ; Start label

    mov ah,09h ; to show a string on the screen
    mov dx,offset message   ; To give message's address to the dx
    int 21h
   
stop:  ; Stop label

    mov ah,4Ch   ; Exit program
    int 21h


ret ; return

main endp
helloWorld ends
end main