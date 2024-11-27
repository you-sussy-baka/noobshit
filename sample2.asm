.model small
.stack 100
.data
	;ASK WHETHER ADMIN OR USER /
	;--------------------------------------------------------------
	ASKADMIN db 10,13,"Are you an ADMIN or a CUSTOMER (A/C) : $"
	A_or_C db ?
	INVALID1 db 10,13,"ENTER A or C ONLY!$"
	;--------------------------------------------------------------

	;LOGIN MENU FOR ADMIN /
	;-------------------------------------
	login db 10,13,"Enter your ID: $"
	valid db 10,13,"Login Success!$"
	invalid db 10,13,"Invalid ID!$"
	loginID db 5 dup(?)
	;-------------------------------------
	
	;ASKING IF CUSTOMER HAS MEMBER OR NOT /
	;--------------------------------------------------------------
	ASKCUSTOMER DB 10,13,"A MEMBER OR NOT (Y/N) : $"
	Y_or_N DB ? 
	INVALID2 db 10,13,"ENTER Y or N ONLY!$"
	;--------------------------------------------------------------

	;IF HAVE MEMBER /
	;--------------------------------------------------------------
	HEMBER1 DB 10,13, "RENEW (R) OR CANCEL (C) : $"
	HEMBER2 DB ?
	INVALID3 DB 10,13,"ENTER R or C ONLY!$"
	;--------------------------------------------------------------
	askname db 13,10,"Please enter your name: $"
	askphonenumber db 13,10,"Please enter your phone number: $"

	username label byte
	max db 20
	act db ?
	data1 db 20 dup('$')

	phonenumber label byte
	max1 db 20
	act1 db ?
	data2 db 20 dup('$')

	;IF RENEW (DATA)
	;--------------------------------------------------------------
	P_renewB dw 120
	P_renewP dw 163
	P_renewS dw 100
	renewtotalB dw 0
	renewtotalP dw 0
	renewtotalS dw 0
	;--------------------------------------------------------------
	;MEMBERSHIP TYPE DISPLAY FOR RENEW
	;--------------------------------------------------------------
	RMEMBER1 DB 10,13,"_________________________________________________$"
	RMEMBER2 DB 10,13,"| MEMBERSHIP TYPE	|	PRICE (RM)	|$"
	RMEMBER3 DB 10,13,"|_______________________|_______________________|$"
	RMEMBER4 DB 10,13,"| BASIC			|	120		|$"
	RMEMBER5 DB 10,13,"| PREMIUM		|	163		|$"
	RMEMBER6 DB 10,13,"| STUDENT		|	100		|$"
	RMEMBER7 DB 10,13,"|_______________________|_______________________|$"
	;--------------------------------------------------------------
	RSK_TYPE DB 10,13,"WHICH MEMBERSHIP WOULD YOU LIKE TO RENEW?$"
	RSK_TYPE2 DB 10,13,"CHOOSE BETWEEN (B or P or S) : $"
	RSK_TYPE3 DB ?

	;IF NOT MEMBER /
	;--------------------------------------------------------------
	ASK_REGISTER DB 10,13,"REGISTER FOR MEMBER (Y/N) ? : $"
	REGISTER1 DB ?
	;--------------------------------------------------------------
	
	;MEMBERSHIP TYPE DISPLAY /
	;-------------------------------------------------------------
	MEMBER1 DB 10,13,"_________________________________________________$"
	MEMBER2 DB 10,13,"| MEMBERSHIP TYPE	|	PRICE (RM)	|$"
	MEMBER3 DB 10,13,"|_______________________|_______________________|$"
	MEMBER4 DB 10,13,"| BASIC			|	180		|$"
	MEMBER5 DB 10,13,"| PREMIUM		|	245		|$"
	MEMBER6 DB 10,13,"| STUDENT		|	150		|$"
	MEMBER7 DB 10,13,"|_______________________|_______________________|$"
	;--------------------------------------------------------------
	ASK_TYPE DB 10,13,"WHICH MEMBERSHIP WOULD YOU LIKE TO REGISTER?$"
	ASK_TYPE2 DB 10,13,"CHOOSE BETWEEN (B or P or S) : $"
	ASK_TYPE3 DB ?
	INVALID4 DB 10,13,"ENTER B / P / S ONLY!$"

	;IF REGISTERATION (DATA)
	;--------------------------------------------------------------
	P_registerB dw 180
	P_registerP dw 245
	P_registerS dw 150
	registertotalB dw 0
	registertotalP dw 0
	registertotalS dw 0
	;--------------------------------------------------------------
	
	PRICE DB ?

	;OTHER DATA NEEDED FOR REGISTERATION (MONTH)
	;--------------------------------------------------------------
	ASKMONTH DB 10,13,"INSERT THE MONTH THAT YOU DESIRE (1-12): $"
	ANSMONTH DB ?
	MONTH1 DB ?
	INVALID_MONTH DB 10,13,"INVALID MONTH PLEASE ENTER THE NUMBER BETWEEN 1 TO 12!$"
	;--------------------------------------------------------------

	;IF RETURN(DATA)
	;--------------------------------------------------------------
	P_returnB dw 90
	P_returnP dw 123
	P_returnS dw 75
	returntotalB dw 0
	returntotalP dw 0
	returntotalS dw 0

	;MEMBERSHIP TYPE DISPLAY FOR RETURN
	;-------------------------------------------------------------
	CANCEL1 DB 10,13,"_________________________________________________$"
	CANCEL2 DB 10,13,"| MEMBERSHIP TYPE	|RETURN PRICE (RM)	|$"
	CANCEL3 DB 10,13,"|_______________________|_______________________|$"
	CANCEL4 DB 10,13,"| BASIC			|	 90		|$"
	CANCEL5 DB 10,13,"| PREMIUM		|	123		|$"
	CANCEL6 DB 10,13,"| STUDENT		|	 75		|$"
	CANCEL7 DB 10,13,"|_______________________|_______________________|$"
	;--------------------------------------------------------------
	ASK_RETURN_TYPE DB 13,10,"WHICH MEMBERSHIP DID YOU BUY BEFORE?$"
	ASK_RETURN_TYPE2 DB 13,10,"CHOOSE BETWEEN (B or P or S) : $"
	ASK_RETURN_TYPE3 DB ?
	ASK_REGISTER_MONTH DB 13,10,"HOW MANY MONTHS DID YOU BUY YOUR MEMBERSHIP (1-12): $"
	ASK_REGISTER_MONTH2 DB ?
	ASK_MONTH DB 13,10,"HOW MANY MONTHS HAVE YOU USED THIS MEMBER (1-12): $"
	ANS_USED_MONTH DB ?
	INVALID_EXCEED DB 13,10,"THE MONTH YOU REGISTER IS LESS THAN YOU USED THIS MEMBER$"
	RETURN_MONTH DB ?
	RETURN_PRICE DB ?
	ASK_CONFIRMRETURN DB 13,10,"ARE YOU CONFIRM YOU WANT TO CANCEL (Y/N) ? $"
	ASK_CONFIRMRETURN2 DB ?
	return db 13,10,"RETURN",13,10,"Membership		month		Price$"

	;INVOICE
	;--------------------------------------------------------------
	invoice db 13,10,"Invoice",13,10,"Membership		month		Price$"
	result1 db 13,10,"Basic			 $"
	result2 db 13,10,"Premium			 $"
	result3 db 13,10,"Student			 $"
	space1 db "		$"
	resdigit1 db 0
	resdigit2 db 0
	resdigit3 db 0
	resdigit4 db 0
	rmprice db "RM$"
	;--------------------------------------------------------------

	PAYMENTMSG DB 10,13,"PLEASE PAY AT THE COUNTER.THANK YOU!$"
	ENDINGMSG DB 10,13,"THANK YOU FOR USING OUR SYSTEM$"
	CANCELMSG DB 10,13,"IT WAS GREAT HAVING YOU IN OUR FAMILY!!$"
	CANCELMSG2 DB 10,13,"HOPE TO SEE YOU AGAIN$"
	INVALID_OPERATION DB 13,10,"INVALID ENTER Y OR N ONLY$"
	NEXT_OPERATION DB 13,10,"NEXT OPERATION OR NOT(Y/N)?: $"
	NEXT_OPERATION2 DB ?

	;REPORT
	;--------------------------------------------------------------
	REPORT1 DB 10,13,"__________________________________________________$"
	REPORT2 DB 10,13,"| MEMBERSHIP TYPE    	|	PRICE (RM)	 |$"
	REPORT3 DB 10,13,"|_______________________|________________________|$"
	REPORT4 DB 10,13,"| REGISTER BASIC	|	$"
	REPORT5 DB 10,13,"| REGISTER PREMIUM	|	$"
	REPORT6 DB 10,13,"| REGISTER STUDENT	|	$"
	REPORT7 DB 10,13,"|_______________________|________________________|$" 
	REPORT8 DB 10,13,"| TOTAL REGISTER	|       $"
	REPORT9 DB 10,13,"|_______________________|________________________|$"
	REPORT10 DB 10,13,"| RENEW BASIC		|	$"
	REPORT11 DB 10,13,"| RENEW PREMIUM		|	$"
	REPORT12 DB 10,13,"| RENEW STUDENT		|	$"
	REPORT13 DB 10,13,"|_______________________|________________________|$" 
	REPORT14 DB 10,13,"| TOTAL RENEW		|	$"
	REPORT15 DB 10,13,"|_______________________|________________________|$"
	REPORT16 DB 10,13,"| CANCELED BASIC	|	$"
	REPORT17 DB 10,13,"| CANCELED PREMIUM	|	$"
	REPORT18 DB 10,13,"| CANCELED STUDENT	|	$"
	REPORT19 DB 10,13,"|_______________________|________________________|$" 
	REPORT20 DB 10,13,"| TOTAL CANCELED	|       $"
	REPORT21 DB 10,13,"|_______________________|________________________|$"
	REPORT24 DB 10,13,"|=======================|========================|$"
	REPORT22 DB 10,13,"| TOTAL BENEFIT		|       $"
	REPORT23 DB 10,13,"|_______________________|________________________|$"

	REPORT0 DB "		 |$"
	;REPORT(DATA)
	;--------------------------------------------------------------
	TOTALREGISTER DW 0
	TOTALRENEW DW 0
	TOTALCANCEL DW 0
	TOTALBENEFIT DW 0


