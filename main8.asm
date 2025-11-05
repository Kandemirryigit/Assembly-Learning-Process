
;=================================
; Show number (0-9) on the screen 
;================================



numberOutput segment 
main proc as

assume cs:numberOutput,ds:numberOutput

mov ax,0
mov ax,numberOutput
mov ds,ax


mov al,2  ; al-->2
add al,30h  ; al+48 

mov ah,02h  ; to show a character on the screen
mov dl,al   ; dl contains al so dl contains 2
int 21h


main endp
numberOutput ends
end main

; as I told main7 if I add 48 to number between 0 to 9 I can see the numbers value
; At the moment I don't know what to do with other numbers 15,234,42,566........