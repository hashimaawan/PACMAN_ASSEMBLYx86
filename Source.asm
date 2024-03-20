.386
.model flat, stdcall
.stack 4096

Include irvine32.inc
includelib Winmm.lib

PlaySound PROTO,
pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD

.data


;---------- FOR DESIGNING AND WELCOME SCREENS ;----------

  title1 byte"____   __    ___     __  __    __    _  _ ",0ah,0
  title2 byte"(  _ \ /__\  / __)___(  \/  )  /__\  ( \( )",0ah,0
  title3 byte" )___//(__)\( (__(___))    (  /(__)\  )  ( ",0ah,0
  title4 byte"(__) (__)(__)\___)   (_/\/\_)(__)(__)(_)\_)",0ah,0
                                                       

wallti1 byte"____    __    ____ ",0ah,0
wallti2 byte"\   \  /  \  /   / ",0ah,0
wallti3 byte" \   \/    \/   /  ",0ah,0
wallti4 byte"  \            /   ",0ah,0
wallti5 byte"   \    /\    /    ",0ah,0
wallti6 byte"    \__/  \__/     ",0ah,0


  over1 byte"_____                 ____              ",0ah,0
 over2 byte"/ ___/__ ___ _  ___   / __ \_  _____ ____",0ah,0
over3 byte"/ (_ / _ `/  ' \/ -_) / /_/ / |/ / -_) __/",0ah,0
over4 byte"\___/\_,_/_/_/_/\__/  \____/|___/\__/_/   ",0ah,0
               
won1 byte".-.  .-..----. .-. .-.   .-. . .-. .----. .-. .-.",0ah,0
 won2 byte"\ \/ //  {}  \| { } |   | |/ \| |/  {}  \|  `| |",0ah,0
  won3 byte"}  { \      /| {_} |   |  .'.  |\      /| |\  |",0ah,0
  won4 byte"`--'  `----' `-----'   `-'   `-' `----' `-' `- ",0ah,0


m1 byte" __   __  _______  __    _  __   __ ",0ah,0
m2 byte"|  |_|  ||       ||  |  | ||  | |  |",0ah,0
m3 byte"|       ||    ___||   |_| ||  | |  |",0ah,0
m4 byte"|       ||   |___ |       ||  |_|  |",0ah,0
m5 byte"|       ||    ___||  _    ||       |",0ah,0
m6 byte"| ||_|| ||   |___ | | |   ||       |",0ah,0
m7 byte"|_|   |_||_______||_|  |__||_______|",0ah,0

i1 byte " Pacman Game Instructions",0
i2 byte "Guide Pacman through the maze, consuming all pellets while avoiding ghosts.",0
i3 byte "Use w ,a,s,d to navigate Pacman through the maze's corridors.",0
i4 byte "Avoid contact with ghosts; they will cost a life.",0
i5 byte "Collect fruits for extra points and aim for high scores!.Press l to go back",0
title9 byte " Press G to start the game ", 0ah,0

prompt DB "Enter your name: ", 0
nameStr DB 255 Dup (?) 


	strtd byte "#"


x dword ?
;------------
myInt DWORD ? 
myChar BYTE ? 
myStr BYTE 30 dup(0) 
myPrompt BYTE "Enter a string:",0 
myPrompt2 BYTE "Enter a number:",0 

livesprompt byte "Lives : ",0
endscreen byte "Player name : " ,0
playerprompt byte "Player Name : ",0
;playername 255 dup(0)
  ;  inputChar BYTE ?

;--------   Q5

ground BYTE "_______________________________________________________________________________________",0
ground1 BYTE "______________________________________________________________________________________",0
rightside byte "|",0

wall1 byte "|",0
wall2 byte "_",0

Enemy byte "E",0
enemyx byte 27
enemyy byte 6

enemy2x byte 64
enemy2y byte 7

enemy3x byte 27
enemy3y byte 21

;wall2 byte "7"
temp byte ?


strScore BYTE "Score : ",0
score BYTE 0

groundxpos byte ?
groundypos byte ?
xPos BYTE 66
yPos BYTE 15

lives byte 2

xPos1 BYTE 26,26,26,26,26, 100 DUP(?)
yPos1 BYTE 19,19,19,19,19, 100 DUP(?)

speed dword 120

xwall1 byte 56
xwall byte 30
ywall byte 16

xwallanother byte 70
xwall1another byte 96

xwall2 byte 31
ywall2 byte 16

xwall3r byte 104

xwall3 byte 30
ywall3 byte 24

xwall32 byte 31
ywall32 byte 24


xwallc1 byte 79
xwallc byte 54
ywallc byte 20

xwallcu1 byte 79
xwallcu byte 54
ywallcu byte 5

xwallcuu12 byte 44
xwallcuu1 byte 30
ywallcuu1 byte 5
ywallcuud1 byte 20


xwallcuu1l2 byte 99
xwallcuul1 byte 84


xCoinPos BYTE ? 
yCoinPos BYTE ?

xposenemy byte 27
yposenemy byte 26



prompt123 BYTE " 'c' to continue..", 0
prompt123s BYTE "                    ", 0
prompt1234 BYTE "Game Paused", 0
prompt1234s BYTE "           ", 0
answer  byte 6

inputChar BYTE ?


boolcheck byte 1

;-- level 1 arrays
ArrayStorex db 200 dup(?)
ArrayStorex2 db 100 dup(?)
ArrayStoreyu db 100 dup(?)
ArrayStoreyu1 db 100 dup(?)
ArrayStoreyu2 db 100 dup(?)
ArrayStorex3 db 100 dup(?)
ArrayStorey db 3 dup(?)

;-- Level 2 arrays

ArrayStorexl2 db 200 dup(?)
ArrayStorexl22 db 100 dup(?)
ArrayStoreyl2u db 100 dup(?)
ArrayStoreyl2u1 db 100 dup(?)
ArrayStoreyl2u2 db 100 dup(?)
ArrayStorexl23 db 100 dup(?)
ArrayStoreyl2 db 3 dup(?)



;-- Level3 Arrays

ArrayStorexl3 db 200 dup(?)
ArrayStorexl32 db 100 dup(?)
ArrayStoreyl3u db 100 dup(?)
ArrayStoreyl3u1 db 100 dup(?)
ArrayStoreyl3u2 db 100 dup(?)
ArrayStorexl33 db 100 dup(?)
ArrayStoreyl3 db 3 dup(?)




food1 db "*",0
xfood1 db 26
yfood1 db 2

yfood2 db 26

xfood3 db 104

lasttime dword 0
lasttime2 dword 0
lasttime3 dword 0
lasttime4 dword 0
lasttime5 dword 0



;-----------

stringmenu1 db "1. Start Game   (1)",0
stringmenu2 db "2. Level 1      (1)",0
stringmenu3 db "3. Level 2      (2)",0
stringmenu4 db "4. Level 3      (3)",0
stringmenu5 db "5. Instructions (4)",0
stringmenu6 db "6. Exit         (5)",0


instru byte ?

startgame db ?

string1 db 50 dup(?)

asklevel byte ?
walldesign byte "~",0

promptlevel byte "Level 2 ",0
promptlevel3 byte "Level 3 ",0
promptlevel1 byte "Level 1",0


fruit1 byte "F",0
fruit1x byte 61
fruit1y byte 6
fruit1e byte "  ",0


beginsound byte "music3.wav",0
beginsound1 byte "music2.wav",0
pose byte 0
pose1 byte 0 

score1 byte 0
;pacman_beginning	db "pacman_beginning.wav",0
.code
invoke GetTickCount
Main PROC

 
;INVOKE PlaySound, OFFSET pacman_beginning, NULL,0h
INVOKE PlaySound, OFFSET beginsound, NULL,11h

;call testingpro
call startscreen
call Namegame
getback:
call Menu
INVOKE PlaySound, OFFSET beginsound, NULL,11h
mov edx, offset asklevel
call readdec

cmp al,2
je lev2

cmp al,4
je insrtruct 

cmp al,3 
je Leve3

cmp al,1
je lev1

jmp exiting
insrtruct:
INVOKE PlaySound, OFFSET beginsound, NULL,11h
call Instructions
call readchar
cmp al,"l"
jne insrtruct
call clrscr
jmp getback




jmp exiting
lev2:
call Level2
jmp exiting
Leve3:
call Level3
jmp exiting
lev1:
 call Level1
 exiting:
invoke exitprocess,0
main Endp

;------------------------ 




Level1 proc 



call maze
	mov eax,15
	call SetTextColor
	mov dl,0
	mov dh,2
	call Gotoxy
	mov edx,OFFSET promptlevel1
	call WriteString

		;seeee:
	
	
gameLoop:
INVOKE PlaySound, OFFSET beginsound1, NULL,11h
		call Ghost
		mov bl,70
		cmp score,bl
		
		jne lev2notcome
		mov bl,score
		mov esi,offset score1

		mov [esi],bl
		;call clrscr
		call Level2
		ret
		lev2notcome:

		mov bl,xpos		
		cmp bl,enemyx
		jne nocollisiong
		mov dl,enemyy
		cmp dl,ypos
		jne nocollisiong
		dec lives
		mov enemyx,26

		nocollisiong:
		mov bl,enemyx
		cmp bl,100
		jnge okkk
		call UpdateEnemy  
		mov enemyx,26
		okkk:
		
		cmp lives,0
		jne gamenotover
		call clrscr
		call gameover
		ret
		
		gamenotover:
	mov bl,xpos
	cmp bl,groundxpos
	jne notgorund
	mov bl,ypos
	cmp bl,groundypos
	jne notgorund
	mov dl,0
	mov dh,2
	call Gotoxy
	mov edx,OFFSET ground1


	notgorund:

		mov eax,5
		call SetTextColor

		; draw score:
		mov dl,0
		mov dh,4
		call Gotoxy
		mov edx,OFFSET strScore
		call WriteString
		mov al,score
		call WriteInt

		mov dl,0
		mov dh,6
		call Gotoxy
		mov edx,OFFSET livesprompt
		call WriteString
		mov al,lives
		call WriteInt
		
			mov eax,14
		call SetTextColor

		mov dl,106						;move cursor to coordinates
		mov dh,1
		call Gotoxy

		; get user key input:
		call ReadKey
					;jump if no key is entered
		processInput:
		
		mov inputChar,al

		; exit game if user types 'x':
		cmp inputChar,"x"
		je exitGame

		cmp inputChar,"c"
		je gameLoop

		cmp inputChar, "p"
		je pausegame

		cmp inputChar,"w"
		je moveUp

		cmp inputChar,"s"
		je moveDown

		cmp inputChar,"a"
		je moveLeft

		cmp inputChar,"d"
		je moveRight

		jmp gameLoop

		pausegame:

		mov dh,20
		mov dl,2
		call Gotoxy
		mov  edx,OFFSET prompt1234
		call writestring

		mov dh,22
		mov dl,2
		call Gotoxy
		mov  edx,OFFSET prompt123
		call writestring
		call readChar
	

		cmp al, 'c'
		je continue
		jmp pausegame
		
		call ReadChar
		mov inputChar,al
		cmp al, "c"
		je continue
		jmp pausegame

	
	;	call maze
		;call clrscr
		

	;	call DrawPlayer
		jmp gameLoop

	continue:
		mov dh,20
		mov dl,2
		call Gotoxy
		mov  edx,OFFSET prompt1234s
		call writestring

		mov dh,22
		mov dl,3
		call Gotoxy
		mov  edx,OFFSET prompt123s
		call writestring
		
	

		;-----------------------
		;-------------  UP
		;-------------------------------
	moveUp:
	mov bl,xpos		
		cmp bl,enemyx
		jne ohh1
		mov dl,enemyy
		cmp dl,ypos
		jne ohh1
		dec lives
		mov enemyx,26
		ohh1:
		
		; Food1 top
		mov ecx,75
		mov esi,offset Arraystorex
		mov ebx,0
	checkalready:
		mov dl, Arraystorex[ebx]
		mov dh,xpos
		cmp dl,xpos
		je secondcheckfood

		inc ebx
	loop checkalready

	mov al,ypos
	dec al
	cmp al, yfood1
	je addup1

	;-------- second food below
	secondcheckfood:
	mov ecx,75
		mov esi,offset Arraystorex2
		mov ebx,0
	checkalreadybelow:
		mov dl, Arraystorex2[ebx]
		mov dh,xpos
		cmp dl,xpos
		je thirdcheckfood
		inc ebx

	loop checkalreadybelow

	mov al,ypos
	dec al
	cmp al, yfood2
	je addup2

	;--- up left

	thirdcheckfood:
		mov ecx,75
		mov esi,offset Arraystoreyu
		mov ebx,0
	checkalreadyleftup:
		mov dl, Arraystoreyu[ebx]
		mov dh,ypos
		cmp dl,ypos
		je fourthcheckfood
		inc ebx
	loop checkalreadyleftup

	mov al,xpos
	cmp al, xfood1
	je addup3

	;up mid
	fourthcheckfood:
	
		mov ecx,75
		mov esi,offset Arraystoreyu1
		mov ebx,0
	checkalreadyleftup1:
		mov dl, Arraystoreyu1[ebx]
		mov dh,ypos
		cmp dl,ypos
		je checkingwall
		inc ebx
	loop checkalreadyleftup1

	mov al,xpos
	cmp al, 65
	je addup4

	fifthcheckfood:

		mov ecx,75
		mov esi,offset Arraystoreyu2
		mov ebx,0
	checkalreadyrightup1:
		mov dl, Arraystoreyu2[ebx]
		mov dh,ypos
		cmp dl,ypos
		je checkingwall
		inc ebx
	loop checkalreadyrightup1

	jmp addup5
	addup1:
	;-----
	;food collision
		mov bx,0
		mov bl,ypos
		dec bl
		cmp bl,yfood1
		jne BelowFoodup
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup:
			cmp xpos,dl
			je addscore
			add  dl,1
			loop checkfoodup
		jmp checkingwall

	    addscore:
		inc score
		mov ebx,0
		inc lasttime
		mov ebx,lasttime
		mov esi,offset ArrayStorex
		mov dl,xpos
		mov ArrayStorex[ebx], dl

	addup2:
		;------------- Below food
		BelowFoodup:
		mov bx,0
		mov bl,ypos
		dec bl
		cmp bl,yfood2
		jne checkingwall
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfooddown:
			cmp xpos,dl
			je addscore2
			add  dl,1
			loop checkfooddown
		jmp checkingwall

	    addscore2:
		inc score
		mov ebx,0
		inc lasttime2
		mov ebx,lasttime2
		mov esi,offset ArrayStorex2
		mov dl,xpos
		mov ArrayStorex2[ebx], dl


	addup3:	

		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,xfood1
		jne checkingwall
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup1:
			cmp ypos,dl
			je addscore3
			add  dl,1
			loop checkfoodup1
		jmp checkingwall

	    addscore3:
		inc score
		mov ebx,0
		inc lasttime3
		mov ebx,lasttime3
		mov esi,offset ArrayStoreyu
		mov dl,ypos
		mov ArrayStoreyu[ebx], dl

	addup4:
		
		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,65
		jne checkingwall
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup2:
			cmp ypos,dl
			je addscore4
			add  dl,1
			loop checkfoodup2
		jmp checkingwall

	    addscore4:
		inc score
		mov ebx,0
		inc lasttime4
		mov ebx,lasttime4
		mov esi,offset ArrayStoreyu1
		mov dl,ypos
		mov ArrayStoreyu1[ebx], dl


	addup5:
		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,xfood3
		jne checkingwall
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup3:
			cmp ypos,dl
			je addscore5
			add  dl,1
			loop checkfoodup3
		jmp checkingwall

	    addscore5:
		inc score
		mov ebx,0
		inc lasttime5
		mov ebx,lasttime5
		mov esi,offset ArrayStoreyu2
		mov dl,ypos
		mov ArrayStoreyu2[ebx], dl

		; for single going vertical up 
		checkingwall:
		;----------------- wall 1
		mov dh,ywall
		inc dh
		cmp dh,ypos
		jne letseeanotherup
		mov dh, xwall
		cmp dh,xpos
		jne letseeanotherup
		jmp gameLoop

		letseeanotherup:
		;---
		mov dh,ywall2
		inc dh  
		cmp dh,ypos
		jne anotherwallr
		
		mov ecx,26
		mov bl,xwall2
		checkupp:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkupp
