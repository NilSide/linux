include emu8086.inc
org 100h
call scan_num
mov ax,cx
mov dx,0
mov bx,2
div bx
cmp dx,0
jnz lab
printn 'Even'
jmp lab2
lab:
printn 'Odd'
lab2:
ret
define_scan_num
end