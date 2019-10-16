include emu8086.inc
org 100h  
mov ax,1
mov dx,0
mov cx,
proc factorial
    def:
        mul cx
        dec cx
        jnz def
    ret 
endp factorial