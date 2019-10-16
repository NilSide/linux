include emu8086.inc
org 100h
call scan_num
mov n,cl
call factorial
mov a,ax

call scan_num
mov r,cl
call factorial
mov bx,ax           ;Storing r! in bx

mov cl,n
sub cl,r
call factorial
mov c,ax

mul bx              ; r! * (n-r)!
mov bx,ax
mov ax,a
div bx


ret 

a dw 0
b dw 0
c dw 0 
n db 0
r db 0

proc factorial
    mov ax,1
    mov dx,0
    def:
        mul cx
        dec cx
        jnz def
    ret
endp procedure

define_scan_num


