org 100h
mov si,-1
mov bx,0 
lab:
    inc si 
    mov al,0          
    add al,i
    inc i
    mov res[bx],al
    inc bx
    mov res[bx],46
    inc bx
    mov res[bx],32
    inc bx
    l2: 
        cmp str[si],32
        je lab
        mov al,str[si]
        call type
        mov res[bx],al
        inc si
        inc bx
        cmp si,24
        je l3
        jmp l2
l3:
mov ax,offset res 
    
    
ret

str db 'this is MY FIRST ALP lab'
res db 35 dup(?)            ;Size 35
i db 48                     ;Ascii Value of 0

proc type                   ;Procedure to convert ltou and utol
    cmp al,97
    jge l6
    jle l7
    l6:
        cmp al,122
        jle l8
        jmp l10
    l8:
        sub al,20h
        jmp l10
    l7:
        cmp al,65
        jge l9
        jmp l10
    l9:
        add al,20h
    l10:
ret
endp type
    
 