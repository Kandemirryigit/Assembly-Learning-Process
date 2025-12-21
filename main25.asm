;--------------------------------------------
; COPY FULL STRING FROM SOURCE TO DESTINATION
;--------------------------------------------

data segment
    src db "hello",'$'  ; Source string
    dst db 6 dup(0)     ; Destination string,empty
data ends


code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov si,offset src  
    mov di,offset dst
    mov cx,6  ; number of bytes to copy
    
    rep movsb  ; repeat movsb cx times
    
    ;now dst= "hello"
    
  
    ; To display src
    mov ah,09h
    mov dx,offset src
    int 21h
    
    
    ; To display dst
    mov ah,09h
    mov dx,offset dst
    int 21h
    
    
    mov ah,4Ch
    int 21h
    
code ends
end start
    
    