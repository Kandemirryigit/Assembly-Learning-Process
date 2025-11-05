;====================================================
; To determine the number ( between 0-9 ) even or odd
;====================================================



; With macro I don't have to always repeat myself 
; I can define it and I can reuse it 
; It looks like functions in another languages not exactly but similar



; I defined writeMessage macro and msg parameter 
; I can call this macro below
; I can change the msg parameter and I can give another messages there
writeMessage macro msg
    mov ah,09h
    mov dx,offset msg
    int 21h
endm  


; I defined takeNumber macro to take number from keyboard
takeNumber macro 
    mov ah,01h
    int 21h
    sub al,30h  ; To convert ascii to number
endm




evenOdd segment
main proc far
assume cs:evenOdd,ds:evenOdd

mov ax,0
mov ax,evenOdd
mov ds,ax

jmp takeNumber1

message1 db 10,13,'Write a number: $'
message2 db 10,13,'The number is even $'
message3 db 10,13,'the number is odd $'



takeNumber1:
    
    ; To display - Write a number: - on the screen
    writeMessage message1
    
    ; To take a number from user
    takeNumber
   
    
control:
    
    ; We don't want ah to effect our proccess so we gave it o 
    mov ah,0 
   
    ; div works like this ax/bl 
    ; I wanna divide to 2 cuz of that I gave bl 2 
    ; If I wanna divide from 5 then I should define bl as 5 so bl,5
    mov bl,2
    
    ; div bl means ax/bl 
    ; The remainder is going to be inside ah.This is important cause I'll compare ah
    div bl
    
    ; Compare ah with 0
    ; If ah==0 it means the number is even
    ; If ah==1 it means the number is odd
    cmp ah,0
    
    ; If ah is eqaul to zero then jump to evenNumber
    je evenNumber 
    
    ; If ah is not equal to 0 then jump to oddNumber
    jne oddNumber
    
    
evenNumber:
    
    ; To display - The number is even - on the screen 
    writeMessage message2
    jmp exit
   
    
oddNumber:
    
    ; To display - The number is odd - on the screen 
    writeMessage message3 
    jmp exit
    

exit:
    
    ; To stop program
    mov ah,4Ch  
    int 21h



main endp
evenOdd ends
end main