.code
	MAIN	PROC	FAR
	MOV AX , @DATA
	MOV DS , AX

START_OF_CODE:

	MOV AH , 09H
	LEA DX , ASKADMIN
	INT 21H

	MOV CX , 3			;CHANGE CX -> 3, LOOP 3 TIMES to check userid
	MOV BX , 0			;CHANGE BX -> 0

	MOV AH , 01H
	INT 21H
	MOV A_or_C , AL

	CMP A_or_C , 'A'
	JE ASK_ID
	
	CMP A_or_C , 'C'
	JE ASK_MEMBERSHIP1

	MOV AH , 09H
	LEA DX , INVALID1
	INT 21H
	JMP START_OF_CODE

ASK_ID:	

	MOV	AH , 09H			; ASK USER ENTER USER ID
	LEA	DX , login
	INT	21H

	MOV	CX , 3			;CHANGE CX -> 3, LOOP 3 TIMES to check userid
	MOV	BX , 0			;CHANGE BX -> 0

ACCEPT_ID:	

	MOV	AH , 07H		;READ USER INPUT WITHOUT DELETING IT
	INT	21H
	MOV	loginID[BX],AL		;[BX] MEANS VALUE STORE IN BX AND LOGIN ID

	MOV	AH , 02H		; DISPLAY '*'	AFTER ENTER A CHARACTER
	MOV	DL , '*'
	INT	21H

	INC	BX 			;INCREASE BX TO INCREASE THE INDEX
	LOOP	ACCEPT_ID		;LOOP ACCEPT_ID TO ENTER OTHER CHARACTER
	 
	MOV	BX , 0		
	
