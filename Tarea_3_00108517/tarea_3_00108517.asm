org 100h

section  .text

    call texto
    call cursor

    call phrase
    call phrase2
    call phrase3
    call kbwait

    int 20h

texto: 
        mov ah,00h
        mov al,03h
        int 10h

cursor:
        mov ah, 01h
        mov ch, 00000000b
        mov cl, 00001110b
        int 10h
        ret

w_char:
        mov ah, 09h
        mov al, cl
        mov bh, 0h
        mov bl, 00001111b
        mov cx, 1h
        int 10h
        ret

kbwait:
        mov ax, 0000h
        int 16h
        ret

m_cursor:
        mov ah, 02h
        mov dx, di
        mov dh, 3d
        mov bh, 0h
        int 10h
        ret

phrase: mov di,20d
lupi:   
        mov cl, [msg+di-20d]
        call m_cursor
        call w_char
        inc di
        cmp di, len
        jb lupi
        xor ax,00h
        ret


w_char2:
        mov ah, 09h
        mov al, cl
        mov bh, 0h
        mov bl, 00001111b
        mov cx, 1h
        int 10h
        ret

m_cursor2:
        mov ah, 02h
        mov dx, di
        mov dh, 13d
        mov bh, 0h
        int 10h
        ret

phrase2: mov di,40d
lupi2:   
        mov cl, [msg2+di-40d]
        call m_cursor2
        call w_char2
        inc di
        cmp di, len2
        jb lupi2
        xor ax,00h
        ret



w_char3:
        mov ah, 09h
        mov al, cl
        mov bh, 0h
        mov bl, 00001111b
        mov cx, 1h
        int 10h
        ret

m_cursor3:
        mov ah, 02h
        mov dx, di
        mov dh, 23d
        mov bh, 0h
        int 10h
        ret

phrase3: mov di,5d
lupi3:   
        mov cl, [msg3+di-5d]
        call m_cursor3
        call w_char3
        inc di
        cmp di, len3
        jb lupi3
        xor ax,00h
        ret

section .data
msg db "hola como estas?"
len equ $-msg+20d

msg2 db "Bien y tu?"
len2 equ $-msg2+40d
msg3 db "Bien bien"
len3 equ $-msg3+5d



