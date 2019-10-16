include emu8086.inc
org 100h
;Interactive Message
mov si,offset prompt1
call print_string

;Getting input
mov dx,offset ip
mov ah,0ah
int 21h

mov si,2
A5:
   mov al,ip[si]
   mov temp[si-2],al
   inc si
   cmp si,8
   jnz A5
   
call strcmp
;1st Exit Condn
cmp dh,0
je exit 

;2nd Exit Condn
mov al,ip[si]
cmp al,22h              ;22h - Ascii of "
jne exit
inc si

A6:
    mov al,ip[si]
    inc si
    cmp al,22h
    je A11
    cmp al,25h          ;Checking if it is %
    je ac
    cmp al,20h          ;Checking if it is  space
    je A6
    ac:
        mov ah,n
        inc ah
        mov n,ah
        mov bx,0
    A7:
        mov al,ip[si]
        mov temp[bx],al
        inc si
        inc bx
        mov al,ip[si]
        ;When found %  or ' '
        cmp al,25h
        je A8
        cmp al,20h
        je A8 
        cmp al,22h
        je A8
        jmp A7
        
        A8: 
            
            cmp bx,1
            jne A9
            call check1 
            cmp dh,1
            jne exit   
            jmp A6
            
            A9:
                cmp bx,2
                jne exit
                call check2    
                cmp dh,1
                jne exit
                jmp A6
                
                    
        
A11: 
    mov al,ip[si]
    inc si
    cmp al,41
    je A12
    cmp al,44
    jne A11
    call check_ca            
    cmp dh,1
    jne exit
    inc m
    mov al,ip[si]
    ;Exit if , or & found after ,&
    cmp al,38
    je exit  
    cmp al,44
    je exit
    jmp A11

mov al,n
cmp al,m
je A12 
    

exit:
    mov si,offset prompt2
    call print_string
    ret 
A12:
    mov al,ip[si]
    cmp al,59
    jne exit
    mov si,offset prompt3
    call print_string
    
ret     

sp1  db 'cdeEfgGilosuxX',0    
sp2 db 'huhildlilfLflu',0
prompt1 db 'Enter Scan Statement : ',0
prompt2 db 'Syntax Error ....',0
prompt3 db 'Syntax Correct ',2,0
str1 db 'scanf('
var dw ?    
ip db 100,?,100 dup(?)
n db 0
m db 0 
temp db 7 dup(?)

proc check1
    mov var,si 
    mov dh,0
    mov al,temp[0]
    mov si,0
    A1:
       cmp al,sp1[si]
       jne A2
       mov dh,1
       mov si,var                 ;Dh is used like flag to check whether type specifier exists or not 
       ret
       A2:
            inc si
            cmp si,14
    jnz A1
    mov si,var
ret
endp check1


proc check2 
    mov dh,0
    mov var,si
    mov ah,temp[0]
    mov al,temp[1]
    mov si,0
    A3:
        mov bh,sp2[si]
        mov bl,sp2[si+1] 
        cmp ax,bx
        jne A4
        mov dh,1
        mov si,var                ;Dh is used like flag to check whether type specifier exists or not 
        ret
        A4: 
            add si,2
        cmp si,14
        jnz A3
        mov si,var
ret 
endp check2

proc strcmp
    mov bx,0
    mov dh,1
    lab:
        mov al,str1[bx]
        cmp al,temp[bx]
        jne l4
        jmp l5
        l4:
            mov dh,0            ;Set dh to 0 if its not Equal
            mov ah,0ah
            mov dx,4456h
            int 21h
            jmp l6 
        l5:
        inc bx
        cmp bx,6
        jnz lab
l6:
ret
endp strcmp 

proc check_ca
    mov dh,0
    mov bl,44
    mov bh,38
    mov ah,ip[si]
    inc si
    cmp ax,bx
    jne l7 
    mov dh,1
    l7:
ret 
endp check_ca
    
    
    

define_print_string
end