CHECK_ID:

	;SET USING gym FOR EASY ACCESS
	;FOR MANAGER

	CMP loginID[BX] , 'g'
	JNE INVALID_MSG
	INC BX

	CMP loginID[BX] , 'y'
	JNE INVALID_MSG
	INC BX

	CMP loginID[BX] , 'm'
	JNE INVALID_MSG
	INC BX
	JMP VALID_MSG

INVALID_MSG:

	MOV AH , 09H
	LEA DX , invalid
	INT 21H
	JMP ASK_ID

VALID_MSG:

	MOV AH , 09H
	LEA DX , valid
	INT 21H
	JMP ADMIN_COLUMN

ASK_MEMBERSHIP1:
	jmp ASK_MEMBERSHIP

ADMIN_COLUMN:
	MOV AH , 09H
	LEA DX , REPORT1
	INT 21H
	LEA DX , REPORT2
	INT 21H
	LEA DX , REPORT3
	INT 21H
	LEA DX , REPORT4
	INT 21H
	;REGISTER BASIC
	mov ax,registertotalB
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	mov ah,09h
	LEA DX , REPORT0
	INT 21H
	LEA DX , REPORT5
	INT 21H
	;REGISTER PREMIUM
	mov ax,registertotalP
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	MOV AH,09H
	LEA DX, REPORT0
	INT 21H
	LEA DX , REPORT6
	INT 21H
	;REGISTER STUDENT
	mov ax,registertotalS
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	MOV AH,09H
	LEA DX, REPORT0
	INT 21H
	LEA DX , REPORT7
	INT 21H
	LEA DX , REPORT8
	INT 21H
	;TOTAL REGISTER
	mov ax,0
	add ax,registertotalB 
	add ax,registertotalP 
	add ax,registertotalS
	mov TOTALREGISTER,ax 
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	MOV AH,09H
	LEA DX,REPORT0
	INT 21H
	LEA DX , REPORT9
	INT 21H
	LEA DX , REPORT10
	INT 21H
	;RENEW BASIC
	mov ax,renewtotalB
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	MOV AH,09H
	LEA DX,REPORT0
	INT 21H
	LEA DX , REPORT11
	INT 21H
	;RENEW PREMIUM
	mov ax,renewtotalP
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	MOV AH,09H
	LEA DX,REPORT0
	INT 21H
	LEA DX , REPORT12
	INT 21H
	;RENEW STUDENT
	mov ax,renewtotalS
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	MOV AH,09H
	LEA DX,REPORT0
	INT 21H
	LEA DX , REPORT13
	INT 21H
	LEA DX , REPORT14
	INT 21H
	;TOTAL RENEW
	mov ax,0
	add ax,renewtotalB 
	add ax,renewtotalP 
	add ax,renewtotalS
	mov TOTALRENEW,ax 
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	MOV AH,09H
	LEA DX,REPORT0
	INT 21H
	LEA DX , REPORT15
	INT 21H
	LEA DX , REPORT16
	INT 21H
	;CANCELLED BASIC
	mov ax,returntotalB
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	MOV AH,09H
	LEA DX,REPORT0
	INT 21H
	LEA DX , REPORT17
	INT 21H
;CANCELLED PREMIUM
	mov ax,returntotalP
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	MOV AH,09H
	LEA DX,REPORT0
	INT 21H
	LEA DX , REPORT18
	INT 21H
;CANCELLED STUDENT
	mov ax,returntotalS
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	MOV AH,09H
	LEA DX,REPORT0
	INT 21H
	LEA DX , REPORT19
	INT 21H
	LEA DX , REPORT20
	INT 21H
;TOTAL RETURN
	mov ax,0
	add ax,returntotalB 
	add ax,returntotalP 
	add ax,returntotalS
	mov TOTALCANCEL,ax 
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	MOV AH,09H
	LEA DX,REPORT0
	INT 21H
	LEA DX , REPORT21
	INT 21H
	LEA DX,REPORT24
	INT 21H
	LEA DX , REPORT22
	INT 21H
;TOTAL BENEFIT
	mov ax,0
	add ax,	TOTALREGISTER 
	add ax, TOTALRENEW
	cmp TOTALCANCEL,ax
	JG less
	sub ax, TOTALCANCEL
	mov TOTALBENEFIT,ax 
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	MOV AH,09H
	LEA DX,REPORT0
	INT 21H
	LEA DX , REPORT23
	INT 21H
	JMP ENDING1

