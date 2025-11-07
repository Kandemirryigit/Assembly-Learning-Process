;=======================================================================================================================
; Take two number between 0-9 from keyboard and divide number1 to number2 then show division and remainder on the screen
;=======================================================================================================================



; Macro helps us to not repeat ourself
; We can define a macro one time and we can use it late multiple times

; Created a macro to write a string on the screen
writeMessage macro msg
    mov ah,09h
    lea dx,msg
    int 21h
endm


; Created a macro to take number from keyboard
takeNumber macro
    mov ah,01h
    int 21h
    sub al,30h  ; As I explained before if we are just storing the value then we should sub 48 from the number.If it's between 0-9
endm


; Created a macro to show a number on the screen
writeNumber macro num
    mov ah,02h
    mov dl,num
    add dl,30h  ; As I explained before if we want to show a number on the screen we should add 48 to it.If it's between 0-9
    int 21h
endm





divProccess segment
main proc far
assume cs:divProccess,ds:divProccess

mov ax,0
mov ax,divProccess
mov ds,ax


jmp takeNumber1

message1 db 10,13,'Number1: $'
message2 db 10,13,'Number2: $'
message3 db 10,13,'Division: $'
message4 db 10,13,'Remainder: $'

; This variables Works for just 1 character
; If you wanna see how can we define for a string you can look the other files

divided db ?   ; To store number1
dividing db ?  ; To store number2 

division db ?  ; To store division
remainder db ?  ; To store remainder



takeNumber1:
    
    ; To display - Number1: - message on the screen
    writeMessage message1
    
    ; To take number1 
    takeNumber 
    mov divided,al  ; We are going to store the number in the divided variable
    
takeNumber2:
    
     ; To display - Number2: - message on the screen
     writeMessage message2
        
     ; To take number2
     takeNumber
     mov dividing,al  ; We are going to store the number in the dividing variable
       
        
divisionProccess:
     
     ; This is an important proccess 
     ; If we don't give 0 to the ah it can effect my proccess
     ; Because we store the remainder in the ah.If we don't give ah 0 it can effect our program
     mov ah,0
     
     ; I moved divided to al register because I'll use div command and it wants this one
     mov al,divided
     
     ; Div command works like this ax/dividing
     ; I have divided variable in the ax (in al field)
     ; div makes division al,dividing
     div dividing 
     
     ; div command stores division in the al,remainder in the ah
     ; So if we wanna take mod a number we can also use div command cause the value in the ah is remainder 
     
     
     mov division,al   ; As I told before our division value is in the al 
     mov remainder,ah  ; As I told before our remainder value is in the ah
     
     
show:
     
     ; To display - Division: - message on the screen
     writeMessage message3
     
     ; To write division variable on the screen
     writeNumber division
     
     ; To display - Remainder: - message on the screen
     writeMessage message4
     
     ; To write remainder variable on the screen 
     writeNumber remainder
    
     
ret
 

main endp
division ends
end main