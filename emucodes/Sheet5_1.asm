include emu8086.inc
org 100h
xor bx,bx
lab:
    cmp str[bx],97
    jge l2:
    jmp l3:
    l2:
        cmp str[bx],122
        jle l4
        jmp l3
    l4:
        mov al,str[bx]
        sub al,20h
        mov str[bx],al
    l3:
        inc bx
        cmp str[bx],0
        jnz lab:
mov si,offset str
call print_string
ret 

str db 'Hello_this_is_psgtech',0
define_print_string