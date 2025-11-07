;======================================================================
; Control the word that we took from keyboard is starting with a or not
;======================================================================




control segment
main proc far
assume cs:control,ds:control

mov ax,0
mov ax,control
mov ds,ax


jmp takeInput

message1 db 10,13,'Enter a word: $'
message2 db 10,13,'The word is starting with a $'
message3 db 10,13,'The word is not starting with a $'

word db 50
     db ?
     db 50 dup('$')



takeInput:

    ; To display - Enter a word - message on the screen
    mov ah,09h
    lea dx,message1
    int 21h
    
    ; To take a string input from user
    mov ah,0Ah
    mov dx,offset word
    int 21h
    
    
compare:

    ; to take al register our 2.index
    lea bx,word ; We are going to control the array with xlat so we should send our word to the bx register
    mov al,2 ; first 2 [ 0 and 1 ] indis is about buffer.Our string starts from 2. indis
    xlat  
    
    ; To control our 2.index
    cmp al,'a'
    
    ; Conditional statements
    je startsWitha  ; Jump if equal to the startsWitha label
    jne notStartWitha  ; Jump if not equal to the notStartWitha label
    
    
    
startsWitha:
    
    ; To display - The word is starting with a - message on the screen
    mov ah,09h
    lea dx,message2
    int 21h
    
    ret
    


notStartWitha:

    ; To display - The word is not starting with a - message on the screen
    mov ah,09h
    lea dx,message3
    int 21h
    
    ret

    

main endp
control ends

end main
