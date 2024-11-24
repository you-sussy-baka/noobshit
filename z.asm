.model small
.stack 100h
.data
    ; Fruit Store Title
    line        db '=-=-=-=-=-=-=-=-=-=-=-$'
    apple1      db "       ,--./,-.       $"
    apple2      db "      / #      \      $"
    apple3      db "     |          |     $"
    apple4      db "      \        /      $"
    apple5      db "       `._,._,'       $"
    appleString dw offset apple1, offset apple2, offset apple3, offset apple4, offset apple5
    storeName   db '  FRESH FRUIT STORE  $'

    ; System Shutdown
    shutdown db 'Shutting down...$'
    
    ; Fruits (grapes 7, apple 2.2, orange 1.8, papaya 5, watermelon 18, strawberry 9, pear 4.5, guava 2.5)
    pointerGrapes     db 'Grapes      $'
    pointerApple      db 'Apple       $'
    pointerOrange     db 'Orange      $'
    pointerPapaya     db 'Papaya      $'
    pointerWatermelon db 'Watermelon  $'
    pointerStrawberry db 'Strawberry  $'
    pointerPear       db 'Pear        $'
    pointerGuava      db 'Guava       $'
    fruitsName dw offset pointerGrapes, offset pointerApple, offset pointerOrange, offset pointerPapaya, offset pointerWatermelon, offset pointerStrawberry, offset pointerPear, offset pointerGuava
    fruitsIPrice db 7, 2, 1, 5, 18, 9, 4, 2
    fruitsFprice db 0, 20, 80, 0, 0, 0, 50, 50
    fruitsStock db 50, 50, 50, 50, 50, 50, 50, 50

    ; Cart
    cart db 8 dup(0)

    ; Plastic Bag
    pFBag       db 50 ;RM0.50
    PBagString  db 'Plastic Bag $'

    ; Summary Report
    fruitsSold db 8 dup(0)
    totalProfitI dw 0
    totalProfitF dw 0

    ; Round Up Proc 
    roundUpI dw 0
    roundUpF dw 0

    ; Print Number Proc (32767 is max value)
    num dw 0

    ; Print Price Proc
    printPriceI dw 4
    printPriceF dw 99

;==============================================================================
.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    loginLoop:
    call fruitStoreTitle
    

    testing:
    call newline
    mov roundUpI, 10
    mov roundUpF, 9543
    call roundUp
    mov ax, roundUpI
    mov printPriceI, ax
    mov ax, roundUpF
    mov printPriceF, ax
    call printPrice
    call newline

    exit:
    call newline
    mov dx, offset shutdown
    mov ah, 09h
    int 21h
    call newline
    mov ah, 4Ch
    int 21h
main endp

fruitStoreTitle proc
call newline
    mov dx, offset line
    mov ah, 09h
    int 21h
    call newline
    mov si, offset appleString
    mov cx, 5
    apple:
    mov dx, [si]
    mov ah, 09h
    int 21h
    call newline
    add si, 2
    loop apple
    mov dx, offset storeName
    mov ah, 09h
    int 21h
    call newline
    mov dx, offset line
    mov ah, 09h
    int 21h
    call newline
    ret
fruitStoreTitle endp

printNumber proc
    mov ax, 1 ; ax is the divisor
    mov bx, num
    cmp bx, 10
    jl singleDigit ; If num < 10, handle as single digit

    testDivisor:
    mov cx, 10
    mul cx ; ax *= 10
    cmp ax, num
    jg doneDivisor ; Exit loop if divisor exceeds num
    push ax ; save divisor (10, 100, 1000, 10000)
    cmp ax, 10000
    je doneDivisor ; Exit loop if divisor is 10000, since it will overflow
    jmp testDivisor
    doneDivisor:

    printLoop:
    xor dx, dx
    mov ax, num
    pop bx ; bx is the divisor
    div bx ; ax = num / bx, dx = num % bx
    mov num, dx ; Update num to the remainder
    mov dx, ax ; print the quotient
    add dl, 48
    mov ah, 2
    int 21h
    cmp bx, 10 ; If divisor is 10, exit loop
    jne printLoop

    mov dx, num
    add dl, 48
    mov ah, 2
    int 21h
    ; Logic behind the loop
    ; digitOne = num1 / 1000;
	; num1 = num1 % 1000;
	; digitTwo = num1 / 100;
	; num1 = num1 % 100;
	; digitThree = num1 / 10;
	; digitFour = num1 % 10;
    ret

    singleDigit:
    mov dx, bx
    add dl, 48
    mov ah, 2
    int 21h
    ret
printNumber endp

printPrice proc
    mov ax, printPriceI
    mov num, ax
    call printNumber

    mov dl, "."
    mov ah, 2
    int 21h

    ; Print Floating Part
    xor dx, dx
    mov ax, printPriceF
    mov bx, 10
    div bx
    mov printPriceF, dx
    mov dx, ax
    add dl, 48
    mov ah, 2
    int 21h
    mov dx, printPriceF
    add dl, 48
    mov ah, 2
    int 21h

    ret
printPrice endp

roundUp proc
    mov ax, roundUpF
    xor dx, dx
    mov bx, 100
    div bx
    add roundUpI, ax
    mov roundUpF, dx
    ret
roundUp endp

newline proc
    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h
    ret
newline endp

tab proc
    mov ah, 02h
    mov dl, 09h
    int 21h
    ret
tab endp

end main
