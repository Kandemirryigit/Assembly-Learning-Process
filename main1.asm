; I should define a segment when I start to write a program because my memory is seperated into segments
; for example(code segment,Data segment,Stack segment,Extra segment ...) so if I wanna write a program I should take a location from memory
; My program lives into segment in my memory

; Code segment: my instructions are inside code segment
; Data segment: my variables are inside data segment
; Stack segment: my stacks are inside stack segment



firstProgram segment  ;I took a location from my memory and the name is the location is firstProgram 


; Proc means function in another languages
; far: used if the procedure might be called from another segment
; near: used if the code is all in one segment

main proc far  ; I created a function called as main and I can call it from another segments

assume cs:firstProgram,ds:firstProgram  ; Defines Which segment register should point to which segment.

mov ax,firstProgram   ; ax = firstProgram
mov ds,ax   ; ds =ax so firstProgram

jmp basla  ; Jump to basla so don't see the variables measj1 and mesaj2 
           ; I don't wanted to run them right now so I jumped above them

message1 db 10,13,'Hey$'  
message2 db 10,13,'How are you$'

basla:
    mov ah,09h  ; Display a string on screen (until $ character)
    mov dx,offset message1  ; offset is important because it says the address of the message1 variable
    int 21h  ; DOS system services (input/output, files, etc.)
    
    
    ; 01h : Read a character from keyboard
    ; 02h : Display a single character
    ; 09h : Display a string ($-terminated)
    ; 0Ah : Read a string from keyboard
    ; 4Ch : Exit the program
    ; 3Dh : Open a file
    ; 3Eh : Close a file
    ; 40h : Write to a file
    ; 3Fh : Read from a file
    
    ; All of those functions comes from int 21h 
    
    
   
    mov ah,09h
    mov dx,offset message2
    int 21h

    ret ; return 



main endp  ; ends of the main function
firstprogram ends  ; Everything between - firstProgram segment and firstProgram ends - is belong to a special memory -named as firstProgram- inside my memory

end main   ; ends of the main function

