;-------------------
;STRING UTILITY MENU
;-------------------


data segment
    msg db 'H','e','l','l','o','$'
    menu db 10,13,"1-Lenght  2-Reverse 3-Exit $"
    message1 db 10,13,"Length of the string is: $"
    message2 db 10,13,"Reverse of the string is: $"
    choice db ?
data ends

code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
show_menu:
    
    ; To display menu on the screen
    mov ah,09h
    mov dx,offset menu
    int 21h
    
    ; To take a character input from user
    mov ah,01h
    int 21h
    
    ; The character that we toke from user was inside al register
    ; I sent it to the choice variable
    mov choice,al
    
    cmp choice,'1'  ; Compare choice with 1 
    je do_length    ; Jump if equal
    
    cmp choice,'2'  ; Compare choice with 2
    je do_reverse   ; Jump if equal
     
    cmp choice,'3'  ; Compare choice with 3
    je exit         ; Jump if equal
    
    
    ; If choice is not equal to '1','2' or '3' then show menu again
    jmp show_menu
    
    
    
    
do_length:
    
    mov si,offset msg   ; SI -> string msg
    call strlen
  
    
    ; To display message1 on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    mov ax,cx
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h

    
    jmp show_menu
    
  
    
    
    
do_reverse:
    mov si,offset msg   ; SI -> string msg
    
    
find_end:
    
    cmp byte ptr [si],'$' ; Check that if SI equal to the '$' or not
    je set_pointers   ; If SI equals to '$' jump to set_pointers
    inc si            ; If not equal increase si
    jmp find_end      ; And loop
    
set_pointers:
    dec si          ; If SI equals to '$' decrease it
    mov di,offset msg   ; and DI -> msg
    
reverse:
    cmp di,si
    jge done
    
    mov al,[di]
    mov bl,[si]
    
    mov [di],bl
    mov [si],al
    
    inc di
    dec si
    jmp reverse
    
    
done:
    
    ; To display message2 on the screen
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    ; To display the reverse string on the screen
    mov ah,09h
    mov dx,offset msg
    int 21h
    
    jmp show_menu
    
    
    

    
    
    
    
    
;------------------------
;STRLEN PROCEDURE
;-----------------------

strlen proc

    mov cx,0
    
next_char:
    cmp byte ptr [si],'$'
    je done_strlen
    inc cx
    inc si
    jmp next_char
    
done_strlen:
    ret
    
strlen endp


exit:
    ; To exit the program
    mov ah,4Ch
    int 21h
    


code ends
end start

    
    
    
  
    

    
    
    
    
    
    