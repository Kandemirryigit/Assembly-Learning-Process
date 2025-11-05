
;======================================================
; Take a string from keyboard and show it on the screen
;======================================================



takeString segment
main proc far

assume cs:takeString,ds:takeString

mov ax,0
mov ax,takeString
mov ds,ax


jmp firstMessage

message1 db 10,13,'Please write a string: $'
message2 db 10,13,'The string is: $'


;This creates a memory structure for the input buffer, which is required by the DOS function AH = 0Ah (?Buffered Keyboard Input?).

buffer db 20   ;This is the maximum number of characters the user can type (not including Enter). In this example, it's 20.
       db ?    ;After input, DOS puts here the number of characters actually typed by the user.
       db 20 dup('$')   ;This is where the actual input characters are stored. We allocate 20 bytes (20 dup('$')) for them.


       
; Let's assume that user typed Hello
  
       
; buffer[0] --> 20 ---Maximum allowed lenght
; buffer[1] --> 5  ---User typed 5 characters
; buffer[2] --> 'H' --- First character
; buffer[3] --> 'e' --- Second character
; buffer[4] --> 'l' --- Third character
; buffer[5] --> 'l' --- Fourth character
; buffer[6] ---> 'o' --- Fifth character
; buffer[7] ---> (13) --- DOS automatically adds a carriage return (Enter key)
; buffer [8..] --->   --- Filler-unused space
       
       
       
       
       

firstMessage:

    ; To show - Please write a string - message on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
  
 
takeInput:
    
    ; To take a string input from user
     
    mov ah,0Ah  ; To take a string input from user
    mov dx,offset buffer  ; Take that input to the buffer
    int 21h
   
   
secondMessage:
    
    ; To show - The string is: - message on the screen
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    
    ; To show the string that we took from user on the screen
    
    mov ah,09h
    mov dx,offset buffer+2   ; Start to read buffer+2 because I showed it above
    int 21h
   
    
    
ret
    

main endp
takeString ends
end main