less:
	mov ax,0
	add ax,	TOTALREGISTER 
	add ax, TOTALRENEW
	mov bx, TOTALCANCEL
	sub bx,ax
	mov TOTALBENEFIT,bx 
	mov ax,bx
	mov bx,0
	mov dx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	mov ah,02h
	mov dl,'-'
	int 21h
	mov dl,resdigit1
	int 21h
	mov dl,resdigit2
	int 21h
	mov dl,resdigit3
	int 21h
	mov dl,resdigit4
	int 21h
	MOV AH,09H
	LEA DX,REPORT0
	INT 21H
	LEA DX , REPORT23
	INT 21H
	JMP ENDING1

ASK_MEMBERSHIP:

	MOV AH , 09H
	LEA DX , ASKCUSTOMER
	INT 21H
	
	MOV AH , 01H
	INT 21H
	MOV Y_or_N , AL

	CMP Y_or_N , 'Y'
	JE IS_MEMBER
	CMP Y_or_N , 'N'
	JE NOT_MEMBER1

	MOV AH , 09H
	LEA DX , INVALID2
	INT 21H
	JMP ASK_MEMBERSHIP
	
IS_MEMBER:

	MOV AH , 09H
	LEA DX , HEMBER1
	INT 21H

	MOV AH , 01H
	INT 21H
	MOV HEMBER2 , AL
	
	CMP HEMBER2, 'R'
	JE RENEW_SELECTION
	
	CMP HEMBER2 , 'C'
	JE CANCELATION1
	
	MOV AH , 09H
	LEA DX , INVALID3
	INT 21H
	JMP IS_MEMBER

RENEW_SELECTION:

	;DISPLAY THE TABLE OF MEMBERSHIP TYPE AND PRICE
	;-----------------------------------------------
	MOV AH , 09H
	LEA DX ,RMEMBER1
	INT 21H
	LEA DX ,RMEMBER2
	INT 21H
	LEA DX ,RMEMBER3
	INT 21H
	LEA DX ,RMEMBER4
	INT 21H
	LEA DX ,RMEMBER5
	INT 21H
	LEA DX ,RMEMBER6
	INT 21H
	LEA DX ,RMEMBER7
	INT 21H
	JMP NAME_REGISTER

NOT_MEMBER1:
	JMP NOT_MEMBER

NAME_REGISTER:	
	;registration name
	mov ah,09h
	lea dx,askname
	int 21h
	
	;name
	mov ah,0ah
	lea dx,username
	int 21h

	;registration phone number
	mov ah,09h
	lea dx,askphonenumber
	int 21h

	;phone number
	mov ah,0ah
	lea dx,phonenumber
	int 21h
	JMP ASK_MEMBERSHIP_TYPE_RENEW

ASK_MEMBERSHIP_TYPE_RENEW:
	MOV AH , 09H
	LEA DX , RSK_TYPE
	INT 21H
	
	MOV AH , 09H
	LEA DX , RSK_TYPE2
	INT 21H
	
	MOV AH , 01H
	INT 21H
	MOV RSK_TYPE3 , AL
	JMP ASK_MONTH2

CANCELATION1:
	JMP CANCELATION2

ASK_MONTH2:
	MOV AH , 09H
	LEA DX , ASKMONTH
	INT 21H
	
	;STORE FIRST DIGIT 
	MOV AH , 01H
	INT 21H
	SUB AL , 30H
	MOV ANSMONTH , AL

	;STORE SECOND DIGIT
	MOV AH , 01H
	INT 21H
	CMP AL , 0DH
	JE MONTH_CHECKING2
	CMP AL,'0'
	JNE CHECKING2i
	JMP CHECKING2

CHECKING2i:
	CMP AL,'1'
	JNE CHECKING2ii
	JMP CHECKING2

CHECKING2ii:
	CMP AL, '2'
	JNE INVALID_MONTHS2
	JMP CHECKING2

CHECKING2:
	SUB AL , 30H
	MOV MONTH1 , AL

	MOV AL , ANSMONTH
	MOV CL , 10
	MUL CL
	ADD AL , MONTH1
	MOV ANSMONTH , AL
	JMP MONTH_CHECKING2

MONTH_CHECKING2:
	CMP ANSMONTH , 1
	JL INVALID_MONTHS2
	CMP ANSMONTH , 12
	JG INVALID_MONTHS2

	JMP COMPARE_TYPE2

INVALID_MONTHS2:
	MOV AH , 09H
	LEA DX , INVALID_MONTH
	INT 21H
	JMP ASK_MONTH2

COMPARE_TYPE2:
	CMP RSK_TYPE3 , 'B'
	JE RENEW_BASIC

	CMP RSK_TYPE3 , 'P'
	JE RENEW_PREMIUM1
	
	CMP RSK_TYPE3 , 'S'
	JE RENEW_STUDENT1

	MOV AH , 09H
	LEA DX , INVALID4
	INT 21H
	JMP RENEW_SELECTION

RENEW_PREMIUM1:
	JMP RENEW_PREMIUM2

RENEW_STUDENT1:
	JMP RENEW_STUDENT2

CANCELATION2:
	JMP CANCELATION3

