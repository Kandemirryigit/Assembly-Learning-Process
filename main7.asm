;=========================================
;Try to show a number output on the screen
;=========================================


numberOutput segment
main proc far

assume cs:numberOutput,ds:numberOutput

mov ax,0
mov ax,numberOutput
mov ds,ax


mov al,2  ; al-->2

mov ah,02h  ; To show a character on the screen
mov dl,al   ; dl contains al so 2
int 21h


main endp
numberOutput ends
end main


; Output is not 2 
; becaue 2 is not refers to number2 it refers to ascii table
; And in the ascii table 2 is not equal number 2 it's something else
; Between 0-9 numbers we should add 48 to show that number so we should add 30h 
; I'll demonstrate that in main8


