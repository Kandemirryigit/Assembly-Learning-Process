;-----------------------------------------------------------------------------------------
;TAKE A STRING AND CHARACTER FOM USER THEN CHECK IF THAT CHARACTER IS INSIDE STRING OR NOT
;-----------------------------------------------------------------------------------------


PRINT_MESSAGE MACRO msg
    mov ah,09h
    mov dx,offset msg
    int 21h
endm


data segment
    message1 db 10,13,"Enter a string: $"
    message2 db 10,13,"Enter a character: $"
    message3 db 10,13,"The string contains that character $"
    message4 db 10,13,"The string doesn't contain that character $"
    
    string db 50  ; Max Lenght
           db ?   ; Actual Lenght
           db 50 dup(?)  ; Buffer
    
    search_ch db ?     ; Character to search
data ends



code segment
assume cs:code,ds:data  


start:
    mov ax,data
    mov ds,ax
    
    
    ; To take string from user
    PRINT_MESSAGE message1
    mov ah,0Ah
    mov dx,offset string
    int 21h
    
    ; To take character from user
    PRINT_MESSAGE message2
    mov ah,01h
    int 21h
    mov search_ch,al
   
    ; To find the lenght of the string
    mov si,offset string+2   ; Start text
    mov cl,[string+1]  ; Lenght of string
    xor ch,ch   ; cx =lenght
    
    
search:
   cmp cx,0
   je not_found
   
   mov al,[si]
   cmp al,search_ch
   je found
   
   inc si
   dec cx
   jmp search
   
   
found:
   PRINT_MESSAGE message3
   jmp exitProgram
   
   
not_found:
   PRINT_MESSAGE message4
   jmp exitProgram
   
exitProgram:
   mov ah,4Ch
   int 21h
   
code ends
end start
    
    
    
    
    
    
    

    
    
    
    
    