RENEW_BASIC:
	;print result
	mov ah,09h
	lea dx,invoice
	int 21h
	lea dx,result1
	int 21h
	
	;print month
	mov ax,0
	mov al,ansmonth
	mov bl,10
	div bl
	mov bl,al
	mov bh,ah
	mov ah,02h
	add bl,30h
	mov dl,bl
	int 21h
	mov ah,02h
	add bh,30h
	mov dl,bh
	int 21h

	mov ax,0
	mov bx,0
	mov ah,09h
	lea dx,space1
	int 21h

	mov ah,09h
	lea dx,rmprice
	int 21h

	;total
	mov ax,P_renewB
	mov bl,ansmonth
	mul bx
	add renewtotalB,ax

	;print total
	mov bx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	
	mov ah,02h
	mov dl,resdigit1
	int 21h
	
	mov ah,02h
	mov dl,resdigit2
	int 21h

	mov ah,02h
	mov dl,resdigit3
	int 21h

	mov ah,02h
	mov dl,resdigit4
	int 21h
	jmp renewpayment

RENEW_PREMIUM2:
	JMP RENEW_PREMIUM

RENEW_STUDENT2:
	JMP RENEW_STUDENT3

CANCELATION3:
	JMP CANCELATION4

RENEW_PREMIUM:
	;print result
	mov ah,09h
	lea dx,invoice
	int 21h
	mov ah,09h
	lea dx,result2
	int 21h
	
	;print month
	mov ax,0
	mov al,ansmonth
	mov bl,10
	div bl
	mov bl,al
	mov bh,ah
	mov ah,02h
	add bl,30h
	mov dl,bl
	int 21h
	mov ah,02h
	add bh,30h
	mov dl,bh
	int 21h

	mov ax,0
	mov bx,0
	mov ah,09h
	lea dx,space1
	int 21h

	mov ah,09h
	lea dx,rmprice
	int 21h

	;total
	mov ax,P_renewP
	mov bl,ansmonth
	mul bx
	add renewtotalP,ax

	;print total
	mov bx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	
	mov ah,02h
	mov dl,resdigit1
	int 21h
	
	mov ah,02h
	mov dl,resdigit2
	int 21h

	mov ah,02h
	mov dl,resdigit3
	int 21h

	mov ah,02h
	mov dl,resdigit4
	int 21h
	JMP renewpayment

CANCELATION4:
	JMP CANCELATION5

RENEW_STUDENT3:
	JMP RENEW_STUDENT

RENEW_STUDENT:
	;print result
	mov ah,09h
	lea dx,invoice
	int 21h
	mov ah,09h
	lea dx,result3
	int 21h
	
	;print month
	mov ax,0
	mov al,ansmonth
	mov bl,10
	div bl
	mov bl,al
	mov bh,ah
	mov ah,02h
	add bl,30h
	mov dl,bl
	int 21h
	mov ah,02h
	add bh,30h
	mov dl,bh
	int 21h

	mov ax,0
	mov bx,0
	mov ah,09h
	lea dx,space1
	int 21h

	mov ah,09h
	lea dx,rmprice
	int 21h

	;total
	mov ax,P_renewS
	mov bl,ansmonth
	mul bx
	add renewtotalS,ax

	;print total
	mov bx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	
	mov ah,02h
	mov dl,resdigit1
	int 21h
	
	mov ah,02h
	mov dl,resdigit2
	int 21h

	mov ah,02h
	mov dl,resdigit3
	int 21h

	mov ah,02h
	mov dl,resdigit4
	int 21h
	JMP renewpayment

CANCELATION5:
	JMP CANCELATION

renewpayment:
	MOV AH , 09H
	LEA DX , PAYMENTMSG
	INT 21H
	JMP ENDING

START_OF_CODE4:
	JMP START_OF_CODE

CANCELATION:
	;DISPLAY THE TABLE OF MEMBERSHIP TYPE AND RETURN PRICE
	;-----------------------------------------------
	MOV AH , 09H
	LEA DX ,CANCEL1
	INT 21H
	LEA DX ,CANCEL2
	INT 21H
	LEA DX ,CANCEL3
	INT 21H
	LEA DX ,CANCEL4
	INT 21H
	LEA DX ,CANCEL5
	INT 21H
	LEA DX ,CANCEL6
	INT 21H
	LEA DX ,CANCEL7
	INT 21H
	JMP NAME_CANCEL

NAME_CANCEL:
	;name
	mov ah,09h
	lea dx,askname
	int 21h
	
	;name
	mov ah,0ah
	lea dx,username
	int 21h

	;phone number
	mov ah,09h
	lea dx,askphonenumber
	int 21h

	;phone number
	mov ah,0ah
	lea dx,phonenumber
	int 21h
	JMP ASK_MEMBERSHIP_TYPE_CANCEL

ASK_MEMBERSHIP_TYPE_CANCEL:
	MOV AH , 09H
	LEA DX , ASK_RETURN_TYPE
	INT 21H
	
	MOV AH , 09H
	LEA DX , ASK_RETURN_TYPE2
	INT 21H
	
	MOV AH , 01H
	INT 21H
	MOV ASK_RETURN_TYPE3 , AL
	JMP ASK_MONTH3

ASK_MONTH3:
	MOV AH , 09H
	LEA DX , ASK_REGISTER_MONTH
	INT 21H
	
	;STORE FIRST DIGIT 
	MOV AH , 01H
	INT 21H
	SUB AL , 30H
	MOV ASK_REGISTER_MONTH2 , AL

	;STORE SECOND DIGIT
	MOV AH , 01H
	INT 21H
	CMP AL , 0DH
	JE MONTH_CHECKING3
	CMP AL,'0'
	JNE CHECKING3i
	JMP CHECKING3

