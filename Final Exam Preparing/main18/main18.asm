;------------------------------------------------
; TAKE 2 DIGIT NUMBER THEN TAKE 1 DIGIT NUMBER
; DIVIDE WITHOUT 'DIV' (REPEATED SUBTRACTION)
; SHOW ALL RESULTS SAFELY
;-------------------------------------------------

data segment
    message1 db 10,13,"Enter a 2-digit number: $"
    message2 db 10,13,"Enter a 1-digit number: $"
    message3 db 10,13,"Divided: $"
    message4 db 10,13,"Dividing: $"
    message5 db 10,13,"Quotient: $"
    message6 db 10,13,"Remainder: $"
    
    twoDigitNumber db ?
    oneDigitNumber db ?
    quot_final     db ?
    rem_final      db ?
    
    ten db 10
data ends

code segment
assume cs:code, ds:data

start:
    mov ax, data
    mov ds, ax

;--- INPUT 2-DIGIT NUMBER ---
    mov ah, 09h
    mov dx, offset message1
    int 21h
    
    mov ah, 01h      ; First digit (tens)
    int 21h
    sub al, 30h
    mul ten          ; Result in AX (AH is now modified)
    mov bl, al       ; Store result in BL
    
    mov ah, 01h      ; Second digit (ones)
    int 21h
    sub al, 30h
    add bl, al       ; BL = Total number
    mov twoDigitNumber, bl
    
;--- INPUT 1-DIGIT NUMBER ---
    mov ah, 09h
    mov dx, offset message2
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, 30h 
    mov oneDigitNumber, al  

;--- DIVISION BY ZERO CHECK ---
    cmp al, 0
    je exitProgram   ; Safety: prevents infinite loop if dividing by 0

;--- MANUAL DIVISION LOOP ---
    mov al, twoDigitNumber
    mov cl, 0        ; Quotient counter

divisionLoop:
    cmp al, oneDigitNumber
    jb finished_div  
    
    sub al, oneDigitNumber
    inc cl
    jmp divisionLoop
    
finished_div:
    mov quot_final, cl
    mov rem_final, al

;--- SHOW RESULTS ---
showResult:
    ; 1. Display Divided
    mov ah, 09h
    mov dx, offset message3
    int 21h
    mov al, twoDigitNumber
    call printValue

    ; 2. Display Dividing
    mov ah, 09h
    mov dx, offset message4
    int 21h
    mov dl, oneDigitNumber
    add dl, 30h
    mov ah, 02h
    int 21h

    ; 3. Display Quotient
    mov ah, 09h
    mov dx, offset message5
    int 21h
    mov al, quot_final
    call printValue

    ; 4. Display Remainder
    mov ah, 09h
    mov dx, offset message6
    int 21h
    mov al, rem_final
    call printValue

exitProgram:
    mov ah, 4Ch
    int 21h

;--- HELPER PROCEDURE TO PRINT 2 DIGITS ---
printValue proc
    xor ah, ah       ; CRITICAL: Clear AH to prevent Divide Overflow
    div ten          ; AL = Tens, AH = Ones
    mov bx, ax       ; Store both in BX
    
    mov dl, bl       ; Print Tens
    add dl, 30h
    mov ah, 02h
    int 21h
    
    mov dl, bh       ; Print Ones
    add dl, 30h
    int 21h
    ret
printValue endp

code ends
end start