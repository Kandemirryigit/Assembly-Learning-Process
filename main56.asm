;------------------
;PALINDROME CHECKER
;------------------

data segment
    message1 db 10,13,"Enter a string: $"
    message2 db 10,13,"It is a palindrom string $"
    message3 db 10,13,"It is not a palindrome string $"
    
    original db 50  ; Max Lenght
             db ?   ; Actual Lenght
             db 50 dup(?)  ; String data
             
    reversed db 50 dup(?)
             
data ends


code segment
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    ; To display message1 on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    ; To take string input
    mov ah,0Ah
    mov dx,offset original
    int 21h
    
    ; SI -> Start of the string
    mov si,offset original+2  
    
    ; cl = Lenght of the string
    mov cl,[original+1]
    xor ch,ch
    
   ; DI -> End of reversed string
   mov di,offset reversed
   add di,cx
   dec di
   
   
reverseLoop:
   mov al,[si]
   mov [di],al
   inc si
   dec di
   loop reverseLoop
   
   
   ; compare original and reversed
   mov si,offset original+2
   mov di,offset reversed
   mov cl,[original+1]
   xor ch,ch
   
compareLoop:
   mov al,[si]
   cmp al,[di]
   jne notPalindrome
   inc si
   inc di
   loop compareLoop
   
palindrome:
   mov ah,09h
   mov dx,offset message2
   int 21h
   jmp exit
   
notPalindrome:
   mov ah,09h
   mov dx,offset message3
   int 21h
   
   
exit:
   mov ah,4Ch
   int 21h
   
   
code ends
end start
   
   
    

    
    
    
    