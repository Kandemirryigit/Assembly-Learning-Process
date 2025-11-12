;===========================================================
; To determine how much even number includes given 20 number
;===========================================================


findEven segment
main proc far
assume cs:findEven,ds:findEven

mov ax,0
mov ax,findEven
mov ds,ax

jmp start

message1 db 10,13,'Enter 20 single-digit number: $'
message2 db 10,13,'Even numbers count: $'
message3 db 10,13,' $'
message4 db 10,13,'Number: $'



start:

    ; To display - Enter 20 single-digit number: - message on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    ; To create a loop that is going to repeat itself 20 times
    ; We should store the repeat time of the loop inside cx register
    mov cx,20
    
    ; To store even numbers
    ; Think bl register as a variable to count something ( count )
    mov bl,0
    
    ; To create an empty line
    mov ah,09h
    mov dx,offset message3
    int 21h
    
inputLoop: 
    
    ; To display - Number: - message on the screen
    mov ah,09h
    mov dx,offset message4
    int 21h
    
    ; To take one character input from user
    ; We are gonna store the input inside al register
    mov ah,01h
    int 21h
    
    ; To convert ASCII -> Number
    sub al,30h 
    
    ; To clear ah register
    ; because div stores remainder in the ah register
    mov ah,0
    
    ; We are going to divide to 2 cuz of that we should give dl 2
    mov dl,2
    
    ; And the answer stores itself inside ah register
    div dl
    
    ; Compare ah register with 0
    cmp ah,0
    
    ; If ah register is not not equal to zero then it means the number is odd
    ; Then jump to notEven label
    jne notEven
    
    ; Else increase bl register 1
    inc bl
    
    
notEven:
    
    ; Repeat inputLoop blocks because our loop is there
    loop inputLoop
    
    ; To display - Even numbers count: - message on the screen
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    
    
printTwoDigit:
    
    ; Our count of even numbers was inside bl register wen sent it to the al register
    mov al,bl
    
    cmp al,10
    jb printJustOnesDigit
    
    ; To clear our ah register
    mov ah,0
    
    ; div works with dl we are gonna divide the number 10
    mov dl,10
    
    ; the division in the al,remainder is in the ah
    div dl
    
    ; We should add 30h to convert our number from ASCII to number
    add al,30h
    
    ; 02h works with dl register so we should sent our number to the dl register
    mov dl,al
    
    ; To print tens digit 
    mov ah,02h
    int 21h
    
    ; Because the remainder is in the ah
    mov al,ah
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h
    
    jmp programEnds
    
    
    
printJustOnesDigit:
    
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h
    
    
programEnds:
    
    mov ah,4Ch
    int 21h

    

main endp
findEven ends

end main
