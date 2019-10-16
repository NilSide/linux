include emu8086.inc
org 100h
lea si,prompt1
call print_string
call scan_num
mov x,cl
call scan_num 
mov y,cl

mov al,x
add al,y
xor ah,ah
mov si,offset prompt2
call print_string
call print_num
mov al,x
mul y 
mov si,offset prompt4
call print_string
call print_num  

lea si,prompt3
call print_string
call scan_num
mov a,cx
call scan_num 
mov b,cx

mov ax,a
add ax,b
mov si,offset prompt2
call print_string
call print_num
mov ax,a
mul y 
mov si,offset prompt4
call print_string
mov bx,ax
mov ax,dx
call print_num
mov ax,bx
call print_num
ret 

a dw ?
b dw ?
x db ?
y db ?
prompt1 db 'Enter 2 8 bit values : ',0
prompt2 db 'Additon Answer is : ',0           
prompt3 db 'Enter 2 16 bit values : ',0
prompt4 db 'Multiplication Answer is : ',0
define_scan_num
define_print_string
define_print_num
define_print_num_uns
end 