CHECKING3i:
	CMP AL,'1'
	JNE CHECKING3ii
	JMP CHECKING3

CHECKING3ii:
	CMP AL, '2'
	JNE INVALID_MONTHS4
	JMP CHECKING3

CHECKING3:
	SUB AL , 30H
	MOV MONTH1 , AL

	MOV AL , ASK_REGISTER_MONTH2
	MOV CL , 10
	MUL CL
	ADD AL , MONTH1
	MOV ASK_REGISTER_MONTH2 , AL
	JMP MONTH_CHECKING3

MONTH_CHECKING3:
	CMP ASK_REGISTER_MONTH2 , 1
	JL INVALID_MONTHS4
	CMP ASK_REGISTER_MONTH2 , 12
	JG INVALID_MONTHS4

	JMP ASK_MONTH4

INVALID_MONTHS4:
	MOV AH , 09H
	LEA DX , INVALID_MONTH
	INT 21H
	JMP ASK_MONTH3
;-------------------------------------------------------------
ASK_MONTH4:
	MOV AH , 09H
	LEA DX , ASK_MONTH
	INT 21H

	;STORE FIRST DIGIT 
	MOV AH , 01H
	INT 21H
	SUB AL , 30H
	MOV ANS_USED_MONTH , AL

	;STORE SECOND DIGIT
	MOV AH , 01H
	INT 21H
	CMP AL , 0DH
	JE MONTH_CHECKING4
	CMP AL,'0'
	JNE CHECKING4i
	JMP CHECKING4

CHECKING4i:
	CMP AL,'1'
	JNE CHECKING4ii
	JMP CHECKING4

CHECKING4ii:
	CMP AL, '2'
	JNE INVALID_MONTHS5
	JMP CHECKING4

CHECKING4:
	SUB AL , 30H
	MOV MONTH1 , AL

	MOV AL , ANS_USED_MONTH
	MOV CL , 10
	MUL CL
	ADD AL , MONTH1
	MOV ANS_USED_MONTH , AL
	JMP MONTH_CHECKING4

MONTH_CHECKING4:
	CMP ANS_USED_MONTH , 1
	JL INVALID_MONTHS5
	CMP ANS_USED_MONTH , 12
	JG INVALID_MONTHS5

	JMP MONTH_CHECKING5

MONTH_CHECKING5:
	MOV AL , ANS_USED_MONTH
	CMP ASK_REGISTER_MONTH2 , AL
	JLE INVALID_MONTH6
	JMP CALCULATION_MONTH_PRICE

INVALID_MONTH6:
	MOV AH , 09H
	LEA DX , INVALID_EXCEED
	INT 21H
	JMP ASK_MONTH4

INVALID_MONTHS5:
	MOV AH , 09H
	LEA DX , INVALID_MONTH
	INT 21H
	JMP ASK_MONTH4

CALCULATION_MONTH_PRICE:
	MOV AL , ASK_REGISTER_MONTH2
	SUB AL , ANS_USED_MONTH  
	MOV RETURN_MONTH , AL
	jmp COMPARE_CANCEL_TYPE

COMPARE_CANCEL_TYPE:

	CMP ASK_RETURN_TYPE3 , 'B'
	JE CANCEL_BASIC

	CMP ASK_RETURN_TYPE3 , 'P'
	JE CANCEL_PREMIUM1
	
	CMP ASK_RETURN_TYPE3 , 'S'
	JE CANCEL_STUDENT1

	MOV AH , 09H
	LEA DX , INVALID4
	INT 21H
	JMP CANCELATION

CANCEL_PREMIUM1:
	jmp CANCEL_PREMIUM
CANCEL_STUDENT1:
	jmp CANCEL_STUDENT

CANCEL_BASIC:

	;PRINT RESULT
	mov ah,09h
	lea dx,return
	int 21h
	mov ah,09h
	lea dx,result1
	int 21h
	
	;print month
	mov ax,0
	mov al,RETURN_MONTH
	mov bl,10
	div bl
	mov bl,al
	mov bh,ah
	mov ah,02h
	add bl,30h
	mov dl,bl
	int 21h
	mov ah,02h
	add bh,30h
	mov dl,bh
	int 21h

	mov ax,0
	mov bx,0
	mov ah,09h
	lea dx,space1
	int 21h

	mov ah,09h
	lea dx,rmprice
	int 21h

	;total
	mov ax,P_returnB
	mov bl,RETURN_MONTH
	mul bx
	add returntotalB,ax

	;print total
	mov bx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	
	mov ah,02h
	mov dl,resdigit1
	int 21h
	
	mov ah,02h
	mov dl,resdigit2
	int 21h

	mov ah,02h
	mov dl,resdigit3
	int 21h	

	mov ah,02h
	mov dl,resdigit4
	int 21h	
	jmp success_cancel