;--------------------------- wall 2 r
		anotherwallr:


		mov dh,ywall
		inc dh
		cmp dh,ypos
		jne letseeanotherupr
		mov dh, xwallanother
		cmp dh,xpos
		jne letseeanotherupr
		jmp gameLoop

		letseeanotherupr:
		;---
		mov dh,ywall2
		inc dh  
		cmp dh,ypos
		jne anotherwall
		
		mov ecx,26
		mov bl,xwallanother
		inc bl
		checkuppr:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkuppr



		;-------

		anotherwall:
		
		mov dh,ywall3
		inc dh
		cmp dh,ypos
		jne letseeanotherup2
		mov dh, xwall3
		cmp dh,xpos
		jne letseeanotherup2
		jmp gameLoop

		letseeanotherup2:
		;---
		mov dh,ywall32
		inc dh  
		cmp dh,ypos
		jne nomorecheck
		
		mov ecx,75
		mov bl,xwall32
		checkupp2:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkupp2

;--------------------------------
		nomorecheck:

			call UpdatePlayer
		
		
	
	
			dec yPos
			cmp ypos,2
			jl AdjustUp
			call DrawPlayer
		    mov ecx,0
	;		mov eax,170
	;		call Delay
	;	loop jumpLoop

		jmp gameLoop

		AdjustUp:
			mov Ypos,2
			call DrawPlayer
			jmp gameLoop

		; ----   Down
	moveDown:
		mov bl,xpos		
		cmp bl,enemyx
		jne ohh2
		mov dl,enemyy
		cmp dl,ypos
		jne ohh2
		dec lives
		mov enemyx,26
		ohh2:
				
		; Food1 top
		mov ecx,75
		mov esi,offset Arraystorex
		mov ebx,0
	checkalready2:
		mov dl, Arraystorex[ebx]
		mov dh,xpos
		cmp dl,xpos
		je secondcheckfood2
		inc ebx

	loop checkalready2

	mov al,ypos
	inc al
	cmp al, yfood1
	je addup12

	;-------- second food below
	secondcheckfood2:
	    mov ecx,75
		mov esi,offset Arraystorex2
		mov ebx,0
	checkalreadybelow2:
		mov dl, Arraystorex2[ebx]
		cmp dl,xpos
		je thirdcheckfood2
		inc ebx
	loop checkalreadybelow2

	mov al,ypos
	inc al
	cmp al, yfood2
	je addup22

	;--- up left

	thirdcheckfood2:
		mov ecx,50
		mov esi,offset Arraystoreyu
		mov ebx,0

	checkalreadyleftup2:
		mov dl, Arraystoreyu[ebx]
		mov dh,ypos
		cmp dl,ypos
		je fourthcheckfood2
		inc ebx
	loop checkalreadyleftup2

	mov al,xpos
	cmp al, xfood1
	je addup32

	;up mid
	fourthcheckfood2:
	
		mov ecx,50
		mov esi,offset Arraystoreyu1
		mov ebx,0
	checkalreadyleftup12:
		mov dl, Arraystoreyu1[ebx]
		mov dh,ypos
		cmp dl,ypos
		je checkingwall2
		inc ebx
	loop checkalreadyleftup12

	mov al,xpos
	cmp al, 65
	je addup42

	fifthcheckfood2:

		mov ecx,50
		mov esi,offset Arraystoreyu2
		mov ebx,0
	checkalreadyrightup12:
		mov dl, Arraystoreyu2[ebx]
		mov dh,ypos
		cmp dl,ypos
		je checkingwall2
		inc ebx
	loop checkalreadyrightup12

	jmp addup52

	addup12:
	;-----
	;food collision
		mov bx,0
		mov bl,ypos
		inc bl
		cmp bl,yfood1
		jne BelowFoodup2
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup2d:
			cmp xpos,dl
			je addscore1
			add  dl,1
			loop checkfoodup2d
		jmp checkingwall2

	    addscore1:
		inc score
		mov ebx,0
		inc lasttime
		mov ebx,lasttime
		mov esi,offset ArrayStorex
		mov dl,xpos
		mov ArrayStorex[ebx], dl

	addup22:
		;------------- Below food
		BelowFoodup2:
		mov bx,0
		mov bl,ypos
		inc bl
		cmp bl,yfood2
		jne checkingwall2
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfooddown2:
			cmp xpos,dl
			je addscore22
			add  dl,1
			loop checkfooddown2
		jmp checkingwall2

	    addscore22:
		inc score
		mov ebx,0
		inc lasttime2
		mov ebx,lasttime2
		mov esi,offset ArrayStorex2
		mov dl,xpos
		mov ArrayStorex2[ebx], dl

;left
	addup32:	

		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,xfood1
		jne checkingwall2
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup12:
			cmp ypos,dl
			je addscore32
			add  dl,1
			loop checkfoodup12

		jmp checkingwall2

	    addscore32:
		inc score
		mov ebx,0
		inc lasttime3
		mov ebx,lasttime3
		mov esi,offset ArrayStoreyu
		mov dl,ypos
		mov ArrayStoreyu[ebx], dl

		; mid
	addup42:
		
		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,65
		jne checkingwall2
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup22:
			cmp ypos,dl
			je addscore42
			add  dl,1
			loop checkfoodup22
		jmp checkingwall2

	    addscore42:
		inc score
		mov ebx,0
		inc lasttime4
		mov ebx,lasttime4
		mov esi,offset ArrayStoreyu1
		mov dl,ypos
		mov ArrayStoreyu1[ebx], dl

	; right
	addup52:
		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,xfood3
		jne checkingwall2
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup32:
			cmp ypos,dl
			je addscore52
			add  dl,1
			loop checkfoodup32

		jmp checkingwall2

	    addscore52:
		inc score
		mov ebx,0
		inc lasttime5
		mov ebx,lasttime5
		mov esi,offset ArrayStoreyu2
		mov dl,ypos
		mov ArrayStoreyu2[ebx], dl


		;checking wall

		checkingwall2:
		;--- wall1
		mov dh,ywall
		sub dh,10
		cmp dh,ypos
		jne letseeanother
		mov dh, xwall
		cmp dh,xpos
		jne letseeanother
		jmp gameLoop
		letseeanother:
		;---
		mov dh,ywall2
	
		sub dh,10
		cmp dh,ypos
		jne checkwall2
		
		mov ecx,26
		mov bl,xwall2
		checkdown:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown

		; wall2r

	checkwall2:
		mov dh,ywall
		sub dh,10
		cmp dh,ypos
		jne letseeanother2r
		mov dh, xwallanother
		cmp dh,xpos
		jne letseeanother2r
		jmp gameLoop
		letseeanother2r:
		;---
		mov dh,ywall2
	
		sub dh,10
		cmp dh,ypos
		jne checkwall3
		
		mov ecx,26
		mov bl,xwallanother
		inc bl
		checkdown2r:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown2r


		;-----------wall 3
		checkwall3:
		mov dh,ywall3
		sub dh,2
		cmp dh,ypos
		jne letseeanotherdown2
		mov dh, xwall3
		cmp dh,xpos
		jne letseeanotherdown2
		jmp gameLoop
		letseeanotherdown2:
		;---
		mov dh,ywall32
		dec dh  
		sub dh,2 
		cmp dh,ypos
		jne checkdownwall2
		
		mov ecx,75
		mov bl,xwall32
		checkdown2:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown2

		;-------

		checkdownwall2:

		

		call UpdatePlayer
		;call UpdatePlayer2
		inc yPos
		cmp yPos,28
		jg AdjustDown
		call DrawPlayer
		jmp gameLoop

			AdjustDown:
			mov yPos,28
			call DrawPlayer
			jmp gameLoop
;--------------------------
;-----   left  ------------
;--------------------------

moveLeft:
mov bl,xpos		
		cmp bl,enemyx
		jne ohh3
		mov dl,enemyy
		cmp dl,ypos
		jne ohh3
		dec lives
		mov enemyx,26
		ohh3:
	
	mov ecx,100
	mov esi,offset Arraystorex
	mov ebx,0

checkalready3:

		mov dl, Arraystorex[ebx]
		mov dh,xpos
		cmp dl,xpos
		je checky
		inc ebx

loop checkalready3
jmp checkbelowleft2
checky:
mov al,ypos
cmp al, yfood1
je checkingwallleft

checkbelowleft2:
	mov ecx,100
	mov esi,offset Arraystorex2
	mov ebx,0

checkalready3left:
		mov dl, Arraystorex2[ebx]
		mov dh,xpos
		cmp dl,xpos
		je checkbelowy

		inc ebx
loop checkalready3left
jmp chkfood
checkbelowy:
mov al,ypos
cmp al, yfood2
je checkingwallleft
;------ above food

chkfood:
		mov bx,0
		mov bl,ypos
		;dec bl
		cmp bl,yfood1
		jne checkbelowleft
		mov ecx,100
		mov dl,100
		mov ebx,0
		mov bl,xpos

		checkfoodleft:
			cmp xpos,dl
			je addscoreleft
			sub  dl,1
			loop checkfoodleft
		jmp checkbelowleft

	    addscoreleft:
		inc score
		mov ebx,0
		inc lasttime
		mov ebx,lasttime
		mov esi,offset ArrayStorex
		mov dl,xpos
		mov ArrayStorex[ebx], dl


	
		;---- Below food
		
		checkbelowleft:
		mov bx,0
		mov bl,ypos
		;dec bl
		cmp bl,yfood2
		jne checkingwallleft
		mov ecx,100
		mov dl,100
		mov ebx,0
		mov bl,xpos

		checkfoodleft2:
			cmp xpos,dl
			je addscoreleft2
			sub  dl,1
			loop checkfoodleft2
		jmp checkingwallleft

	    addscoreleft2:
		inc score
		mov ebx,0
		inc lasttime2
		mov ebx,lasttime2
		mov esi,offset ArrayStorex2
		mov dl,xpos
		mov ArrayStorex2[ebx], dl


checkingwallleft:
	; wall1 
		mov dh,xwall1
		inc dh
		cmp dh,xpos
		jne checksecondleft
		
		mov ecx,10
		mov bl,ywall
		checkleft2:
		
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleft2
	; wall 2r
	checksecondleft:

		mov dh,xwall1another
		inc dh
		cmp dh,xpos
		jne checkleftbelow
		
		mov ecx,10
		mov bl,ywall
		checkleft2r:
		
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleft2r



		;---- below wall
		checkleftbelow:
		mov dh,xwall3r
		inc dh
		cmp dh,xpos
		jne nowall
		
		mov ecx,3
		mov bl,ywall3
		checkleft:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleft


		nowall:
		

		call UpdatePlayer
		
		dec xPos
		cmp xPos,25
		jl adjustLeft
		call DrawPlayer
		jmp gameLoop

				adjustLeft:
				mov xPos,25
				call DrawPlayer
				jmp gameLoop

;---------------------------------------------------
 ;---------  Right

 ;---------------------------
 mov bl,xpos		
		cmp bl,enemyx
		jne ohh5
		mov dl,enemyy
		cmp dl,ypos
		jne ohh5
		dec lives
		mov enemyx,26
		ohh5:

	moveRight:
	mov ecx,75
	mov esi,offset Arraystorex
	mov ebx,0

	checkalready2r:
		mov dl, Arraystorex[ebx]
		mov dh,xpos
		cmp dl,xpos
		je rightbelow
		inc ebx
	loop checkalready2r


	mov al,ypos
	cmp al,yfood1
	je addrightfo

	rightbelow:

	mov ecx,75
	mov esi,offset Arraystorex2
	mov ebx,0

	checkalreadybelow2r:
		mov dl, Arraystorex2[ebx]
		cmp dl,xpos
		je checkingwallright
		inc ebx
	loop checkalreadybelow2r

	jmp belowri

	addrightfo:

		mov bx,0
		mov bl,ypos
		;dec bl
		cmp bl,yfood1
		jne belowri
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfoodright:
			cmp xpos,dl
			je addscoreright
			add  dl,1
			loop checkfoodright
		jmp belowri

	    addscoreright:
		mov dl,0
		inc score
		mov ebx,0
		inc lasttime
		mov ebx,lasttime
		mov esi,offset ArrayStorex
		mov dl,xpos
		mov ArrayStorex[ebx], dl

	
	belowri:
		mov bx,0
		mov bl,ypos
		;dec bl
		cmp bl,yfood2
		jne checkingwallright
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfoodright2:
			cmp xpos,dl
			je addscoreright2
			add  dl,1
			loop checkfoodright2
		jmp checkingwallright

	    addscoreright2:
		mov dl,0
		inc score
		mov ebx,0
		inc lasttime2
		mov ebx,lasttime2
		mov esi,offset ArrayStorex2
		mov dl,xpos
		mov ArrayStorex2[ebx], dl

		verticalleft:


	checkingwallright:
	; wall 1
		mov dh,xwall
		dec dh  
		cmp dh,xpos
		jne checksecondrightwall
		
		mov ecx,10
		mov bl,ywall
		checkright:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright


		;----wall 2r
		checksecondrightwall:
		mov dh,xwallanother
		dec dh  
		cmp dh,xpos
		jne checkrightwall3
		
		mov ecx,10
		mov bl,ywall
		checkright2r:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright2r

		checkrightwall3:
		mov dh,xwall3
		dec dh  
		cmp dh,xpos
		jne norightwall
		
		mov ecx,3
		mov bl,ywall3

		checkright2:
		 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright2
		norightwall:
	
		
		call UpdatePlayer
		inc xPos
		cmp xpos,109
		jg adjustright
		call DrawPlayer
		jmp gameLoop
			adjustright:
				mov xPos,109
				call DrawPlayer
				jmp gameLoop
	;jmp gameLoop

	exitGame:
	ret
	Level1 endp

