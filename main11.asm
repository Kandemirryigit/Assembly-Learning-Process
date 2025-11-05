;===========================================
; Wait for a key press then close the screen
;===========================================

pressWait segment
main proc far

assume cs:pressWait,ds:pressWait

mov ax,0
mov ax,pressWait
mov ds,ax

program:
    mov ah,08h  ; used to read a single character from the keyboard without echoing it on the screen.
    int 21h

    mov ah,4Ch ; Exit the program
    int 21h



main endp
pressWait ends
end main