CANCEL_PREMIUM:

	;PRINT RESULT
	mov ah,09h
	lea dx,return
	int 21h
	mov ah,09h
	lea dx,result2
	int 21h
	
	;print month
	mov ax,0
	mov al,RETURN_MONTH
	mov bl,10
	div bl
	mov bl,al
	mov bh,ah
	mov ah,02h
	add bl,30h
	mov dl,bl
	int 21h
	mov ah,02h
	add bh,30h
	mov dl,bh
	int 21h

	mov ax,0
	mov bx,0
	mov ah,09h
	lea dx,space1
	int 21h

	mov ah,09h
	lea dx,rmprice
	int 21h

	;total
	mov ax,P_returnP
	mov bl,RETURN_MONTH
	mul bx
	add returntotalP,ax

	;print total
	mov bx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	
	mov ah,02h
	mov dl,resdigit1
	int 21h
	
	mov ah,02h
	mov dl,resdigit2
	int 21h

	mov ah,02h
	mov dl,resdigit3
	int 21h	

	mov ah,02h
	mov dl,resdigit4
	int 21h	
	jmp success_cancel

START_OF_CODE3:
	JMP START_OF_CODE4

CANCEL_STUDENT:

	;PRINT RESULT
	mov ah,09h
	lea dx,return
	int 21h
	mov ah,09h
	lea dx,result3
	int 21h
	
	;print month
	mov ax,0
	mov al,RETURN_MONTH
	mov bl,10
	div bl
	mov bl,al
	mov bh,ah
	mov ah,02h
	add bl,30h
	mov dl,bl
	int 21h
	mov ah,02h
	add bh,30h
	mov dl,bh
	int 21h

	mov ax,0
	mov bx,0
	mov ah,09h
	lea dx,space1
	int 21h

	mov ah,09h
	lea dx,rmprice
	int 21h

	;total
	mov ax,P_returnS
	mov bl,RETURN_MONTH
	mul bx
	add returntotalS,ax

	;print total
	mov bx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	
	mov ah,02h
	mov dl,resdigit1
	int 21h
	
	mov ah,02h
	mov dl,resdigit2
	int 21h

	mov ah,02h
	mov dl,resdigit3
	int 21h	

	mov ah,02h
	mov dl,resdigit4
	int 21h	
	jmp success_cancel

success_cancel:
	MOV AH , 09H
	LEA DX , CANCELMSG
	INT 21H
	LEA DX , CANCELMSG2
	INT 21H
	JMP ENDING

NOT_MEMBER:

	MOV AH , 09H
	LEA DX , ASK_REGISTER
	INT 21H
	
	MOV AH , 01H
	INT 21H
	MOV REGISTER1 , AL
	
	CMP REGISTER1 , 'Y'
	JE REGISTERATION

	CMP REGISTER1 , 'N'
	JE ENDING1

	MOV AH , 09H
	LEA DX , INVALID2
	INT 21H
	jmp NOT_MEMBER

REGISTERATION:

	;DISPLAY THE TABLE OF MEMBERSHIP TYPE AND PRICE
	;-----------------------------------------------
	MOV AH , 09H
	LEA DX , MEMBER1
	INT 21H
	LEA DX , MEMBER2
	INT 21H
	LEA DX , MEMBER3
	INT 21H
	LEA DX , MEMBER4
	INT 21H
	LEA DX , MEMBER5
	INT 21H
	LEA DX , MEMBER6
	INT 21H
	LEA DX , MEMBER7
	INT 21H
	JMP NAME_REGISTER1

NAME_REGISTER1:	
	;registration name
	mov ah,09h
	lea dx,askname
	int 21h
	
	;name
	mov ah,0ah
	lea dx,username
	int 21h

	;registration phone number
	mov ah,09h
	lea dx,askphonenumber
	int 21h

	;phone number
	mov ah,0ah
	lea dx,phonenumber
	int 21h
	JMP ASK_MEMBERSHIP_TYPE

ENDING1:
	JMP ENDING2

ASK_MEMBERSHIP_TYPE:
	;-----------------------------------------------
	;ASK FOR WHICH ONE IS WANTED
	;-----------------------------------------------
	MOV AH , 09H
	LEA DX , ASK_TYPE
	LEA DX , ASK_TYPE2
	INT 21H
	
	MOV AH , 01H
	INT 21H
	MOV ASK_TYPE3 , AL
	JMP ASK_MONTH1

EXIT1:
	JMP EXIT2
START_OF_CODE2:
	JMP START_OF_CODE3

ASK_MONTH1:

	MOV AH , 09H
	LEA DX , ASKMONTH
	INT 21H
	
	;STORE FIRST DIGIT 
	MOV AH , 01H
	INT 21H
	SUB AL , 30H
	MOV ANSMONTH , AL

	;STORE SECOND DIGIT
	MOV AH , 01H
	INT 21H
	CMP AL , 0DH
	JE MONTH_CHECKING
	CMP AL,'0'
	JNE CHECKINGi
	JMP CHECKING

CHECKINGi:
	CMP AL,'1'
	JNE CHECKINGii
	JMP CHECKING

CHECKINGii:
	CMP AL, '2'
	JNE INVALID_MONTHS
	JMP CHECKING

CHECKING:
	SUB AL , 30H
	MOV MONTH1 , AL

	MOV AL , ANSMONTH
	MOV CL , 10
	MUL CL
	ADD AL , MONTH1
	MOV ANSMONTH , AL
	JMP MONTH_CHECKING
	
ENDING2:
	JMP ENDING3

MONTH_CHECKING:
	
	CMP ANSMONTH , 1
	JL INVALID_MONTHS

	CMP ANSMONTH , 12
	JG INVALID_MONTHS

	JMP COMPARE_TYPE

INVALID_MONTHS:
	MOV AH , 09H
	LEA DX , INVALID_MONTH
	INT 21H
	JMP ASK_MONTH1
	