Level2 PROC
;	INVOKE PlaySound, OFFSET beginsound1, NULL,11h
	

	call maze
	call maze2
	mov eax,15
	call SetTextColor
	mov dl,0
	mov dh,2
	call Gotoxy
	mov edx,OFFSET promptlevel
	call WriteString
	
	call Drawenemy2
	
	
gameLoop:
INVOKE PlaySound, OFFSET beginsound1, NULL,11h
	cmp score,120
	jne continuelevel2
	call Level3
	ret
	continuelevel2:

	;---------  Enemy

		call Ghost
		call Ghost2

		mov bl,xpos		
		cmp bl,enemyx
		jne notcollideenmemy
		mov dl,enemyy
		cmp dl,ypos
		jne notcollideenmemy
		dec lives
		
		;setting enemy to intial position after collision
		mov enemyx,26
		notcollideenmemy:

			mov bl,xpos		
		cmp bl,enemy2x
		jne notcollideenmemy2
		mov dl,enemy2y
		cmp dl,ypos
		jne notcollideenmemy2
		dec lives
		
		;setting enemy to intial position after collision
		mov enemy2x,64
;--------
notcollideenmemy2:

	mov bl,enemyx
		cmp bl,30
		jng notfruityetl2
		cmp bl,100
		jg fruitappearl2
		mov eax,5
		call SetTextColor
		mov dh,fruit1y
		mov dl,fruit1x
		call Gotoxy
		mov edx,OFFSET fruit1
		call WriteString
		
		
		notfruityetl2:  
		mov bl,enemyx
		cmp bl,20
		jne fruitappearl2
		mov dh,fruit1y
		mov dl,fruit1x
		call Gotoxy
		mov edx,OFFSET fruit1e
		call WriteString
		mov fruit1x,118
		mov fruit1y,0


		;--- Enemy position

		fruitappearl2:
	mov bl,enemyx
		cmp bl,100
		jnge continue1hrz

		mov pose,1
		continue1hrz:
		
		mov bl,enemyy
		cmp bl,21
		jne checkingenemy2

		call UpdateEnemy 
		mov enemyx,28
		mov enemyy,6
		mov fruit1x,64
		mov fruit1y,17
		mov pose,0



		checkingenemy2:

		mov bl,enemy2y
		cmp bl,17
		jnge continue1ver
		mov pose1,1

		continue1ver:
		
		mov bl,enemy2x
		cmp bl,100
		jne noenemy
		call UpdateEnemy2 
		mov enemy2x,28
		mov enemy2y,6
		mov pose1,0


		noenemy:

		cmp lives,0
		jne gamenotover
		call clrscr
		call gameover
		ret





	;----
		
	
		
		gamenotover:
	mov bl,xpos
	cmp bl,groundxpos
	jne notgorund
	mov bl,ypos
	cmp bl,groundypos
	jne notgorund
	mov dl,0
	mov dh,2
	call Gotoxy
	mov edx,OFFSET ground1


	notgorund:

		mov eax,15
		call SetTextColor

		; draw score:
		mov dl,0
		mov dh,4
		call Gotoxy
		mov edx,OFFSET strScore
		call WriteString
		mov eax,2
		call SetTextColor
		mov al,score
		call WriteInt
		
		mov eax,15
		call SetTextColor
		mov dl,0
		mov dh,6
		call Gotoxy
		mov edx,OFFSET livesprompt
		call WriteString

		mov eax,2
		call SetTextColor
		mov al,lives
		call WriteInt
		
		mov eax,14
		call SetTextColor

		mov dl,106						;move cursor to coordinates
		mov dh,0
		call Gotoxy

		; get user key input:
		call ReadKey
					;jump if no key is entered
		processInput:
		
		mov inputChar,al

		; exit game if user types 'x':
		cmp inputChar,"x"
		je exitGame

		cmp inputChar,"c"
		je gameLoop

		cmp inputChar, "p"
		je pausegame

		cmp inputChar,"w"
		je moveUp

		cmp inputChar,"s"
		je moveDown

		cmp inputChar,"a"
		je moveLeft

		cmp inputChar,"d"
		je moveRight

		jmp gameLoop

	pausegame:

		mov dh,20
		mov dl,2
		call Gotoxy
		mov  edx,OFFSET prompt1234
		call writestring

		mov dh,22
		mov dl,2
		call Gotoxy
		mov  edx,OFFSET prompt123
		call writestring
		call readChar
	
		;call MsgBoxAsk

		cmp al, 'c'
		je continue
		jmp pausegame
		
		call ReadChar
		mov inputChar,al
		cmp al, "c"
		je continue
		jmp pausegame

	
	;	call maze
		;call clrscr
		

	;	call DrawPlayer
		jmp gameLoop

	continue:
		mov dh,20
		mov dl,2
		call Gotoxy
		mov  edx,OFFSET prompt1234s
		call writestring

		mov dh,22
		mov dl,3
		call Gotoxy
		mov  edx,OFFSET prompt123s
		call writestring
		
		;-----------------------
		;-------------  UP
		;-------------------------------
	moveUp:

	mov bl, fruit1x
		cmp xpos,bl
		jne okkkkkk
		mov dl,fruit1y
		cmp dl,ypos
		jne okkkkkk
		add score,5
		mov dh,fruit1y
		mov dl,fruit1x
		call Gotoxy
		mov edx,OFFSET fruit1e
		call WriteString
		mov fruit1x,118
		mov fruit1y,0

	okkkkkk:
	
		
		; Food1 top
		mov ecx,75
		mov esi,offset Arraystorexl2
		mov ebx,0
	checkalready:
		mov dl, Arraystorexl2[ebx]
		mov dh,xpos
		cmp dl,xpos
		je secondcheckfood

		inc ebx
	loop checkalready

	mov al,ypos
	dec al
	cmp al, yfood1
	je addup1

	;-------- second food below
	secondcheckfood:
	mov ecx,75
		mov esi,offset Arraystorexl22
		mov ebx,0
	checkalreadybelow:
		mov dl, Arraystorexl22[ebx]
		mov dh,xpos
		cmp dl,xpos
		je thirdcheckfood
		inc ebx

	loop checkalreadybelow

	mov al,ypos
	dec al
	cmp al, yfood2
	je addup2

	;--- up left

	thirdcheckfood:
		mov ecx,75
		mov esi,offset Arraystoreyl2u
		mov ebx,0
	checkalreadyleftup:
		mov dl, Arraystoreyl2u[ebx]
		mov dh,ypos
		cmp dl,ypos
		je fourthcheckfood
		inc ebx
	loop checkalreadyleftup

	mov al,xpos
	cmp al, xfood1
	je addup3

	;up mid
	fourthcheckfood:
	
		mov ecx,75
		mov esi,offset Arraystoreyl2u1
		mov ebx,0
	checkalreadyleftup1:
		mov dl, Arraystoreyl2u1[ebx]
		mov dh,ypos
		cmp dl,ypos
		je checkingwall
		inc ebx
	loop checkalreadyleftup1

	mov al,xpos
	cmp al, 65
	je addup4

	fifthcheckfood:

		mov ecx,75
		mov esi,offset Arraystoreyl2u2
		mov ebx,0
	checkalreadyrightup1:
		mov dl, Arraystoreyl2u2[ebx]
		mov dh,ypos
		cmp dl,ypos
		je checkingwall
		inc ebx
	loop checkalreadyrightup1

	jmp addup5
	addup1:
	;-----
	;food collision
		mov bx,0
		mov bl,ypos
		dec bl
		cmp bl,yfood1
		jne BelowFoodup
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup:
			cmp xpos,dl
			je addscore
			add  dl,1
			loop checkfoodup
		jmp checkingwall

	    addscore:
		inc score
		mov ebx,0
		inc lasttime
		mov ebx,lasttime
		mov esi,offset ArrayStorexl2
		mov dl,xpos
		mov ArrayStorexl2[ebx], dl

	addup2:
		;------------- Below food
		BelowFoodup:
		mov bx,0
		mov bl,ypos
		dec bl
		cmp bl,yfood2
		jne checkingwall
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfooddown:
			cmp xpos,dl
			je addscore2
			add  dl,1
			loop checkfooddown
		jmp checkingwall

	    addscore2:
		inc score
		mov ebx,0
		inc lasttime2
		mov ebx,lasttime2
		mov esi,offset ArrayStorexl22
		mov dl,xpos
		mov ArrayStorexl22[ebx], dl


	addup3:	

		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,xfood1
		jne checkingwall
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup1:
			cmp ypos,dl
			je addscore3
			add  dl,1
			loop checkfoodup1
		jmp checkingwall

	    addscore3:
		inc score
		mov ebx,0
		inc lasttime3
		mov ebx,lasttime3
		mov esi,offset ArrayStoreyl2u
		mov dl,ypos
		mov ArrayStoreyl2u[ebx], dl

	addup4:
		
		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,65
		jne checkingwall
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup2:
			cmp ypos,dl
			je addscore4
			add  dl,1
			loop checkfoodup2
		jmp checkingwall

	    addscore4:
		inc score
		mov ebx,0
		inc lasttime4
		mov ebx,lasttime4
		mov esi,offset ArrayStoreyl2u1
		mov dl,ypos
		mov ArrayStoreyl2u1[ebx], dl


	addup5:
		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,xfood3
		jne checkingwall
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup3:
			cmp ypos,dl
			je addscore5
			add  dl,1
			loop checkfoodup3
		jmp checkingwall

	    addscore5:
		inc score
		mov ebx,0
		inc lasttime5
		mov ebx,lasttime5
		mov esi,offset ArrayStoreyl2u2
		mov dl,ypos
		mov ArrayStoreyl2u2[ebx], dl

		; for single going vertical up 
		checkingwall:
		;----------------- wall 1
		mov dh,ywall
		inc dh
		cmp dh,ypos
		jne letseeanotherup
		mov dh, xwall
		cmp dh,xpos
		jne letseeanotherup
		jmp gameLoop

		letseeanotherup:
		;---
		mov dh,ywall2
		inc dh  
		cmp dh,ypos
		jne anotherwallr
		
		mov ecx,26
		mov bl,xwall2
		checkupp:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkupp
;--------------------------- wall 2 r
		anotherwallr:


		mov dh,ywall
		inc dh
		cmp dh,ypos
		jne letseeanotherupr
		mov dh, xwallanother
		cmp dh,xpos
		jne letseeanotherupr
		jmp gameLoop

		letseeanotherupr:
		;---
		mov dh,ywall2
		inc dh  
		cmp dh,ypos
		jne anotherwall
		
		mov ecx,26
		mov bl,xwallanother
		inc bl
		checkuppr:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkuppr



		;-------

		anotherwall:
		
		mov dh,ywall3
		inc dh
		cmp dh,ypos
		jne letseeanotherup2
		mov dh, xwall3
		cmp dh,xpos
		jne letseeanotherup2
		jmp gameLoop

		letseeanotherup2:
		;---
		mov dh,ywall32
		inc dh  
		cmp dh,ypos
		jne belowupwall
		
		mov ecx,75
		mov bl,xwall32
		checkupp2:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkupp2

;--------------------------------
	belowupwall:
		mov dh,ywallc
		inc dh
		cmp dh,ypos
		jne letseeanotherup3
		mov dh, xwall3
		cmp dh,xpos
		jne letseeanotherup3
		jmp gameLoop

		letseeanotherup3:
		;---
		mov dh,ywallc
		inc dh  
		cmp dh,ypos
		jne upnewwall
		
		mov ecx,25
		mov bl,xwallc
		checkupp3:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkupp3

		;-------- upnew
		upnewwall:

			mov dh,ywallcu
		inc dh
		cmp dh,ypos
		jne letseeanotherup4
		mov dh, xwallcu
		cmp dh,xpos
		jne letseeanotherup4
		jmp gameLoop

		letseeanotherup4:
		;---
		mov dh,ywallcu
		inc dh  
		cmp dh,ypos
		jne nomorecheck
		
		mov ecx,25
		mov bl,xwallcu
		checkupp4:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkupp4



;===
		nomorecheck:

			call UpdatePlayer
		
		;mov eax, speed
		;call delay
		;mov esi, 0
	
	
	
			dec yPos
			cmp ypos,2
			jl AdjustUp
			call DrawPlayer
		    mov ecx,0
	;		mov eax,170
	;		call Delay
	;	loop jumpLoop

		jmp gameLoop

		AdjustUp:
			mov Ypos,2
			call DrawPlayer
			jmp gameLoop


