;==========================================================================================================================
; Calculation with two number input is between 0-9 and we assume result has a single character like 3,4,7,5 not 19,42,56,33
;==========================================================================================================================


calculation segment
main proc far

assume cs:calculation,ds:calculation

mov ax,0
mov ax,calculation
mov ds,ax


jmp takeNumber1

message1 db 10,13,'First number: $'
message2 db 10,13,'Second number: $'
message3 db 10,13,'Result: $'



takeNumber1:
 
    ; To display - First number: - message on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h

    
    ; To take a character from keyboard
    mov ah,01h
    int 21h
    
    
    ; To convert ascii character to number.Because of that I added 48 to the number.
    sub al,30h 
    
    
    ; To send number al to bl register.Because it stores.
    mov bl,al 
   
    
takeNumber2:
    
    ; To display - Second number - message on the screen
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    ; To take a character from keyboard
    mov ah,01h
    int 21h
    
    ; To convert ascii character to number
    sub al,30h  
   
    
calc:
    ; We stored 2 values one of them inside bl and one of them inside al
    ; bl--> first number
    ; al--> second number
    ; I already have a value on bl I added al to it 
    ; So bl stores the result calculation
    add bl,al
   
    
print:
    
    ; to display - Result - message on the screen
    mov ah,09h
    mov dx,offset message3
    int 21h
    
    mov ah,02h
    mov dl,bl ; 02h takes the character from dl because of that I send bl to dl
    add dl,30h ; to convert ascii character to number
    int 21h
 
ret
    
    
main endp
calculation ends
end main



; when we want to make an arithmetic operation (add,sub,mult,div) we should sub 30h from the number
; When we wamt to make a print on the screen we should add 30h to the number