COMPARE_TYPE:

	CMP ASK_TYPE3 , 'B'
	JE REGISTER_BASIC

	CMP ASK_TYPE3 , 'P'
	JE REGISTER_PREMIUM1
	
	CMP ASK_TYPE3 , 'S'
	JE REGISTER_STUDENT1

	MOV AH , 09H
	LEA DX , INVALID4
	INT 21H

	JMP REGISTERATION

REGISTER_PREMIUM1:
	JMP REGISTER_PREMIUM

REGISTER_STUDENT1:
	JMP REGISTER_STUDENT2

ENDING3:
	JMP ENDING4

EXIT2:
	JMP EXIT3

REGISTER_BASIC:

	;PRINT RESULT
	mov ah,09h
	lea dx,invoice
	int 21h
	mov ah,09h
	lea dx,result1
	int 21h
	
	;print month
	mov ax,0
	mov al,ansmonth
	mov bl,10
	div bl
	mov bl,al
	mov bh,ah
	mov ah,02h
	add bl,30h
	mov dl,bl
	int 21h
	mov ah,02h
	add bh,30h
	mov dl,bh
	int 21h

	mov ax,0
	mov bx,0
	mov ah,09h
	lea dx,space1
	int 21h

	mov ah,09h
	lea dx,rmprice
	int 21h

	;total
	mov ax,P_registerB
	mov bl,ansmonth
	mul bx
	add registertotalB,ax

	;print total
	mov bx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	
	mov ah,02h
	mov dl,resdigit1
	int 21h
	
	mov ah,02h
	mov dl,resdigit2
	int 21h

	mov ah,02h
	mov dl,resdigit3
	int 21h

	mov ah,02h
	mov dl,resdigit4
	int 21h
	JMP REGISTER_PAYMENT

ENDING4:
	JMP ENDING

EXIT3:
	JMP EXIT4

START_OF_CODE1:
	JMP START_OF_CODE2

REGISTER_STUDENT2:
	JMP REGISTER_STUDENT3

ENDING:
	MOV AH , 09H
	LEA DX , ENDINGMSG
	INT 21H
	LEA DX, NEXT_OPERATION
	INT 21H
	
	MOV AH,01H
	INT 21H
	MOV NEXT_OPERATION2,AL

	cmp NEXT_OPERATION2,'Y'
	je START_OF_CODE1
	cmp NEXT_OPERATION2,'N'
	jne invalid_next_operation
	JMP EXIT4

invalid_next_operation:
	mov ah,09h
	lea dx,invalid_operation
	int 21h
	jmp ENDING

REGISTER_PREMIUM:

	;print result
	mov ah,09h
	lea dx,invoice
	int 21h
	mov ah,09h
	lea dx,result2
	int 21h
	
	;print month
	mov ax,0
	mov al,ansmonth
	mov bl,10
	div bl
	mov bl,al
	mov bh,ah
	mov ah,02h
	add bl,30h
	mov dl,bl
	int 21h
	mov ah,02h
	add bh,30h
	mov dl,bh
	int 21h

	mov ax,0
	mov bx,0
	mov ah,09h
	lea dx,space1
	int 21h

	mov ah,09h
	lea dx,rmprice
	int 21h

	;total
	mov ax,P_registerP
	mov bl,ansmonth
	mul bx
	add registertotalP,ax

	;print total
	mov bx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	
	mov ah,02h
	mov dl,resdigit1
	int 21h
	
	mov ah,02h
	mov dl,resdigit2
	int 21h

	mov ah,02h
	mov dl,resdigit3
	int 21h

	mov ah,02h
	mov dl,resdigit4
	int 21h
	JMP REGISTER_PAYMENT

REGISTER_STUDENT3:
	JMP REGISTER_STUDENT
EXIT4:
	JMP EXIT

REGISTER_STUDENT:

	;print result
	mov ah,09h
	lea dx,invoice
	int 21h
	mov ah,09h
	lea dx,result3
	int 21h
	
	;print month
	mov ax,0
	mov al,ansmonth
	mov bl,10
	div bl
	mov bl,al
	mov bh,ah
	mov ah,02h
	add bl,30h
	mov dl,bl
	int 21h
	mov ah,02h
	add bh,30h
	mov dl,bh
	int 21h

	mov ax,0
	mov bx,0
	mov ah,09h
	lea dx,space1
	int 21h

	mov ah,09h
	lea dx,rmprice
	int 21h

	;total
	mov ax,P_registerS
	mov bl,ansmonth
	mul bx
	add registertotalS,ax

	;print total
	mov bx,0
	mov bl,10
	div bx
	mov resdigit4,dl
	mov dx,0
	div bx
	mov resdigit3,dl
	mov dx,0
	div bx
	mov resdigit2,dl
	mov resdigit1,al
	add resdigit1,30h
	add resdigit2,30h
	add resdigit3,30h
	add resdigit4,30h
	
	mov ah,02h
	mov dl,resdigit1
	int 21h
	
	mov ah,02h
	mov dl,resdigit2
	int 21h

	mov ah,02h
	mov dl,resdigit3
	int 21h

	mov ah,02h
	mov dl,resdigit4
	int 21h
	JMP REGISTER_PAYMENT

REGISTER_PAYMENT:
	MOV AH , 09H
	LEA DX , PAYMENTMSG
	INT 21H
	JMP ENDING
EXIT:
	MOV AH , 4CH
	INT 21H

main endp
end main