;-------------
; ----   Down
;-------------------
	moveDown:

		mov bl, fruit1x
		cmp xpos,bl
		jne okkkkkk1
		mov dl,fruit1y
		cmp dl,ypos
		jne okkkkkk1
		add score,5
		mov dh,fruit1y
		mov dl,fruit1x
		call Gotoxy
		mov edx,OFFSET fruit1e
		call WriteString
		mov fruit1x,118
		mov fruit1y,0

	okkkkkk1:


		mov bl,xpos		
		cmp bl,enemyx
		jne ohh2
		mov dl,enemyy
		cmp dl,ypos
		jne ohh2
		dec lives
		mov enemyx,26
		ohh2:
				
		; Food1 top
		mov ecx,75
		mov esi,offset Arraystorexl2
		mov ebx,0
	checkalready2:
		mov dl, Arraystorexl2[ebx]
		mov dh,xpos
		cmp dl,xpos
		je secondcheckfood2
		inc ebx

	loop checkalready2

	mov al,ypos
	inc al
	cmp al, yfood1
	je addup12

	;-------- second food below
	secondcheckfood2:
	    mov ecx,75
		mov esi,offset Arraystorexl22
		mov ebx,0
	checkalreadybelow2:
		mov dl, Arraystorexl22[ebx]
		cmp dl,xpos
		je thirdcheckfood2
		inc ebx
	loop checkalreadybelow2

	mov al,ypos
	inc al
	cmp al, yfood2
	je addup22

	;--- up left

	thirdcheckfood2:
		mov ecx,50
		mov esi,offset Arraystoreyl2u
		mov ebx,0

	checkalreadyleftup2:
		mov dl, Arraystoreyl2u[ebx]
		mov dh,ypos
		cmp dl,ypos
		je fourthcheckfood2
		inc ebx
	loop checkalreadyleftup2

	mov al,xpos
	cmp al, xfood1
	je addup32

	;up mid
	fourthcheckfood2:
	
		mov ecx,50
		mov esi,offset Arraystoreyl2u1
		mov ebx,0
	checkalreadyleftup12:
		mov dl, Arraystoreyl2u1[ebx]
		mov dh,ypos
		cmp dl,ypos
		je checkingwall2
		inc ebx
	loop checkalreadyleftup12

	mov al,xpos
	cmp al, 65
	je addup42

	fifthcheckfood2:

		mov ecx,50
		mov esi,offset Arraystoreyl2u2
		mov ebx,0
	checkalreadyrightup12:
		mov dl, Arraystoreyl2u2[ebx]
		mov dh,ypos
		cmp dl,ypos
		je checkingwall2
		inc ebx
	loop checkalreadyrightup12

	jmp addup52

	addup12:
	;-----
	;food collision
		mov bx,0
		mov bl,ypos
		inc bl
		cmp bl,yfood1
		jne BelowFoodup2
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup2d:
			cmp xpos,dl
			je addscore1
			add  dl,1
			loop checkfoodup2d
		jmp checkingwall2

	    addscore1:
		inc score
		mov ebx,0
		inc lasttime
		mov ebx,lasttime
		mov esi,offset ArrayStorexl2
		mov dl,xpos
		mov ArrayStorexl2[ebx], dl

	addup22:
		;------------- Below food
		BelowFoodup2:
		mov bx,0
		mov bl,ypos
		inc bl
		cmp bl,yfood2
		jne checkingwall2
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfooddown2:
			cmp xpos,dl
			je addscore22
			add  dl,1
			loop checkfooddown2
		jmp checkingwall2

	    addscore22:
		inc score
		mov ebx,0
		inc lasttime2
		mov ebx,lasttime2
		mov esi,offset ArrayStorexl22
		mov dl,xpos
		mov ArrayStorexl22[ebx], dl

;left
	addup32:	

		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,xfood1
		jne checkingwall2
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup12:
			cmp ypos,dl
			je addscore32
			add  dl,1
			loop checkfoodup12

		jmp checkingwall2

	    addscore32:
		inc score
		mov ebx,0
		inc lasttime3
		mov ebx,lasttime3
		mov esi,offset ArrayStoreyl2u
		mov dl,ypos
		mov ArrayStoreyl2u[ebx], dl

		; mid
	addup42:
		
		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,65
		jne checkingwall2
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup22:
			cmp ypos,dl
			je addscore42
			add  dl,1
			loop checkfoodup22
		jmp checkingwall2

	    addscore42:
		inc score
		mov ebx,0
		inc lasttime4
		mov ebx,lasttime4
		mov esi,offset ArrayStoreyl2u1
		mov dl,ypos
		mov ArrayStoreyl2u1[ebx], dl

	; right
	addup52:
		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,xfood3
		jne checkingwall2
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup32:
			cmp ypos,dl
			je addscore52
			add  dl,1
			loop checkfoodup32

		jmp checkingwall2

	    addscore52:
		inc score
		mov ebx,0
		inc lasttime5
		mov ebx,lasttime5
		mov esi,offset ArrayStoreyl2u2
		mov dl,ypos
		mov ArrayStoreyl2u2[ebx], dl


		;checking wall

		checkingwall2:
		;--- wall1
		mov dh,ywall
		sub dh,10
		cmp dh,ypos
		jne letseeanother
		mov dh, xwall
		cmp dh,xpos
		jne letseeanother
		jmp gameLoop
		letseeanother:
		;---
		mov dh,ywall2
	
		sub dh,10
		cmp dh,ypos
		jne checkwall2
		
		mov ecx,26
		mov bl,xwall2
		checkdown:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown

		; wall2r

	checkwall2:
		mov dh,ywall
		sub dh,10
		cmp dh,ypos
		jne letseeanother2r
		mov dh, xwallanother
		cmp dh,xpos
		jne letseeanother2r
		jmp gameLoop
		letseeanother2r:
		;---
		mov dh,ywall2
	
		sub dh,10
		cmp dh,ypos
		jne checkwall3
		
		mov ecx,26
		mov bl,xwallanother
		inc bl
		checkdown2r:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown2r


		;-----------wall 3
		checkwall3:
		mov dh,ywall3
		sub dh,2
		cmp dh,ypos
		jne letseeanotherdown2
		mov dh, xwall3
		cmp dh,xpos
		jne letseeanotherdown2
		jmp gameLoop
		letseeanotherdown2:
		;---
		mov dh,ywall32
		dec dh  
		sub dh,2 
		cmp dh,ypos
		jne checkwall4
		
		mov ecx,75
		mov bl,xwall32
		checkdown2:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown2

		;-------wall 4 below up

		checkwall4:
		mov dh,ywall3
		sub dh,2
		cmp dh,ypos
		jne letseeanotherdown2b
		mov dh, xwallc
		cmp dh,xpos
		jne letseeanotherdown2b
		jmp gameLoop
		letseeanotherdown2b:
		;---
		mov dh,ywallc
		dec dh  
		sub dh,2 
		cmp dh,ypos
		jne wallnewupdown
		
		mov ecx,25
		mov bl,xwallc
		checkdown2b:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown2b


		;---- wallnew up

		wallnewupdown:


		mov dh,ywallcu
		sub dh,2
		cmp dh,ypos
		jne letseeanotherdown2bu
		mov dh, xwallcu
		cmp dh,xpos
		jne letseeanotherdown2bu
		jmp gameLoop
		letseeanotherdown2bu:
		;---
		mov dh,ywallcu
		dec dh  
		sub dh,2 
		cmp dh,ypos
		jne checkdownwall2
		
		mov ecx,25
		mov bl,xwallcu

		checkdown2bu:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown2bu



		checkdownwall2:

	;	mov eax, speed
	;	call delay
	;	mov esi, 0
		
		call UpdatePlayer
		;call UpdatePlayer2
		inc yPos
		cmp yPos,28
		jg AdjustDown
		call DrawPlayer
		jmp gameLoop

			AdjustDown:
			mov yPos,28
			call DrawPlayer
			jmp gameLoop
;--------------------------
;-----   left  ------------
;--------------------------

moveLeft:
mov bl, fruit1x
		cmp xpos,bl
		jne okkkkkk2
		mov dl,fruit1y
		cmp dl,ypos
		jne okkkkkk2
		add score,5
		mov dh,fruit1y
		mov dl,fruit1x
		call Gotoxy
		mov edx,OFFSET fruit1e
		call WriteString
		mov fruit1x,118
		mov fruit1y,0

	okkkkkk2:


	
	mov ecx,100
	mov esi,offset Arraystorexl2
	mov ebx,0

checkalready3:

		mov dl, Arraystorexl2[ebx]
		mov dh,xpos
		cmp dl,xpos
		je checky
		inc ebx

loop checkalready3
jmp checkbelowleft2
checky:
mov al,ypos
cmp al, yfood1
je checkingwallleft

checkbelowleft2:
	mov ecx,100
	mov esi,offset Arraystorexl22
	mov ebx,0

checkalready3left:
		mov dl, Arraystorexl22[ebx]
		mov dh,xpos
		cmp dl,xpos
		je checkbelowy

		inc ebx
loop checkalready3left
jmp chkfood
checkbelowy:
mov al,ypos
cmp al, yfood2
je checkingwallleft
;------ above food

chkfood:
		mov bx,0
		mov bl,ypos
		;dec bl
		cmp bl,yfood1
		jne checkbelowleft
		mov ecx,100
		mov dl,100
		mov ebx,0
		mov bl,xpos

		checkfoodleft:
			cmp xpos,dl
			je addscoreleft
			sub  dl,1
			loop checkfoodleft
		jmp checkbelowleft

	    addscoreleft:
		inc score
		mov ebx,0
		inc lasttime
		mov ebx,lasttime
		mov esi,offset ArrayStorexl2
		mov dl,xpos
		mov ArrayStorexl2[ebx], dl


	
		;---- Below food
		
		checkbelowleft:
		mov bx,0
		mov bl,ypos
		;dec bl
		cmp bl,yfood2
		jne checkingwallleft
		mov ecx,100
		mov dl,100
		mov ebx,0
		mov bl,xpos

		checkfoodleft2:
			cmp xpos,dl
			je addscoreleft2
			sub  dl,1
			loop checkfoodleft2
		jmp checkingwallleft

	    addscoreleft2:
		inc score
		mov ebx,0
		inc lasttime2
		mov ebx,lasttime2
		mov esi,offset ArrayStorexl22
		mov dl,xpos
		mov ArrayStorexl22[ebx], dl


checkingwallleft:
	; wall1 
		mov dh,xwall1
		inc dh
		cmp dh,xpos
		jne checksecondleft
		
		mov ecx,10
		mov bl,ywall
		checkleft2:
		
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleft2
	; wall 2r
	checksecondleft:

		mov dh,xwall1another
		inc dh
		cmp dh,xpos
		jne checkleftbelow
		
		mov ecx,10
		mov bl,ywall
		checkleft2r:
		
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleft2r



		;---- below wall
		checkleftbelow:
		mov dh,xwall3r
		inc dh
		cmp dh,xpos
		jne checkbeloup
		
		mov ecx,3
		mov bl,ywall3
		checkleft:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleft

		;--- below up

		checkbeloup:
		mov dh,xwallc1
		inc dh
		cmp dh,xpos
		jne newwallleft
		
		mov ecx,3
		mov bl,ywallc
		checkleftb:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleftb

		;---------- new wall
		newwallleft:

		mov dh,xwallcu1
		inc dh
		cmp dh,xpos
		jne nowall
		
		mov ecx,3
		mov bl,ywallcu
		checkleftbu:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleftbu

		nowall:
		

		call UpdatePlayer
		
		dec xPos
		cmp xPos,25
		jl adjustLeft
		call DrawPlayer
		jmp gameLoop

				adjustLeft:
				mov xPos,25
				call DrawPlayer
				jmp gameLoop

;---------------------------------------------------
 ;---------  Right

 ;---------------------------

 mov bl, fruit1x
		cmp xpos,bl
		jne okkkkkk3
		mov dl,fruit1y
		cmp dl,ypos
		jne okkkkkk3
		add score,5
		mov dh,fruit1y
		mov dl,fruit1x
		call Gotoxy
		mov edx,OFFSET fruit1e
		call WriteString
		mov fruit1x,118
		mov fruit1y,0

	okkkkkk3:




	moveRight:
	mov ecx,75
	mov esi,offset Arraystorexl2
	mov ebx,0

	checkalready2r:
		mov dl, Arraystorexl2[ebx]
		mov dh,xpos
		cmp dl,xpos
		je rightbelow
		inc ebx
	loop checkalready2r


	mov al,ypos
	cmp al,yfood1
	je addrightfo

	rightbelow:

	mov ecx,75
	mov esi,offset Arraystorexl22
	mov ebx,0

	checkalreadybelow2r:
		mov dl, Arraystorexl22[ebx]
		cmp dl,xpos
		je checkingwallright
		inc ebx
	loop checkalreadybelow2r

	jmp belowri

	addrightfo:

		mov bx,0
		mov bl,ypos
		;dec bl
		cmp bl,yfood1
		jne belowri
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfoodright:
			cmp xpos,dl
			je addscoreright
			add  dl,1
			loop checkfoodright
		jmp belowri

	    addscoreright:
		mov dl,0
		inc score
		mov ebx,0
		inc lasttime
		mov ebx,lasttime
		mov esi,offset ArrayStorexl2
		mov dl,xpos
		mov ArrayStorexl2[ebx], dl

	
	belowri:
		mov bx,0
		mov bl,ypos
		;dec bl
		cmp bl,yfood2
		jne checkingwallright
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfoodright2:
			cmp xpos,dl
			je addscoreright2
			add  dl,1
			loop checkfoodright2
		jmp checkingwallright

	    addscoreright2:
		mov dl,0
		inc score
		mov ebx,0
		inc lasttime2
		mov ebx,lasttime2
		mov esi,offset ArrayStorexl22
		mov dl,xpos
		mov ArrayStorexl22[ebx], dl

		verticalleft:


	checkingwallright:
	; wall 1
		mov dh,xwall
		dec dh  
		cmp dh,xpos
		jne checksecondrightwall
		
		mov ecx,10
		mov bl,ywall
		checkright:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright


		;----wall 2r
		checksecondrightwall:
		mov dh,xwallanother
		dec dh  
		cmp dh,xpos
		jne checkrightwall3
		
		mov ecx,10
		mov bl,ywall
		checkright2r:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright2r

		;---- wall 3 (below)
		checkrightwall3:
		mov dh,xwall3
		dec dh  
		cmp dh,xpos
		jne checkrightwall4
		
		mov ecx,3
		mov bl,ywall3

		checkright2:
		 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright2

		;---- wall 4 (up)
		checkrightwall4:
		mov dh,xwallc
		dec dh  
		cmp dh,xpos
		jne up5wall
		
		mov ecx,3
		mov bl,ywallc

		checkright2b:
		 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright2b


		;-----wall 5
		up5wall:
		mov dh,xwallcu
		dec dh  
		cmp dh,xpos
		jne norightwall
		
		mov ecx,3
		mov bl,ywallcu

		checkright2bu:
		 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright2bu



		;-------------
		norightwall:
	;	mov eax, speed
	;	call delay
	;	mov esi, 0
		
		
		call UpdatePlayer
		inc xPos
		cmp xpos,109
		jg adjustright
		call DrawPlayer
		jmp gameLoop
			adjustright:
				mov xPos,109
				call DrawPlayer
				jmp gameLoop
	;jmp gameLoop

	exitGame:
	ret

	Level2 endp

	;-----------------------------------------------------------------------------
	;-------------------------------------  lEVEL 3
	;------------------------------------------------------------------------------



