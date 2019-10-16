include emu8086.inc
org 100h
mov si,offset p1
call print_string
mov ah,0ah
mov dx,offset str
int 21h
mov bx,2
mov cl,str[1]
mov dx,0
l1:
    call check_vowel
    inc bx
    loop l1   
mov ax,dx
call print_num
    
ret

vow db 'aeiou',0
str db 20,?,20 dup(' ')    
p1 db 'Enter A Strng : ',0
    
proc check_vowel
    mov si,0
    l4: 
        mov al,vow[si]
        cmp str[bx],al
        jne l5
        inc dx
        ret
        l5:
            inc si
            cmp si,5
            jnz l4
    ret
endp check_vowel  

define_print_string 
define_print_num
define_print_num_uns
end
        
    


