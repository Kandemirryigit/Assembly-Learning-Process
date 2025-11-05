ascii segment  ; My program lives inside ascii segment in my memory
main proc far  ; I created a function named main,and I can call it from another segment (because I used far)


assume cs:ascii,ds:ascii  ; I defined the segments 

mov ax,0      ; To clear register
mov ax,ascii  ;Load segment address into ax
mov ds,ax     ;Copy it into DS so data instructions work properly

jmp start  ; Jump to the basla so don't see mesaj 

message db 10,13,'Ascii table is above$'  ; A mesaj to the screen

start: 

; You can determine the lopp's repeat number with cl or cx 
    
   mov cl,128  ; This loop going to repeat itself 128 times

show:
   
   mov ah,02h  ; to display a single character at the screen
   mov dl,cl   
   int 21h
   
   loop show  ; decreases cl and when cl reaches 0 the loop is over
  
stop:
   
   mov ah,09h  ; to displat a sting at the screen
   mov dx,offset message 
   int 21h
   
ret ; return

main endp
ascii ends
end main