Level3 PROC

	INVOKE PlaySound, OFFSET beginsound1, NULL,11h
	call maze
	call maze3
	mov eax,15
	call SetTextColor
	mov dl,0
	mov dh,2
	call Gotoxy
	mov edx,OFFSET promptlevel3
	call WriteString
		;seeee:
	call DrawEnemy2
	call DrawEnemy3
	

	gameLoop:

INVOKE PlaySound, OFFSET beginsound1, NULL,11h
	;---------  Enemy
call wrapup
call wrapup2

		call Ghost		
		call Ghost2
		call Ghost3
		mov bl,xpos		
		cmp bl,enemyx
		jne notcollideenmemy1
		mov dl,enemyy
		cmp dl,ypos
		jne notcollideenmemy1
		dec lives
		
		;setting enemy to intial position after collision
		mov enemyx,26
		notcollideenmemy1:

		mov bl,xpos		
		cmp bl,enemy2x
		jne notcollideenmemy2
		mov dl,enemy2y
		cmp dl,ypos
		jne notcollideenmemy2
		dec lives
		
		;setting enemy to intial position after collision
		mov enemy2x,64

		notcollideenmemy2:
		mov bl,0
		mov bl,xpos		
		cmp bl,enemy3x
		jne notcollideenmemy3
		mov dl,enemy3y
		cmp dl,ypos
		jne notcollideenmemy3
		dec lives
		mov enemy3x,27

		notcollideenmemy3:
;--------


		mov bl,enemyx
		cmp bl,30
		jng notfruityet
		cmp bl,100
		jg fruitappear
		mov eax,5
		call SetTextColor
		mov dh,fruit1y
		mov dl,fruit1x
		call Gotoxy
		mov edx,OFFSET fruit1
		call WriteString
		
		
		notfruityet:  
		mov bl,enemyx
		cmp bl,20
		jne fruitappear
		mov dh,fruit1y
		mov dl,fruit1x
		call Gotoxy
		mov edx,OFFSET fruit1e
		call WriteString
		mov fruit1x,118
		mov fruit1y,0


		;--- Enemy position

		fruitappear:
	
		mov bl,enemyx
		cmp bl,100
		jnge continue1hrz

		mov pose,1
		continue1hrz:
		
		mov bl,enemyy
		cmp bl,21
		jne checkingenemy2

		call UpdateEnemy 
		mov enemyx,28
		mov enemyy,6
		mov fruit1x,64
		mov fruit1y,17
		mov pose,0



		checkingenemy2:

		mov bl,enemy2y
		cmp bl,17
		jnge continue1ver
		mov pose1,1

		continue1ver:
		
		mov bl,enemy2x
		cmp bl,100
		jne noenemy
		call UpdateEnemy2 
		mov enemy2x,28
		mov enemy2y,6
		mov pose1,0


		noenemy:

		cmp lives,0
		jne gamenotover
		call clrscr
		call gameover
		ret
		
	gamenotover:
	mov al ,score
	cmp al,255
	jne notwonyet
	call clrscr
	call won
	ret
	notwonyet:
	mov bl,xpos
	cmp bl,groundxpos
	jne notgorund
	mov bl,ypos
	cmp bl,groundypos
	jne notgorund
	mov dl,0
	mov dh,2
	call Gotoxy
	mov edx,OFFSET ground1


	notgorund:

		mov eax,15
		call SetTextColor

		; draw score:
		mov dl,0
		mov dh,4
		call Gotoxy
		mov edx,OFFSET strScore
		call WriteString
		mov eax,2
		call SetTextColor
		mov al,score
		call WriteInt
		
		mov eax,15
		call SetTextColor
		mov dl,0
		mov dh,6
		call Gotoxy
		mov edx,OFFSET livesprompt
		call WriteString

		mov eax,2
		call SetTextColor
		mov al,lives
		call WriteInt
		
		mov eax,14
		call SetTextColor

		mov dl,106						;move cursor to coordinates
		mov dh,0
		call Gotoxy

		; get user key input:
		call ReadKey
					;jump if no key is entered
		processInput:
		
		mov inputChar,al

		; exit game if user types 'x':
		cmp inputChar,"x"
		je exitGame

		cmp inputChar,"c"
		je gameLoop

		cmp inputChar, "p"
		je pausegame

		cmp inputChar,"w"
		je moveUp

		cmp inputChar,"s"
		je moveDown

		cmp inputChar,"a"
		je moveLeft

		cmp inputChar,"d"
		je moveRight

		jmp gameLoop

		
	pausegame:

		mov dh,20
		mov dl,2
		call Gotoxy
		mov  edx,OFFSET prompt1234
		call writestring

		mov dh,22
		mov dl,2
		call Gotoxy
		mov  edx,OFFSET prompt123
		call writestring
		call readChar
	
		;call MsgBoxAsk

		cmp al, 'c'
		je continue
		jmp pausegame
		
		call ReadChar
		mov inputChar,al
		cmp al, "c"
		je continue
		jmp pausegame

	
	;	call maze
		;call clrscr
		

	;	call DrawPlayer
		jmp gameLoop

		;-----------------------
		;-------------  UP
		;-------------------------------
	continue:
		mov dh,20
		mov dl,2
		call Gotoxy
		mov  edx,OFFSET prompt1234s
		call writestring

		mov dh,22
		mov dl,3
		call Gotoxy
		mov  edx,OFFSET prompt123s
		call writestring

	moveUp:
	mov bl, fruit1x
		cmp xpos,bl
		jne okkkkkk
		mov dl,fruit1y
		cmp dl,ypos
		jne okkkkkk
		add score,5
		mov dh,fruit1y
		mov dl,fruit1x
		call Gotoxy
		mov edx,OFFSET fruit1e
		call WriteString
		mov fruit1x,118
		mov fruit1y,0

	okkkkkk:
	
		
		; Food1 top
		mov ecx,75
		mov esi,offset Arraystorexl3
		mov ebx,0
	checkalready:
		mov dl, Arraystorexl3[ebx]
		mov dh,xpos
		cmp dl,xpos
		je secondcheckfood

		inc ebx
	loop checkalready

	mov al,ypos
	dec al
	cmp al, yfood1
	je addup1

	;-------- second food below
	secondcheckfood:
	mov ecx,75
		mov esi,offset Arraystorexl32
		mov ebx,0
	checkalreadybelow:
		mov dl, Arraystorexl32[ebx]
		mov dh,xpos
		cmp dl,xpos
		je thirdcheckfood
		inc ebx

	loop checkalreadybelow

	mov al,ypos
	dec al
	cmp al, yfood2
	je addup2

	;--- up left

	thirdcheckfood:
		mov ecx,75
		mov esi,offset Arraystoreyl3u
		mov ebx,0
	checkalreadyleftup:
		mov dl, Arraystoreyl3u[ebx]
		mov dh,ypos
		cmp dl,ypos
		je fourthcheckfood
		inc ebx
	loop checkalreadyleftup

	mov al,xpos
	cmp al, xfood1
	je addup3

	;up mid
	fourthcheckfood:
	
		mov ecx,75
		mov esi,offset Arraystoreyl3u1
		mov ebx,0
	checkalreadyleftup1:
		mov dl, Arraystoreyl3u1[ebx]
		mov dh,ypos
		cmp dl,ypos
		je checkingwall
		inc ebx
	loop checkalreadyleftup1

	mov al,xpos
	cmp al, 65
	je addup4

	fifthcheckfood:

		mov ecx,75
		mov esi,offset Arraystoreyl3u2
		mov ebx,0
	checkalreadyrightup1:
		mov dl, Arraystoreyl3u2[ebx]
		mov dh,ypos
		cmp dl,ypos
		je checkingwall
		inc ebx
	loop checkalreadyrightup1

	jmp addup5
	addup1:
	;-----
	;food collision
		mov bx,0
		mov bl,ypos
		dec bl
		cmp bl,yfood1
		jne BelowFoodup
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup:
			cmp xpos,dl
			je addscore
			add  dl,1
			loop checkfoodup
		jmp checkingwall

	    addscore:
		inc score
		mov ebx,0
		inc lasttime
		mov ebx,lasttime
		mov esi,offset ArrayStorexl3
		mov dl,xpos
		mov ArrayStorexl3[ebx], dl

	addup2:
		;------------- Below food
		BelowFoodup:
		mov bx,0
		mov bl,ypos
		dec bl
		cmp bl,yfood2
		jne checkingwall
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfooddown:
			cmp xpos,dl
			je addscore2
			add  dl,1
			loop checkfooddown
		jmp checkingwall

	    addscore2:
		inc score
		mov ebx,0
		inc lasttime2
		mov ebx,lasttime2
		mov esi,offset ArrayStorexl32
		mov dl,xpos
		mov ArrayStorexl32[ebx], dl


	addup3:	

		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,xfood1
		jne checkingwall
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup1:
			cmp ypos,dl
			je addscore3
			add  dl,1
			loop checkfoodup1
		jmp checkingwall

	    addscore3:
		inc score
		mov ebx,0
		inc lasttime3
		mov ebx,lasttime3
		mov esi,offset ArrayStoreyl3u
		mov dl,ypos
		mov ArrayStoreyl3u[ebx], dl

	addup4:
		
		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,65
		jne checkingwall
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup2:
			cmp ypos,dl
			je addscore4
			add  dl,1
			loop checkfoodup2
		jmp checkingwall

	    addscore4:
		inc score
		mov ebx,0
		inc lasttime4
		mov ebx,lasttime4
		mov esi,offset ArrayStoreyl3u1
		mov dl,ypos
		mov ArrayStoreyl3u1[ebx], dl


	addup5:
		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,xfood3
		jne checkingwall
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup3:
			cmp ypos,dl
			je addscore5
			add  dl,1
			loop checkfoodup3
		jmp checkingwall

	    addscore5:
		inc score
		mov ebx,0
		inc lasttime5
		mov ebx,lasttime5
		mov esi,offset ArrayStoreyl3u2
		mov dl,ypos
		mov ArrayStoreyl3u2[ebx], dl

		; for single going vertical up 
		checkingwall:
		;----------------- wall 1
		mov dh,ywall
		inc dh
		cmp dh,ypos
		jne letseeanotherup
		mov dh, xwall
		cmp dh,xpos
		jne letseeanotherup
		jmp gameLoop

		letseeanotherup:
		;---
		mov dh,ywall2
		inc dh  
		cmp dh,ypos
		jne anotherwallr
		
		mov ecx,26
		mov bl,xwall2
		checkupp:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkupp
;--------------------------- wall 2 r
		anotherwallr:


		mov dh,ywall
		inc dh
		cmp dh,ypos
		jne letseeanotherupr
		mov dh, xwallanother
		cmp dh,xpos
		jne letseeanotherupr
		jmp gameLoop

		letseeanotherupr:
		;---
		mov dh,ywall2
		inc dh  
		cmp dh,ypos
		jne anotherwall
		
		mov ecx,26
		mov bl,xwallanother
		inc bl
		checkuppr:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkuppr



		;-------

		anotherwall:
		
		mov dh,ywall3
		inc dh
		cmp dh,ypos
		jne letseeanotherup2
		mov dh, xwall3
		cmp dh,xpos
		jne letseeanotherup2
		jmp gameLoop

		letseeanotherup2:
		;---
		mov dh,ywall32
		inc dh  
		cmp dh,ypos
		jne belowupwall
		
		mov ecx,75
		mov bl,xwall32
		checkupp2:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkupp2

;--------------------------------
	belowupwall:
		mov dh,ywallc
		inc dh
		cmp dh,ypos
		jne letseeanotherup3
		mov dh, xwall3
		cmp dh,xpos
		jne letseeanotherup3
		jmp gameLoop

		letseeanotherup3:
		;---
		mov dh,ywallc
		inc dh  
		cmp dh,ypos
		jne upnewwall
		
		mov ecx,25
		mov bl,xwallc
		checkupp3:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkupp3

		;-------- upnew
		upnewwall:

			mov dh,ywallcu
		inc dh
		cmp dh,ypos
		jne letseeanotherup4
		mov dh, xwallcu
		cmp dh,xpos
		jne letseeanotherup4
		jmp gameLoop

		letseeanotherup4:
		;---
		mov dh,ywallcu
		inc dh  
		cmp dh,ypos
		jne letseeanotherup5
		
		mov ecx,25
		mov bl,xwallcu
		checkupp4:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkupp4


		letseeanotherup5:
		;---
		mov dh,ywallcuu1
		inc dh  
		cmp dh,ypos
		jne lev3comdl
		
		mov ecx,15
		mov bl,xwallcuu1
		checkupp4u:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkupp4u

		 ;lvel3 2nd downleft

		 lev3comdl:

		mov dh,ywallcuud1
		inc dh  
		cmp dh,ypos
		jne uprightlev3
		
		mov ecx,15
		mov bl,xwallcuu1
		checkupp4ud:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkupp4ud

		;--- level3 up right

		;---
		uprightlev3:
		mov dh,ywallcuu1
		inc dh  
		cmp dh,ypos
		jne nomorecheck
		
		mov ecx,15
		mov bl,xwallcuul1
		checkupp4ur:
		
		;mov dh, 

		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkupp4ur



