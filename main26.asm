;------------------------------------------
; READ FROM SOURCE AND WRITE TO DESTINATION
;------------------------------------------

data segment
    src db "hello",'$'   ; Source string
    dst db 6 dup(0)       ; Destination string
data ends


code segment
assume cs:code,ds:data

start: 
    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov si,offset src   ; Source pointer
    mov di,offset dst   ; Destination pointer
    mov cx,6  ; number of bytes to copy
    
    
copy_loop:
    lodsb    ; load byte from [si] int al
    stosb    ; store al into [di]
    loop copy_loop   ; decremet cx and repeat until cx=0
    
    mov byte ptr [di],'$'
    
   
    
    
print:
    
    ; Display src on the screen
    mov ah,09h
    mov dx,offset src
    int 21h
    
    
    ; Display dst on the screen
    mov ah,09h
    mov dx,offset dst
    int 21h
    
    
programEnds:
    
    mov ah,4Ch
    int 21h
    
    
code ends
end start