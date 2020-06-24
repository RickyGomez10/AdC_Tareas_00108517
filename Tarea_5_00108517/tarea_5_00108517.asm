org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	di, di 
    xor     si, si
    
    mov si, 75d ; columna a empezar a printear
    mov di, 75d ; fila a empezar a printear
    call linea1
    
    mov si, 125d ; columna
    mov di, 75d ; fila
    call linea2


     mov si, 100d ; columna
    mov di, 125d ; fila
    call linea3

    mov si, 100d ; columna
    mov di, 125d ; fila
    call linea4

      mov si, 75d ; columna
    mov di, 75d ; fila
    call linea5

     mov si, 75d ; columna
    mov di, 150d ; fila
    call linea6

    mov si, 90d ; columna
    mov di, 125d ; fila
    call linea7

    mov si, 90d ; columna
    mov di, 125d ; fila
    call linea8

    mov si, 115d ; columna
    mov di, 150d ; fila
    call linea9

    mov si, 90d ; columna
    mov di, 90d ; fila
    call linea10

    mov si, 90d ; columna
    mov di, 110d ; fila
    call linea11

    mov si, 110d ; columna
    mov di, 90d ; fila
    call linea12

     mov si, 90d ; columna
    mov di, 90d ; fila
    call linea13


    call kb
    int 20h
;Linea 1 horizontal
linea1:
lupi1:
    mov cx ,0d      
    mov cx, si ; columna
    mov dx, di ; fila
    call pixel ; printeaer pixel
    inc si    ; aumentar columna para printear el horizontal
    cmp si, 125d ; verificar si se ha printeado una linea
    jne lupi1 ; repetir el loop
    ret

;Linea 2 vertical
linea2:
lupi2:
   
    mov cx, si ; columna
    mov dx, 0
    mov dx, di ; fila
    call pixel ; printeaer pixel
    inc di    ; aumentar fila para printear en vertical
    cmp di, 125d ; verificar si se ha printeado una linea
    jne lupi2 ; repetir el loop
    ret


linea3:
lupi3:
    mov cx ,0d      
    mov cx, si ; columna
    mov dx, di ; fila
    call pixel ; printeaer pixel
    inc si    ; aumentar columna para printear el horizontal
    cmp si, 125d ; verificar si se ha printeado una linea
    jne lupi3 ; repetir el loop
    ret

;Linea inclinada
linea4:
lupi4:
   
    mov cx, si ; columna
    mov dx, 0
    mov dx, di ; fila
    call pixel ; printeaer pixel
    inc di    ; aumentar fila para printear en vertical
    inc si
    cmp si, 125d ; verificar si se ha printeado una linea
    jne lupi4 ; repetir el loop
    ret

linea5:
lupi5:
   mov cx, si ; columna
    mov dx, 0
    mov dx, di ; fila
    call pixel ; printeaer pixel
    inc di    ; aumentar fila para printear en vertical
    cmp di, 150d ; verificar si se ha printeado una linea
    jne lupi5 ; repetir el loop
    ret
linea6:
lupi6:
    mov cx ,0d      
    mov cx, si ; columna
    mov dx, di ; fila
    call pixel ; printeaer pixel
    inc si    ; aumentar columna para printear el horizontal
    cmp si, 90d ; verificar si se ha printeado una linea
    jne lupi6 ; repetir el loop
    ret

linea7:
lupi7:
   
    mov cx, si ; columna
    mov dx, 0
    mov dx, di ; fila
    call pixel ; printeaer pixel
    inc di    ; aumentar fila para printear en vertical
    cmp di, 150d ; verificar si se ha printeado una linea
    jne lupi7 ; repetir el loop
    ret
linea8:
lupi8:
   
    mov cx, si ; columna
    mov dx, 0
    mov dx, di ; fila
    call pixel ; printeaer pixel
    inc di    ; aumentar fila para printear en vertical
    inc si
    cmp di, 150d ; verificar si se ha printeado una linea
    jne lupi8 ; repetir el loop
    ret

linea9:
lupi9:
    mov cx ,0d      
    mov cx, si ; columna
    mov dx, di ; fila
    call pixel ; printeaer pixel
    inc si    ; aumentar columna para printear el horizontal
    cmp si, 125d ; verificar si se ha printeado una linea
    jne lupi9 ; repetir el loop
    ret

linea10:
lupi10:
    mov cx ,0d      
    mov cx, si ; columna
    mov dx, di ; fila
    call pixel ; printeaer pixel
    inc si    ; aumentar columna para printear el horizontal
    cmp si, 110d ; verificar si se ha printeado una linea
    jne lupi10 ; repetir el loop
    ret

linea11:
lupi11:
    mov cx ,0d      
    mov cx, si ; columna
    mov dx, di ; fila
    call pixel ; printeaer pixel
    inc si    ; aumentar columna para printear el horizontal
    cmp si, 110d ; verificar si se ha printeado una linea
    jne lupi11 ; repetir el loop
    ret

;Linea 2 vertical
linea12:
lupi12:
   
    mov cx, si ; columna
    mov dx, 0
    mov dx, di ; fila
    call pixel ; printeaer pixel
    inc di    ; aumentar fila para printear en vertical
    cmp di, 110d ; verificar si se ha printeado una linea
    jne lupi12 ; repetir el loop
    ret

;Linea 2 vertical
linea13:
lupi13:
   
    mov cx, si ; columna
    mov dx, 0
    mov dx, di ; fila
    call pixel ; printeaer pixel
    inc di    ; aumentar fila para printear en vertical
    cmp di, 110d ; verificar si se ha printeado una linea
    jne lupi13 ; repetir el loop
    ret
grafico:
        mov ah,00h
        mov al, 13h
        int 10h
        ret

pixel: 
        mov ah, 0Ch
        mov al, 1010b
        int 10h
        ret

kb: 	
    mov	ah, 00h
	int 	16h
	ret
section .data