;===
		nomorecheck:

			call UpdatePlayer
		
		;mov eax, speed
		;call delay
		;mov esi, 0
	
	
	
			dec yPos
			cmp ypos,2
			jl AdjustUp
			call DrawPlayer
		    mov ecx,0
	;		mov eax,170
	;		call Delay
	;	loop jumpLoop

		jmp gameLoop

		AdjustUp:
			mov Ypos,2
			call DrawPlayer
			jmp gameLoop

		; ----   Down
	moveDown:

		mov bl, fruit1x
		cmp xpos,bl
		jne okkkkkk1
		mov dl,fruit1y
		cmp dl,ypos
		jne okkkkkk1
		add score,5
		mov dh,fruit1y
		mov dl,fruit1x
		call Gotoxy
		mov edx,OFFSET fruit1e
		call WriteString
		mov fruit1x,118
		mov fruit1y,0

	okkkkkk1:


		mov bl,xpos		
		cmp bl,enemyx
		jne ohh2
		mov dl,enemyy
		cmp dl,ypos
		jne ohh2
		dec lives
		mov enemyx,26
		ohh2:
				
		; Food1 top
		mov ecx,75
		mov esi,offset Arraystorexl3
		mov ebx,0
	checkalready2:
		mov dl, Arraystorexl3[ebx]
		mov dh,xpos
		cmp dl,xpos
		je secondcheckfood2
		inc ebx

	loop checkalready2

	mov al,ypos
	inc al
	cmp al, yfood1
	je addup12

	;-------- second food below
	secondcheckfood2:
	    mov ecx,75
		mov esi,offset Arraystorexl32
		mov ebx,0
	checkalreadybelow2:
		mov dl, Arraystorexl32[ebx]
		cmp dl,xpos
		je thirdcheckfood2
		inc ebx
	loop checkalreadybelow2

	mov al,ypos
	inc al
	cmp al, yfood2
	je addup22

	;--- up left

	thirdcheckfood2:
		mov ecx,50
		mov esi,offset Arraystoreyl3u
		mov ebx,0

	checkalreadyleftup2:
		mov dl, Arraystoreyl3u[ebx]
		mov dh,ypos
		cmp dl,ypos
		je fourthcheckfood2
		inc ebx
	loop checkalreadyleftup2

	mov al,xpos
	cmp al, xfood1
	je addup32

	;up mid
	fourthcheckfood2:
	
		mov ecx,50
		mov esi,offset Arraystoreyl3u1
		mov ebx,0
	checkalreadyleftup12:
		mov dl, Arraystoreyl3u1[ebx]
		mov dh,ypos
		cmp dl,ypos
		je checkingwall2
		inc ebx
	loop checkalreadyleftup12

	mov al,xpos
	cmp al, 65
	je addup42

	fifthcheckfood2:

		mov ecx,50
		mov esi,offset Arraystoreyl3u2
		mov ebx,0
	checkalreadyrightup12:
		mov dl, Arraystoreyl3u2[ebx]
		mov dh,ypos
		cmp dl,ypos
		je checkingwall2
		inc ebx
	loop checkalreadyrightup12

	jmp addup52

	addup12:
	;-----
	;food collision
		mov bx,0
		mov bl,ypos
		inc bl
		cmp bl,yfood1
		jne BelowFoodup2
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup2d:
			cmp xpos,dl
			je addscore1
			add  dl,1
			loop checkfoodup2d
		jmp checkingwall2

	    addscore1:
		inc score
		mov ebx,0
		inc lasttime
		mov ebx,lasttime
		mov esi,offset ArrayStorexl3
		mov dl,xpos
		mov ArrayStorexl3[ebx], dl

	addup22:
		;------------- Below food
		BelowFoodup2:
		mov bx,0
		mov bl,ypos
		inc bl
		cmp bl,yfood2
		jne checkingwall2
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfooddown2:
			cmp xpos,dl
			je addscore22
			add  dl,1
			loop checkfooddown2
		jmp checkingwall2

	    addscore22:
		inc score
		mov ebx,0
		inc lasttime2
		mov ebx,lasttime2
		mov esi,offset ArrayStorexl32
		mov dl,xpos
		mov ArrayStorexl32[ebx], dl

;left
	addup32:	

		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,xfood1
		jne checkingwall2
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup12:
			cmp ypos,dl
			je addscore32
			add  dl,1
			loop checkfoodup12

		jmp checkingwall2

	    addscore32:
		inc score
		mov ebx,0
		inc lasttime3
		mov ebx,lasttime3
		mov esi,offset ArrayStoreyl3u
		mov dl,ypos
		mov ArrayStoreyl3u[ebx], dl

		; mid
	addup42:
		
		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,65
		jne checkingwall2
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup22:
			cmp ypos,dl
			je addscore42
			add  dl,1
			loop checkfoodup22
		jmp checkingwall2

	    addscore42:
		inc score
		mov ebx,0
		inc lasttime4
		mov ebx,lasttime4
		mov esi,offset ArrayStoreyl3u1
		mov dl,ypos
		mov ArrayStoreyl3u1[ebx], dl

	; right
	addup52:
		mov bx,0
		mov bl,xpos
		;dec bl
		cmp bl,xfood3
		jne checkingwall2
		mov ecx,30
		mov dl,yfood1
		mov ebx,0
		mov bl,xpos

		checkfoodup32:
			cmp ypos,dl
			je addscore52
			add  dl,1
			loop checkfoodup32

		jmp checkingwall2

	    addscore52:
		inc score
		mov ebx,0
		inc lasttime5
		mov ebx,lasttime5
		mov esi,offset ArrayStoreyl3u2
		mov dl,ypos
		mov ArrayStoreyl3u2[ebx], dl


		;checking wall

		checkingwall2:
		;--- wall1
		mov dh,ywall
		sub dh,10
		cmp dh,ypos
		jne letseeanother
		mov dh, xwall
		cmp dh,xpos
		jne letseeanother
		jmp gameLoop
		letseeanother:
		;---
		mov dh,ywall2
	
		sub dh,10
		cmp dh,ypos
		jne checkwall2
		
		mov ecx,26
		mov bl,xwall2
		checkdown:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown

		; wall2r

	checkwall2:
		mov dh,ywall
		sub dh,10
		cmp dh,ypos
		jne letseeanother2r
		mov dh, xwallanother
		cmp dh,xpos
		jne letseeanother2r
		jmp gameLoop
		letseeanother2r:
		;---
		mov dh,ywall2
	
		sub dh,10
		cmp dh,ypos
		jne checkwall3
		
		mov ecx,26
		mov bl,xwallanother
		inc bl
		checkdown2r:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown2r


		;-----------wall 3
		checkwall3:
		mov dh,ywall3
		sub dh,2
		cmp dh,ypos
		jne letseeanotherdown2
		mov dh, xwall3
		cmp dh,xpos
		jne letseeanotherdown2
		jmp gameLoop
		letseeanotherdown2:
		;---
		mov dh,ywall32
		dec dh  
		sub dh,2 
		cmp dh,ypos
		jne checkwall4
		
		mov ecx,75
		mov bl,xwall32
		checkdown2:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown2

		;-------wall 4 below up

		checkwall4:
		mov dh,ywall3
		sub dh,2
		cmp dh,ypos
		jne letseeanotherdown2b
		mov dh, xwallc
		cmp dh,xpos
		jne letseeanotherdown2b
		jmp gameLoop
		letseeanotherdown2b:
		;---
		mov dh,ywallc
		dec dh  
		sub dh,2 
		cmp dh,ypos
		jne wallnewupdown
		
		mov ecx,25
		mov bl,xwallc
		checkdown2b:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown2b


		;---- wallnew up

		wallnewupdown:


		mov dh,ywallcu
		sub dh,2
		cmp dh,ypos
		jne letseeanotherdown2bu
		mov dh, xwallcu
		cmp dh,xpos
		jne letseeanotherdown2bu
		jmp gameLoop


		letseeanotherdown2bu:
		;---
		mov dh,ywallcu
		dec dh  
		sub dh,2 
		cmp dh,ypos
		jne level3com
		
		mov ecx,25
		mov bl,xwallcu

		checkdown2bu:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown2bu
		
		;-- wallclevel3complex
		level3com:

		mov dh,ywallcuu1
		dec dh  
		sub dh,2 
		cmp dh,ypos
		jne level3d1
		
		mov ecx,15
		mov bl,xwallcuu1

		checkdown2buu:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown2buu

		level3d1:

			mov dh,ywallcuud1
		dec dh  
		sub dh,2 
		cmp dh,ypos
		jne lev3downrightup
		
		mov ecx,15
		mov bl,xwallcuu1

		checkdown2buud:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown2buud

		lev3downrightup:
		
		mov dh,ywallcuu1
		dec dh  
		sub dh,2 
		cmp dh,ypos
		jne checkdownwall2
		
		mov ecx,15
		mov bl,xwallcuul1

		checkdown2buur:
		
		;mov dh, 
		cmp bl,xpos
		je gameLoop
		inc bl
		loop checkdown2buur



		checkdownwall2:

;-- End of walls
		
		call UpdatePlayer
		;call UpdatePlayer2
		inc yPos
		cmp yPos,28
		jg AdjustDown
		call DrawPlayer
		jmp gameLoop

			AdjustDown:
			mov yPos,28
			call DrawPlayer
			jmp gameLoop
;--------------------------
;-----   left  ------------
;--------------------------

moveLeft:
mov bl, fruit1x
		cmp xpos,bl
		jne okkkkkk2
		mov dl,fruit1y
		cmp dl,ypos
		jne okkkkkk2
		add score,5
		mov dh,fruit1y
		mov dl,fruit1x
		call Gotoxy
		mov edx,OFFSET fruit1e
		call WriteString
		mov fruit1x,118
		mov fruit1y,0

	okkkkkk2:


	
	mov ecx,100
	mov esi,offset Arraystorexl3
	mov ebx,0

checkalready3:

		mov dl, Arraystorexl3[ebx]
		mov dh,xpos
		cmp dl,xpos
		je checky
		inc ebx

loop checkalready3
jmp checkbelowleft2
checky:
mov al,ypos
cmp al, yfood1
je checkingwallleft

checkbelowleft2:
	mov ecx,100
	mov esi,offset Arraystorexl32
	mov ebx,0

checkalready3left:
		mov dl, Arraystorexl32[ebx]
		mov dh,xpos
		cmp dl,xpos
		je checkbelowy

		inc ebx
loop checkalready3left
jmp chkfood
checkbelowy:
mov al,ypos
cmp al, yfood2
je checkingwallleft
;------ above food

chkfood:
		mov bx,0
		mov bl,ypos
		;dec bl
		cmp bl,yfood1
		jne checkbelowleft
		mov ecx,100
		mov dl,100
		mov ebx,0
		mov bl,xpos

		checkfoodleft:
			cmp xpos,dl
			je addscoreleft
			sub  dl,1
			loop checkfoodleft
		jmp checkbelowleft

	    addscoreleft:
		inc score
		mov ebx,0
		inc lasttime
		mov ebx,lasttime
		mov esi,offset ArrayStorexl3
		mov dl,xpos
		mov ArrayStorexl3[ebx], dl


	
		;---- Below food
		
		checkbelowleft:
		mov bx,0
		mov bl,ypos
		;dec bl
		cmp bl,yfood2
		jne checkingwallleft
		mov ecx,100
		mov dl,100
		mov ebx,0
		mov bl,xpos

		checkfoodleft2:
			cmp xpos,dl
			je addscoreleft2
			sub  dl,1
			loop checkfoodleft2
		jmp checkingwallleft

	    addscoreleft2:
		inc score
		mov ebx,0
		inc lasttime2
		mov ebx,lasttime2
		mov esi,offset ArrayStorexl32
		mov dl,xpos
		mov ArrayStorexl32[ebx], dl


checkingwallleft:
	; wall1 
		mov dh,xwall1
		inc dh
		cmp dh,xpos
		jne checksecondleft
		
		mov ecx,10
		mov bl,ywall
		checkleft2:
		
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleft2
	; wall 2r
	checksecondleft:

		mov dh,xwall1another
		inc dh
		cmp dh,xpos
		jne checkleftbelow
		
		mov ecx,10
		mov bl,ywall
		checkleft2r:
		
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleft2r



		;---- below wall
		checkleftbelow:
		mov dh,xwall3r
		inc dh
		cmp dh,xpos
		jne checkbeloup
		
		mov ecx,3
		mov bl,ywall3
		checkleft:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleft

		;--- below up

		checkbeloup:
		mov dh,xwallc1
		inc dh
		cmp dh,xpos
		jne newwallleft
		
		mov ecx,3
		mov bl,ywallc
		checkleftb:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleftb

		;---------- new wall
		newwallleft:

		mov dh,xwallcu1
		inc dh
		cmp dh,xpos
		jne lev3wall1
		
		mov ecx,3
		mov bl,ywallcu
		checkleftbu:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleftbu

		;---- complexlevel3 1
		lev3wall1:

		mov dh,xwallcuu12
		inc dh
		cmp dh,xpos
		jne lev3wall2
		
		mov ecx,3
		mov bl,ywallcuu1
		checkleftbuu:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleftbuu

		lev3wall2:

		
		mov dh,xwallcuu12
		inc dh
		cmp dh,xpos
		jne lev3rightupl
		
		mov ecx,3
		mov bl,ywallcuud1
		checkleftbuul:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleftbuul


		;--- lev3 right up
		lev3rightupl:

		mov dh,xwallcuu1l2
		inc dh
		cmp dh,xpos
		jne nowall
		
		mov ecx,3
		mov bl,ywallcuu1
		checkleftbuur:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkleftbuur


		nowall:
		

		call UpdatePlayer
		
		dec xPos
		cmp xPos,25
		jl adjustLeft
		call DrawPlayer
		jmp gameLoop

				adjustLeft:
				mov xPos,25
				call DrawPlayer
				jmp gameLoop

