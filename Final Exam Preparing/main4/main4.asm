;-----------------------------------------------------------------
; TAKE 10 NUMBERS(0-9) AND COUNT HOW MANY NUMBER IS GREATER THAN 3
;------------------------------------------------------------------

data segment
    message1 db 10,13,"Number: $"
    message2 db 10,13,"Result: $"
data ends


code segment
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    
    mov cx,0  ; I defined cx=0 to count the loop
    mov bl,0  ; I defined bl=0 to count the count of numbers that is greater than 3
    
    
takeNumber:
    
        
      mov ah,09h
      mov dx,offset message1
      int 21h
      
      mov ah,01h
      int 21h
      
      sub al,30h
      
      ; Increase cx
      inc cx
      
      cmp al,3
      jg greater
       
      
      cmp cx,9       ; Compare cx with 10
      jl takeNumber    ; If cx lower than 10 go to takeNumber
      jg showResult   ; If cx greater than 10 go to showResult
      
      
      
greater:
      inc bl
      jmp takeNumber
      
      
showResult:
      
      mov ah,09h
      mov dx,offset message2
      int 21h
      
      add bl,30h
      mov dl,bl
      
      mov ah,02h
      int 21h
      
      
exitProgram:
      
      mov ah,4Ch
      int 21h
      
      
code ends
end start
      
      
      
      
      
      
      
      
      
