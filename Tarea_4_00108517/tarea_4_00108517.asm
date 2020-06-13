org	100h

section .text

	call 	texto  	;iniciamos modo texto

	xor 	si, si 	;lo mimso que: mov si, 0000h
lupi:	call 	kb
	cmp 	al, "$" ;   "h o l a $"
			;si; 0 1 2 3 4
	je	mostrar
	mov	[300h+si], al ; CS:0300h en adelante
	inc 	si
	jmp 	lupi

mostrar: 
    call 	w_strng
   call w_strng2
   call sumar
   call w_char
   call w_string3
	call 	kb	; solo detenemos la ejecución

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb:	mov	ah, 00h ;subrutina que detiene la ejecución hasta recibir
	int 	16h	;algun carácter en el buffer del teclado
	ret		;este carácter lo guarda en el registro AL

w_strng:mov	ah, 13h
	mov 	al, 01h ; asigna a todos los caracteres el atributo de BL,
			; actualiza la posición del cursor
	mov 	bh, 00h ; número de página
	mov	bl, 00001111b ; atributo de caracter
	mov	cx, si ; tamaño del string (SI, porque todavía guarda la última posición)
	mov	dl, 10h ; columna inicial
	mov	dh, 7h	; fila inicial
	; Como esta interrupción saca el string de ES:BP, tenemos que poner los valores correcpondientes
	push 	cs ; Segmento actual en el que está guardado nuestro string
	pop	es ; Puntero al segmento que queremos 
	mov	bp, 303h ; Dirección inicial de nuestra cadena de texto
	; ES:BP equals CS:300h 
	int 10h
	ret

w_strng2:
    mov [30Ch], word "="
    mov [30Dh], word "$"
    mov	ah, 13h
	mov 	al, 01h ; asigna a todos los caracteres el atributo de BL,
			; actualiza la posición del cursor
	mov 	bh, 00h ; número de página
	mov	bl, 00001111b ; atributo de caracter
	mov	cx, 1 ; tamaño del string (SI, porque todavía guarda la última posición)
	mov	dl, 20h ; columna inicial
	mov	dh, 7h	; fila inicial
	; Como esta interrupción saca el string de ES:BP, tenemos que poner los valores correcpondientes
	push 	cs ; Segmento actual en el que está guardado nuestro string
	pop	es ; Puntero al segmento que queremos 
	mov	bp, 30Ch ; Dirección inicial de nuestra cadena de texto
	; ES:BP equals CS:300h 
	int 10h
	ret
;Sumar valores
sumar: xor ax, ax
        xor bl, bl
        mov bl, 5d 
        

        add ax, 0
        add ax, 8
        add ax, 5
        add ax, 1
        add ax, 7
        div bl
        mov [30Eh], al
        add [30Eh], word 30h
        ret


;Mover Cursor
mov_cur:
  xor al, al
  xor dx, dx
    mov dh, 7h ; fila
	mov dl, 23h ; columna
	mov bh, 0 ; numero de pagina
	mov ah, 2
	int 10h
	ret

;Escribir Caracter
w_char:
    call mov_cur
    mov al, [30Eh]
    mov bh, 0 ; numero de pagina
    mov cx, 1;
    mov ah, 09h
    int 10h
    ret
;Escribir cadena de mensaje 3
w_string3:
    mov al, 1
	mov bh, 0 ; Numero de pagina
	mov bl, 0011_1011b
	mov cx, 11 ; calculate message size. 
	mov dl, 10 ; Fila
	mov dh, 10 ; Columna
	push cs
	pop es
	mov bp, msg1
	mov ah, 13h
	int 10h
    ret
section .data
msg1 db "Me recupero"