;---------------------------------------------------
 ;---------  Right

 ;---------------------------

 mov bl, fruit1x
		cmp xpos,bl
		jne okkkkkk3
		mov dl,fruit1y
		cmp dl,ypos
		jne okkkkkk3
		add score,5
		mov dh,fruit1y
		mov dl,fruit1x
		call Gotoxy
		mov edx,OFFSET fruit1e
		call WriteString
		mov fruit1x,118
		mov fruit1y,0

	okkkkkk3:




	moveRight:
	mov ecx,75
	mov esi,offset Arraystorexl3
	mov ebx,0

	checkalready2r:
		mov dl, Arraystorexl3[ebx]
		mov dh,xpos
		cmp dl,xpos
		je rightbelow
		inc ebx
	loop checkalready2r


	mov al,ypos
	cmp al,yfood1
	je addrightfo

	rightbelow:

	mov ecx,75
	mov esi,offset Arraystorexl32
	mov ebx,0

	checkalreadybelow2r:
		mov dl, Arraystorexl32[ebx]
		cmp dl,xpos
		je checkingwallright
		inc ebx
	loop checkalreadybelow2r

	jmp belowri

	addrightfo:

		mov bx,0
		mov bl,ypos
		;dec bl
		cmp bl,yfood1
		jne belowri
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfoodright:
			cmp xpos,dl
			je addscoreright
			add  dl,1
			loop checkfoodright
		jmp belowri

	    addscoreright:
		mov dl,0
		inc score
		mov ebx,0
		inc lasttime
		mov ebx,lasttime
		mov esi,offset ArrayStorexl3
		mov dl,xpos
		mov ArrayStorexl3[ebx], dl

	
	belowri:
		mov bx,0
		mov bl,ypos
		;dec bl
		cmp bl,yfood2
		jne checkingwallright
		mov ecx,75
		mov dl,xfood1
		mov ebx,0
		mov bl,xpos

		checkfoodright2:
			cmp xpos,dl
			je addscoreright2
			add  dl,1
			loop checkfoodright2
		jmp checkingwallright

	    addscoreright2:
		mov dl,0
		inc score
		mov ebx,0
		inc lasttime2
		mov ebx,lasttime2
		mov esi,offset ArrayStorexl32
		mov dl,xpos
		mov ArrayStorexl32[ebx], dl

		verticalleft:


	checkingwallright:
	; wall 1
		mov dh,xwall
		dec dh  
		cmp dh,xpos
		jne checksecondrightwall
		
		mov ecx,10
		mov bl,ywall
		checkright:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright


		;----wall 2r
		checksecondrightwall:
		mov dh,xwallanother
		dec dh  
		cmp dh,xpos
		jne checkrightwall3
		
		mov ecx,10
		mov bl,ywall
		checkright2r:
		
		;mov dh, 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright2r

		;---- wall 3 (below)
		checkrightwall3:
		mov dh,xwall3
		dec dh  
		cmp dh,xpos
		jne checkrightwall4
		
		mov ecx,3
		mov bl,ywall3

		checkright2:
		 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright2

		;---- wall 4 (up)
		checkrightwall4:
		mov dh,xwallc
		dec dh  
		cmp dh,xpos
		jne up5wall
		
		mov ecx,3
		mov bl,ywallc

		checkright2b:
		 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright2b


		;-----wall 5
		up5wall:
		mov dh,xwallcu
		dec dh  
		cmp dh,xpos
		jne lev3right1
		
		mov ecx,3
		mov bl,ywallcu

		checkright2bu:
		 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright2bu

		;-- wall6 level 3 complex 1
		lev3right1:

		mov dh,xwallcuu1
		dec dh  
		cmp dh,xpos
		jne lev3right2
		
		mov ecx,3
		mov bl,ywallcuu1

		checkright2buu:
		 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright2buu

		;-- wall6 level3 complex 2 down
		lev3right2:

		
		mov dh,xwallcuu1
		dec dh  
		cmp dh,xpos
		jne lev3up2
		
		mov ecx,3
		mov bl,ywallcuud1

		checkright2buuu:
		 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright2buuu

		lev3up2:		

		mov dh,xwallcuul1
		dec dh  
		cmp dh,xpos
		jne norightwall
		
		mov ecx,3
		mov bl,ywallcuu1

		checkright2buur:
		 
		cmp bl,ypos
		je gameLoop
		dec bl
		loop checkright2buur

		;-------------
		norightwall:
	;	mov eax, speed
	;	call delay
	;	mov esi, 0
		
		
		call UpdatePlayer
		inc xPos
		cmp xpos,109
		jg adjustright
		call DrawPlayer
		jmp gameLoop
			adjustright:
				mov xPos,109
				call DrawPlayer
				jmp gameLoop
	;jmp gameLoop

	exitGame:
	ret

Level3 endp

Ghost PROC

		mov eax,80
		call Delay

		call UpdateEnemy
		mov bl,pose
		cmp bl,1
		jne hriz12
		add enemyy,1
		jmp skiphrz12
		hriz12:
		add enemyx,1
		skiphrz12:
		call DrawEnemy
		ret
	Ghost endp


Ghost2 PROC
	
		call UpdateEnemy2

		mov bl,pose1
		cmp bl,1
		jne hriz12
		add enemy2x,1
		jmp skiphrz12
		hriz12:
		add enemy2y,1
		skiphrz12:
		call DrawEnemy2
		ret

		Ghost2 endp
Ghost3 PROC
	 call UpdateEnemy3

		add enemy3x,1
		mov bl,102
		cmp enemy3x,bl
		je resetp 
		call DrawEnemy3
		jmp exiting
		resetp:
		mov enemy3x,27
		call DrawEnemy3
		exiting:
		ret
	 
	 Ghost3 endp

Instructions PROC

	call clrscr
	mov eax,4
	call SetTextColor

	
	mov dl,34
	mov dh,2	
	call Gotoxy
    mov edx, offset i1   ; mov string offset in edx
    call writestring 

	mov eax,15
	call SetTextColor

	
	mov dl,2
	mov dh,5	
	call Gotoxy
    mov edx, offset i2   ; mov string offset in edx
    call writestring 


	mov dl,2
	mov dh,7	
	call Gotoxy
    mov edx, offset i3   ; mov string offset in edx
    call writestring 


	mov dl,2
	mov dh,9
	call Gotoxy
    mov edx, offset i4   ; mov string offset in edx
    call writestring 

	
	mov dl,2
	mov dh,11
	call Gotoxy
    mov edx, offset i5   ; mov string offset in edx
    call writestring 

	mov dl,0
	mov dh,29
	call Gotoxy
	ret

Instructions endp

startscreen PROC

mov eax,12
call SetTextColor
	mov dh,9
	mov dl,27
	call Gotoxy
    mov edx, offset title1   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
mov eax,12
call SetTextColor
	mov dh,10
	mov dl,27
	call Gotoxy
    mov edx, offset title2   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
mov eax,15
call SetTextColor
	mov dh,11
	mov dl,27
	call Gotoxy
    mov edx, offset title3   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
	mov eax,15
	call SetTextColor
	mov dh,12
	mov dl,27

	call Gotoxy
    mov edx, offset title4   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	ret

	startscreen endp
DrawPlayer PROC
	; draw player at (xPos,yPos):
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	mov al,"X"
	call WriteChar
	ret
DrawPlayer ENDP

UpdatePlayer PROC
	mov dl,xPos
	mov dh,yPos
	call Gotoxy

	mov al," "
	call WriteChar
	ret
UpdatePlayer ENDP

DrawEnemy PROC
mov eax,10
	call SetTextColor

	
	mov dl,enemyx
	mov dh,enemyy
	call Gotoxy
	mov dl, al			;temporarily save al in dl
	mov al, "E"	
	call WriteChar
	mov al, dl			
	ret
DrawEnemy endp
DrawEnemy2 PROC
mov eax,10
	call SetTextColor

	
	mov dl,enemy2x
	mov dh,enemy2y
	call Gotoxy
	mov dl, al			;temporarily save al in dl
	mov al, "E"	
	call WriteChar
	mov al, dl			
	ret
DrawEnemy2 endp
DrawEnemy3 PROC
mov eax,10
	call SetTextColor

	
	mov dl,enemy3x
	mov dh,enemy3y
	call Gotoxy
	mov dl, al			;temporarily save al in dl
	mov al, "E"	
	call WriteChar
	mov al, dl			
	ret
DrawEnemy3 endp

UpdateEnemy PROC		; erase player at (xPos,yPos)
	mov dl,enemyx
	mov dh,enemyy
	call Gotoxy
	mov dl, al			;temporarily save al in dl
	mov al, " "
	call WriteChar
	mov al, dl
	
	ret
UpdateEnemy ENDP

wrapup PROC

mov bl,57
cmp xPos,bl
jne exiting
mov ecx,7
mov dl,16
l2:
cmp dl,ypos
je settingpos
sub dl,1
loop l2
jmp exiting

settingpos:
call UpdatePlayer
mov xPos,29
exiting:
ret
wrapup endp

wrapup2 PROC

mov bl,28
cmp yPos,bl
jne exiting
mov ecx,107
mov dl,31
l2:
cmp dl,xpos
je settingpos
inc dl
loop l2
jmp exiting

settingpos:
call UpdatePlayer
mov yPos,2
exiting:
ret
wrapup2 endp


UpdateEnemy2 PROC		; erase player at (xPos,yPos)
	mov dl,enemy2x
	mov dh,enemy2y
	call Gotoxy
	mov dl, al			;temporarily save al in dl
	mov al, " "
	call WriteChar
	mov al, dl
	
	ret
UpdateEnemy2 ENDP

UpdateEnemy3 PROC		; erase player at (xPos,yPos)
	mov dl,enemy3x
	mov dh,enemy3y
	call Gotoxy
	mov dl, al			;temporarily save al in dl
	mov al, " "
	call WriteChar
	mov al, dl
	
	ret
UpdateEnemy3 ENDP




 Namegame PROC
	;Name asking
	mov eax,14
	call SetTextColor
	mov dh,0
	mov dl,0
	mov bl,dl
	mov ecx,118
	startdesign:
	mov dl,bl
	mov dh,0
	call Gotoxy
	mov edx,offset strtd
	call writechar
	inc bl
	loop startdesign

	mov eax,8
	call SetTextColor	
	mov dh,15
	mov dl,29
	call Gotoxy
    mov edx, offset prompt   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	mov eax,12
	call SetTextColor

    mov edx, offset nameStr
    mov ecx, 255
    call readstring


   
	ret
 Namegame endp

 Menu PROC
 
; Menu screen

    call clrscr


	mov eax,4
	call SetTextColor
	mov dh,6
	mov dl,30
	call Gotoxy
    mov edx, offset m1
	; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
mov eax,2
call SetTextColor
	mov dh,7
	mov dl,30
	call Gotoxy
    mov edx, offset m2   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
mov eax,9
call SetTextColor
	mov dh,8
	mov dl,30
	call Gotoxy
    mov edx, offset m3   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
	mov eax,8
	call SetTextColor
	mov dh,9
	mov dl,30

	call Gotoxy
    mov edx, offset m4   ; mov string offset in edx
    call writestring    ; writestring will print content in edx

	mov eax,4
	call SetTextColor
	mov dh,10
	mov dl,30

	call Gotoxy
    mov edx, offset m5   ; mov string offset in edx
    call writestring    ; writestring will print content in edx

	mov eax,4
	call SetTextColor
	mov dh,11
	mov dl,30

	call Gotoxy
    mov edx, offset m6  ; mov string offset in edx
    call writestring    ; writestring will print content in edx

	mov eax,4
	call SetTextColor
	mov dh,12
	mov dl,30

	call Gotoxy
    mov edx, offset m7   ; mov string offset in edx
    call writestring    ; writestring will print content in edx

	mov eax,300
	call Delay
	


	mov eax,8
	call SetTextColor
	mov dl,33
	mov dh,14
	call Gotoxy
	
	mov edx, offset stringmenu1   ; mov string offset in edx
	call writestring    ; writestring will print content in edx
	
	
	mov eax,300
	call Delay

	mov dl,33
	mov dh,16

	call Gotoxy
	mov edx, offset stringmenu2   ; mov string offset in edx
	call writestring    ; writestring will print content in edx
	
	mov dl,33
	mov dh,18

	call Gotoxy
	mov edx, offset stringmenu3   ; mov string offset in edx
	call writestring    ; writestring will print content in edx
	
	mov dl,33
	mov dh,20

	call Gotoxy
	mov edx, offset stringmenu4  ; mov string offset in edx
	call writestring    ; writestring will print content in edx

	mov dl,33
	mov dh,22

	call Gotoxy
	mov edx, offset stringmenu5  ; mov string offset in edx
	call writestring    ; writestring will print content in edx

	mov dl,33
	mov dh,24

	call Gotoxy
	mov edx, offset stringmenu6  ; mov string offset in edx
	call writestring    ; writestring will print content in edx


	ret

 Menu endp

 maze PROC
 

;-----------------------Main Maze--------------
start::


;-------- Lower
	call clrscr
    mov eax,90
	call SetTextColor
	mov dl,24
	mov dh,29
	call Gotoxy
	mov edx,OFFSET ground
	call WriteString


	

;------- Upper
	mov dl,24
	mov dh,1
	call Gotoxy

	mov edx,OFFSET ground1
	mov groundxpos , dl
	mov groundypos , dh
	call WriteString

;---- Left side

	mov ecx,29
    mov dh,1
	mov temp,dh
	mov eax,white*10
	call SetTextColor
    leftboundary:
		mov dh,temp
		mov dl,24
		call Gotoxy
		mov edx,OFFSET rightside
		call WriteString
		inc temp

    loop leftboundary

;  rightside
		
		mov ecx,29
		mov dh,1
		mov temp,dh

    rightboundary:

		mov dh,temp
		mov dl,110
		call Gotoxy
		mov edx,OFFSET rightside
		call WriteString
		inc temp

    loop rightboundary

	;--------------------
mov eax,2
	call SetTextColor
	call DrawPlayer

mov eax,15
call SetTextColor
mov dl,0
mov dh,10
call Gotoxy
mov edx, offset playerprompt   ; mov string offset in edx
call writestring
	mov eax,2
	call SetTextColor
mov edx, offset nameStr
call writestring
	
	;------  FOOD
	;-- up
	
mov ecx,75
mov bl, xfood1
mov dl, xfood1
Fooddraw:

	mov dl,bl
	mov dh, yfood1
	call Gotoxy
	mov edx,offset food1
	mov eax,15
	call SetTextColor
	call Writestring
	add bl,1
	
	;dec dh
loop Fooddraw
;--- Down
mov ecx,75
mov bl, xfood1
mov dl, xfood1
Fooddrawdown:

	mov dl,bl
	mov dh, yfood2
	call Gotoxy
	mov edx,offset food1
	mov eax,15
	call SetTextColor
	call Writestring
	add bl,1
	
	;dec dh
loop Fooddrawdown

;---- Mid
mov ecx,25
mov bl, yfood1
mov dl, xfood1
Fooddrawmid:

	mov dl,65
	mov dh, bl
	call Gotoxy
	mov edx,offset food1
	mov eax,15
	call SetTextColor
	call Writestring
	add bl,1
	
	;dec dh
loop Fooddrawmid
;----- leftcorner


mov ecx,25
mov bl, yfood1
mov dl, xfood1
Fooddrawleft:

	mov dl,26
	mov dh, bl
	call Gotoxy
	mov edx,offset food1
	mov eax,15
	call SetTextColor
	call Writestring
	add bl,1
	
	;dec dh
loop Fooddrawleft

