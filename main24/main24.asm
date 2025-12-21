;-----------------------------------------
; COPY ONE BYTE FROM SOURCE TO DESTINATION
;-----------------------------------------

data segment
    src db 'H','e','l','l','o','$'   ; Source string
    dst db 5 dup(?)  ; Destination string ,empty
data ends

code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax    ; Set ds to data segment
    mov es,ax    ; set es to data segment (for destination)
    
    mov si,offset src   ; si points to source
    mov di,offset dst  ; di points to destination
    
    movsb ; Copies one byte from si to di
    
    mov byte ptr [di],'$'  ; Places a $ after the copied byte.
    
   
    
    
    ; Display the source 
    mov ah,09h
    mov dx,offset src
    int 21h 
    
    ; Display the destination
    mov ah,09h
    mov dx,offset dst
    int 21h
    
    ; End the porgram
    mov ah,4ch
    int 21h
    
    
    
code ends
end start
    
 