Bits 16

jmp main

wmenu:
mov ah, 02h
mov dh, 2
mov dl, 2
int 10h
mov si, menu0
call print 

mov ah, 02h
mov dh, 4
mov dl, 2
int 10h
mov si, menu1
call print 

mov ah, 02h
mov dh, 6
mov dl, 2
int 10h
mov si, menu2
call print 

mov ah, 02h
mov dh, 8
mov dl, 2
int 10h
mov si, menu3
call print 

mov ah, 02h
mov dh, 10
mov dl, 2
int 10h
mov si, menu4
call print 
ret 


othermenus:
mov ah, 02h
mov dh, 12
mov dl, 2
int 10h
mov si, ver 
call print 

mov ah, 02h
mov dh, 14
mov dl, 2
int 10h
mov si, he 
call print 

mov ah, 02h
mov dh, 16
mov dl, 2
int 10h
mov si, he2
call print 
ret 

help:
mov ah, 02h
mov dh, 18
mov dl, 6
int 10h
mov si, he3
call print 
ret

print:
lodsb 
cmp al, 24h 
je done 

mov ah, 0eh 
int 10h
jmp print 

done:
ret 

smenu:
mov ah,02h
mov dh,dh
mov dl,0
int 10h

mov ah, 09h
mov cx, 14h
mov al, 20h
mov bl, 1fh
int 10h

mov ah,02h
mov dh,dh
mov dl,14h
int 10h

mov ah, 09h
mov cx, 01h
mov al, 20h
mov bl, 78h
int 10h

inc dh

cmp dh, 30
je return

jmp smenu

return:
ret

keybord: 
mov ah, 0
int 16h 

cmp ah, 14 
je _backs

cmp ah,28 
je _enter

mov ah, 0ah 
mov cx, 1
int 10h 

mov ah, 02h 
inc dl 
int 10h 

cmp dl,80
je _enter


jmp keybord

_backs:
mov ah, 03h
int 10h 

cmp dl, 21
je _backell

mov ah, 02h 
dec dl
int 10h 

mov ah, 0ah 
mov cx, 1
mov al, 20h 
int 10h 

jmp keybord

_backell:
cmp dh, 0
je keybord
mov ah, 02h 
dec dh
mov dl, 79 
int 10h

_cursorsvissza:
mov ah, 08h
int 10h 
cmp al, 20h 
je _spacevan
jmp keybord

_spacevan: 
mov ah, 03h 
int 10h 
cmp dl, 21 
je keybord
mov ah, 02h 
dec dl 
int 10h 
jmp _cursorsvissza

_enter:
mov ah, 02h
inc dh 
mov dl,21
int 10h 

jmp keybord

main:
mov ah, 01h
mov cx, 0007h
int 10h

mov ah,02h
mov dh,0
mov dl,0
int 10h

mov ah, 09h
mov cx, 1000h
mov al, 20h
mov bl, 8fh
int 10h

mov ah,02h
mov dh,0
mov dl,0
int 10h

call smenu

call wmenu

call othermenus

call help

mov ah,02h 
mov dl, 21
mov dh, 0
int 10h

jmp keybord

menu0 db 'menu test 0$'
menu1 db 'menu test 1$'
menu2 db 'menu test 2$'
menu3 db 'menu test 3$'
menu4 db 'menu test 4$'
ver db'the_os_ver_is_1.0$'
he db 'the_os_is_made_on_$'
he2 db 'jun_3$'
he3 db 'do not have command$'

times 512-($-$$) db 0