;----- right corner

mov ecx,25
mov bl, yfood1
mov dl, xfood3
Fooddrawright:

	mov dl,xfood3
	mov dh, bl
	call Gotoxy
	mov edx,offset food1
	mov eax,15
	call SetTextColor
	call Writestring
	add bl,1
	
	;dec dh
loop Fooddrawright
	;-----  walls-=-----
;     wall1
; verticals left right walls
mov eax,14
	call SetTextColor

mov ecx,9
mov bl, ywall
walldraw:
	mov dh,bl
	mov dl,xwall1
	call Gotoxy
	mov edx,offset wall1
	call writestring

	mov dl, xwall
	mov dh, bl
	call Gotoxy
	mov edx,offset wall1
	
	call Writestring
	dec bl
	;dec dh
loop walldraw


;------------   UP Horizontal
mov ecx,25
mov bl, xwall2
mov bh , ywall2
sub bh,9
wallhorizontal:
	
	mov dl, bl
	mov dh, bh
	call Gotoxy
	mov edx,offset wall2
	call Writestring

	mov dl, bl
	mov dh, ywall2
	call Gotoxy
	mov edx,offset wall2
	
	call Writestring
	inc bl
	;dec dh
loop wallhorizontal

;-----  Wall2
;----  up/down
mov eax,14
	call SetTextColor


mov bx,0
mov ecx,75
mov bl, xwall3
mov bh , ywall3
sub bh,2
wallhorizontal2:
	
	mov dl, bl
	mov dh, bh
	call Gotoxy
	mov edx,offset wall2
	call Writestring

	mov dl, bl
	mov dh, ywall3
	call Gotoxy
	mov edx,offset wall2
	
	call Writestring
	inc bl
	;dec dh
loop wallhorizontal2

;-------left / right

mov ecx,2
mov bl, ywall3
walldraw2:
	mov dh,bl
	mov dl,xwall3r
	call Gotoxy
	mov edx,offset wall1
	call writestring

	mov dl, xwall3
	mov dh, bl
	call Gotoxy
	mov edx,offset wall1
	
	call Writestring
	dec bl
	;dec dh
loop walldraw2
;---------------------- wall 3

;     wall1
; verticals left right walls

mov ecx,9

mov bl, ywall
walldraw2r:
	mov dh,bl
	mov dl,xwall1another
	call Gotoxy
	mov edx,offset wall1
	call writestring

	mov dl, xwallanother
	mov dh, bl
	call Gotoxy
	mov edx,offset wall1
	
	call Writestring
	dec bl
	;dec dh
loop walldraw2r


;------------   UP Horizontal
mov ecx,25
mov bl, xwallanother
inc bl
mov bh , ywall2
sub bh,9
wallhorizontalr:
	
	mov dl, bl
	mov dh, bh
	call Gotoxy
	mov edx,offset wall2
	call Writestring

	mov dl, bl
	mov dh, ywall2
	call Gotoxy
	mov edx,offset wall2
	
	call Writestring
	inc bl
	;dec dh
loop wallhorizontalr


;-------------------------  walls end

;---------  Walls design
;-  horizontal wall 
mov ecx,73
mov bl,31

mov eax,4
call SetTextColor
design:
	mov dh,23
	mov dl,bl
	call Gotoxy
    mov edx, offset walldesign
	call writestring
	inc bl
	loop design
;--- wall content 


mov eax,4
call SetTextColor
	mov dh,9
	mov dl,33
	call Gotoxy
    mov edx, offset wallti1
	; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
mov eax,4
call SetTextColor
	mov dh,10
	mov dl,33
	call Gotoxy
    mov edx, offset wallti2   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
mov eax,10
call SetTextColor
	mov dh,11
	mov dl,33
	call Gotoxy
    mov edx, offset wallti3   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
	mov eax,10
	call SetTextColor
	mov dh,12
	mov dl,33

	call Gotoxy
    mov edx, offset wallti4   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	mov eax,4
	call SetTextColor
	mov dh,13
	mov dl,33

	call Gotoxy
    mov edx, offset wallti5   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	mov eax,4
	call SetTextColor
	mov dh,14
	mov dl,33

	call Gotoxy
    mov edx, offset wallti6   ; mov string offset in edx
    call writestring    ; writestring will print content in edx

;------------------------- wall 2r



mov eax,4
call SetTextColor
	mov dh,9
	mov dl,73
	call Gotoxy
    mov edx, offset wallti1
	; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
mov eax,4
call SetTextColor
	mov dh,10
	mov dl,73
	call Gotoxy
    mov edx, offset wallti2   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
mov eax,10
call SetTextColor
	mov dh,11
	mov dl,73
	call Gotoxy
    mov edx, offset wallti3   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
	mov eax,10
	call SetTextColor
	mov dh,12
	mov dl,73

	call Gotoxy
    mov edx, offset wallti4   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	mov eax,4
	call SetTextColor
	mov dh,13
	mov dl,73

	call Gotoxy
    mov edx, offset wallti5   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	mov eax,4
	call SetTextColor
	mov dh,14
	mov dl,73

	call Gotoxy
    mov edx, offset wallti6   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
ret

maze endp

maze2 PROC
mov eax,14
call SetTextColor


mov bx,0
mov ecx,26
mov bl, xwallc
mov bh , ywallc
sub bh,2
wallhorizontal2:
	
	mov dl, bl
	mov dh, bh
	call Gotoxy
	mov edx,offset wall2
	call Writestring

	mov dl, bl
	mov dh, ywallc
	call Gotoxy
	mov edx,offset wall2
	
	call Writestring
	inc bl
	;dec dh
loop wallhorizontal2

;-------left / right

mov ecx,2
mov bl, ywallc
walldraw2:
	mov dh,bl
	mov dl,xwallc1
	call Gotoxy
	mov edx,offset wall1
	call writestring

	mov dl, xwallc
	mov dh, bl
	call Gotoxy
	mov edx,offset wall1
	
	call Writestring
	dec bl
	;dec dh
loop walldraw2


;----------  wall2 

mov eax,14
call SetTextColor


mov bx,0
mov ecx,26
mov bl, xwallcu
mov bh , ywallcu
sub bh,2
wallhorizontal2u:
	
	mov dl, bl
	mov dh, bh
	call Gotoxy
	mov edx,offset wall2
	call Writestring

	mov dl, bl
	mov dh, ywallcu
	call Gotoxy
	mov edx,offset wall2
	
	call Writestring
	inc bl
	;dec dh
loop wallhorizontal2u

;-------left / right

mov ecx,2
mov bl, ywallcu
walldraw2u:
	mov dh,bl
	mov dl,xwallcu1
	call Gotoxy
	mov edx,offset wall1
	call writestring

	mov dl, xwallcu
	mov dh, bl
	call Gotoxy
	mov edx,offset wall1
	
	call Writestring
	dec bl
	;dec dh
loop walldraw2u



;-------------  Design




;---- design

mov ecx,24
mov bl,55

mov eax,4
call SetTextColor
design2:
	mov dh,19
	mov dl,bl
	call Gotoxy
    mov edx, offset walldesign
	call writestring
	inc bl
	loop design2

	mov ecx,24
mov bl,55

mov eax,4
call SetTextColor
design2u:
	mov dh,4
	mov dl,bl
	call Gotoxy
    mov edx, offset walldesign
	call writestring
	inc bl
	loop design2u
;--- wall content 

ret
maze2 endp

maze3 Proc
mov eax,14
call SetTextColor


mov bx,0
mov ecx,26
mov bl, xwallc
mov bh , ywallc
sub bh,2
wallhorizontal2:
	
	mov dl, bl
	mov dh, bh
	call Gotoxy
	mov edx,offset wall2
	call Writestring

	mov dl, bl
	mov dh, ywallc
	call Gotoxy
	mov edx,offset wall2
	
	call Writestring
	inc bl
	;dec dh
loop wallhorizontal2

;-------left / right

mov ecx,2
mov bl, ywallc
walldraw2:
	mov dh,bl
	mov dl,xwallc1
	call Gotoxy
	mov edx,offset wall1
	call writestring

	mov dl, xwallc
	mov dh, bl
	call Gotoxy
	mov edx,offset wall1
	
	call Writestring
	dec bl
	;dec dh
loop walldraw2


;----------  wall2 

mov eax,14
call SetTextColor


mov bx,0
mov ecx,26
mov bl, xwallcu
mov bh , ywallcu
sub bh,2
wallhorizontal2u:
	
	mov dl, bl
	mov dh, bh
	call Gotoxy
	mov edx,offset wall2
	call Writestring

	mov dl, bl
	mov dh, ywallcu
	call Gotoxy
	mov edx,offset wall2
	
	call Writestring
	inc bl
	;dec dh
loop wallhorizontal2u

;-------left / right

mov ecx,2
mov bl, ywallcu
walldraw2u:
	mov dh,bl
	mov dl,xwallcu1
	call Gotoxy
	mov edx,offset wall1
	call writestring

	mov dl, xwallcu
	mov dh, bl
	call Gotoxy
	mov edx,offset wall1
	
	call Writestring
	dec bl
	;dec dh
loop walldraw2u


;--- level3 addition wall


mov eax,14
call SetTextColor


mov bx,0
mov ecx,15
mov bl, xwallcuu1
mov bh , ywallcuu1
sub bh,2

wallhorizontal2cu:
	
	mov dl, bl
	mov dh, bh
	call Gotoxy
	mov edx,offset wall2
	call Writestring

	mov dl, bl
	mov dh, ywallcu
	call Gotoxy
	mov edx,offset wall2
	
	call Writestring
	inc bl
	;dec dh
loop wallhorizontal2cu

;-------left / right

mov ecx,2
mov bl, ywallcuu1
walldraw2uu:
	mov dh,bl
	mov dl,xwallcuu12
	call Gotoxy
	mov edx,offset wall1
	call writestring

	mov dl, xwallcuu1
	mov dh, bl
	call Gotoxy
	mov edx,offset wall1
	
	call Writestring
	dec bl
	;dec dh
loop walldraw2uu

;-- level3 down leftmost


mov eax,14
call SetTextColor


mov bx,0
mov ecx,15
mov bl, xwallcuu1
mov bh , ywallcuud1
sub bh,2

wallhorizontal2cuu:
	
	mov dl, bl
	mov dh, bh
	call Gotoxy
	mov edx,offset wall2
	call Writestring

	mov dl, bl
	mov dh, ywallcuud1
	call Gotoxy
	mov edx,offset wall2
	
	call Writestring
	inc bl
	;dec dh
loop wallhorizontal2cuu

;-------left / right

mov ecx,2
mov bl, ywallcuud1
walldraw2uuu:
	mov dh,bl
	mov dl,xwallcuu12
	call Gotoxy
	mov edx,offset wall1
	call writestring

	mov dl, xwallcuu1
	mov dh, bl
	call Gotoxy
	mov edx,offset wall1
	
	call Writestring
	dec bl
	;dec dh
loop walldraw2uuu


;---- level3 right up


mov eax,14
call SetTextColor


mov bx,0
mov ecx,15
mov bl, xwallcuul1
mov bh , ywallcuu1
sub bh,2

wallhorizontal2cul:
	
	mov dl, bl
	mov dh, bh
	call Gotoxy
	mov edx,offset wall2
	call Writestring

	mov dl, bl
	mov dh, ywallcuu1
	call Gotoxy
	mov edx,offset wall2
	
	call Writestring
	inc bl
	;dec dh
loop wallhorizontal2cul

;-------left / right

mov ecx,2
mov bl, ywallcuu1
walldraw2uul:
	mov dh,bl
	mov dl,xwallcuu1l2
	call Gotoxy
	mov edx,offset wall1
	call writestring

	mov dl, xwallcuul1
	mov dh, bl
	call Gotoxy
	mov edx,offset wall1
	
	call Writestring
	dec bl
	;dec dh
loop walldraw2uul


;-------------  Design




;---- design

mov ecx,24
mov bl,55

mov eax,4
call SetTextColor
design2:
	mov dh,19
	mov dl,bl
	call Gotoxy
    mov edx, offset walldesign
	call writestring
	inc bl
	loop design2

	mov ecx,24
mov bl,55

mov eax,4
call SetTextColor
design2u:
	mov dh,4
	mov dl,bl
	call Gotoxy
    mov edx, offset walldesign
	call writestring
	inc bl
	loop design2u
;--- wall content 

ret

maze3 endp



gameover PROC

mov eax,8
call SetTextColor
	mov dh,9
	mov dl,40
	call Gotoxy
    mov edx, offset over1
	; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
mov eax,2
call SetTextColor
	mov dh,10
	mov dl,40
	call Gotoxy
    mov edx, offset over2   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
mov eax,9
call SetTextColor
	mov dh,11
	mov dl,40
	call Gotoxy
    mov edx, offset over3   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
	mov eax,8
	call SetTextColor
	mov dh,12
	mov dl,40

	call Gotoxy
    mov edx, offset over4   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	mov eax,8
	call SetTextColor
	mov dh,13
	mov dl,73

	mov dh,14
	mov dl,40

	call Gotoxy
    mov edx, offset endscreen   ; mov string offset in edx
    call writestring
	mov edx,offset  nameStr
	call writestring

	mov dh,15
	mov dl,40

	call Gotoxy
    mov edx, offset strScore
	call writestring
	mov al, score
	call writedec
			         ret                    
gameover endp

won PROC

mov eax,8
call SetTextColor
	mov dh,9
	mov dl,40
	call Gotoxy
    mov edx, offset won1
	; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
mov eax,2
call SetTextColor
	mov dh,10
	mov dl,40
	call Gotoxy
    mov edx, offset won2   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
mov eax,9
call SetTextColor
	mov dh,11
	mov dl,40
	call Gotoxy  
    mov edx, offset won3   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	
	mov eax,8
	call SetTextColor
	mov dh,12
	mov dl,40

	call Gotoxy
    mov edx, offset won4   ; mov string offset in edx
    call writestring    ; writestring will print content in edx
	mov eax,8
	call SetTextColor
	mov dh,13
	mov dl,73

	mov dh,14
	mov dl,40

	call Gotoxy
    mov edx, offset endscreen   ; mov string offset in edx
    call writestring
	mov edx,offset  nameStr
	call writestring

	mov dh,15
	mov dl,40

	call Gotoxy
    mov edx, offset strScore
	call writestring
	mov al, score
	call writedec
	ret
won endp
end main


 