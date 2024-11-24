.model small
.stack 100h
.data
    ; Divider
    divider     db '=-=-=-=-=-=-=-=-=-=-=-$'

    ; Fruit Store Title
    apple1      db "       ,--./,-.       $"
    apple2      db "      / #      \      $"
    apple3      db "     |          |     $"
    apple4      db "      \        /      $"
    apple5      db "       `._,._,'       $"
    appleString dw offset apple1, offset apple2, offset apple3, offset apple4, offset apple5
    storeName   db '  FRESH FRUIT STORE  $'

    ; Login Screen
    login1 db 'You are a...$'
    login2 db '1. Customer$'
    login3 db '2. Admin$'
    exitLoginLoop db 0

    ; Customer Menu
    customer1 db 'Welcome! What would you like to do?$'
    customer2 db '1. Buy Fruits$'
    customer3 db '2. View Cart$'
    customer4 db '3. Logout$'

    ; Buy Fruits
    buyFruits1 db 'What would you like to buy?$'
    buyFruits2 db '. $'
    buyFruits3 db '- RM $'
    buyFruits4 db ' left)$'
    buyFruits5 db '8. Back to Main Menu$'
    tmpBuyFruitsCount dw 0
    selectedBuyFruits db 0

    ; Select Buy Fruits
    selectBuyFruits1 db 'You have $'
    selectBuyFruits2 db '(s) in your cart'
    selectBuyFruits3 db '1. Add to Cart$'
    selectBuyFruits4 db '2. Back$'

    ; System Shutdown
    shutdown db 'Shutting down...$'
    
    ; Fruits (apple 2.2, orange 1.8, papaya 5, watermelon 18, pear 4.5, guava 2.5, durian 50)
    fruitsNamepointerApple      db 'Apple$'
    fruitsNamepointerOrange     db 'Orange$'
    fruitsNamepointerPapaya     db 'Papaya$'
    fruitsNamepointerWatermelon db 'Watermelon$'
    fruitsNamepointerPear       db 'Pear$'
    fruitsNamepointerGuava      db 'Guava$'
    fruitsNamepointerDurian     db 'Durian$'
    fruitsNameLongpointerApple      db 'Apple       $'
    fruitsNameLongpointerOrange     db 'Orange      $'
    fruitsNameLongpointerPapaya     db 'Papaya      $'
    fruitsNameLongpointerWatermelon db 'Watermelon  $'
    fruitsNameLongpointerPear       db 'Pear        $'
    fruitsNameLongpointerGuava      db 'Guava       $'
    fruitsNameLongpointerDurian     db 'Durian      $'
    fruitsLength equ 7
    fruitsName dw offset fruitsNamepointerApple, offset fruitsNamepointerOrange, offset fruitsNamepointerPapaya, offset fruitsNamepointerWatermelon, offset fruitsNamepointerPear, offset fruitsNamepointerGuava, offset fruitsNamepointerDurian
    fruitsNameLong dw offset fruitsNameLongpointerApple, offset fruitsNameLongpointerOrange, offset fruitsNameLongpointerPapaya, offset fruitsNameLongpointerWatermelon, offset fruitsNameLongpointerPear, offset fruitsNameLongpointerGuava, offset fruitsNameLongpointerDurian
    fruitsIPrice db 2, 1, 5, 18, 4, 2, 50
    fruitsFprice db 20, 80, 0, 0, 50, 50, 0
    fruitsStock dw 20, 100, 50, 20, 10, 50, 30

    ; Cart
    cart db 7 dup(0)

    ; Plastic Bag
    pFBag       db 50 ;RM0.50
    PBagString  db 'Plastic Bag $'

    ; Summary Report
    fruitsSold db 7 dup(0)
    totalProfitI dw 0
    totalProfitF dw 0

    ; System Pause
    syspauseString db 'Press any key to continue...$'

    ; Invalid Number Proc
    invalidNumberMax db 0
    invalidNumberString db 'Invalid number! You can only choose 1$'
    invalidNumberOr db " or 2$"

    ; Print Number Proc (32767 is max value)
    num dw 0
    printNumberCount db 0

    ; Print Price Proc
    printPriceI dw 0
    printPriceF dw 0
    printPriceCount db 0

    ; Float Multiply Proc
    floatMulI dw 0
    floatMulF dw 0
    floatMultiplier db 0

    ; Round Up Proc 
    roundUpI dw 0
    roundUpF dw 0

    ; Input Proc
    inputChar db 0
    inputOptionString db 'Option > $'

    ; Hidden Input Proc
    hiddenInputChar db 0

    ; Input Number Proc
    inputNumberI dw 0
    inputNumberMax dw 0

    ; Input Price Proc
    inputPriceI dw 0
    inputPriceF dw 0
    inputPriceMax dw 0

    ; Remove Char Proc
    removeCharCount db 0

;==============================================================================
.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    loginLoop:
    mov al, exitLoginLoop
    cmp al, 1
    je exit

    call fruitStoreTitle
    mov ah, 09h
    mov dx, offset login1
    int 21h
    call newline
    mov ah, 09h
    mov dx, offset login2
    int 21h
    call newline
    mov ah, 09h
    mov dx, offset login3
    int 21h
    call newline

    call input
    cmp inputChar, '1'
    je customerOption
    cmp inputChar, '2'
    je adminOption

    ; Invalid Input
    mov invalidNumberMax, 2
    call invalidNumber
    jmp loginLoop

    customerOption:
    call customer
    jmp loginLoop
    adminOption:
    call admin
    jmp loginLoop

    testing:
    call newline
    call inputNumber
    call newline

    exit:
    call newline
    call newline
    mov ah, 09h
    mov dx, offset shutdown
    int 21h
    call newline
    call newline

    mov ah, 4Ch
    int 21h
main endp

customer proc
    customerLoop:
    call newline
    call newline
    call newDivider
    call newline
    mov ah, 09h
    mov dx, offset customer1
    int 21h
    call newline
    mov ah, 09h
    mov dx, offset customer2
    int 21h
    call newline
    mov ah, 09h
    mov dx, offset customer3
    int 21h
    call newline
    mov ah, 09h
    mov dx, offset customer4
    int 21h
    call newline

    call input
    cmp inputChar, '1'
    je buyFruitsOption
    cmp inputChar, '2'
    je viewCartOption
    cmp inputChar, '3'
    je exitCustomerLoop

    ; Invalid Input
    mov invalidNumberMax, 3
    call invalidNumber
    jmp customerLoop

    buyFruitsOption:
    call buyFruits
    jmp customerLoop
    viewCartOption:
    call viewCart
    jmp customerLoop

    exitCustomerLoop:
    ret
customer endp

buyFruits proc
    buyFruitsLoop:
    call newline
    call newline
    call newDivider
    call newline
    mov ah, 09h
    mov dx, offset buyFruits1
    int 21h
    call newline
    
    mov cx, fruitsLength
    printFruits:
    ; save cx
    mov tmpBuyFruitsCount, cx

    ; bx = index
    mov bx, fruitsLength
    sub bx, cx

    ; Print Number in sequence starting from 1
    mov dx, bx
    add dx, 1
    add dx, 48
    mov ah, 2
    int 21h

    mov ah, 09h
    mov dx, offset buyFruits2
    int 21h

    ; ax = index * 2
    ; used for fruitsNameLong array offset
    mov ax, bx
    mov dl, 2
    mul dl
    
    ; Print Fruit Name
    mov si, offset fruitsNameLong
    add si, ax
    mov dx, [si]
    mov ah, 09h
    int 21h

    mov ah, 09h
    mov dx, offset buyFruits3
    int 21h

    ; Print Fruit Price
    mov si, offset fruitsIPrice
    add si, bx
    xor ax, ax
    mov al, [si]
    mov printPriceI, ax
    mov si, offset fruitsFPrice
    add si, bx
    xor ax, ax
    mov al, [si]
    mov printPriceF, ax
    call printPrice

    call tab

    mov ah, 2
    mov dl, '('
    int 21h

    ; Print Stock
    mov si, offset fruitsStock
    add si, bx
    mov ax, [si]
    mov num, ax
    call printNumber

    mov ah, 09h
    mov dx, offset buyFruits4
    int 21h
 
    call newline
    mov cx, tmpBuyFruitsCount
    loop printFruits

    mov ah, 09h
    mov dx, offset buyFruits5
    int 21h
    call newline

    call input
    cmp inputChar, '8'
    je exitBuyFruitsLoop
    cmp inputChar, '1'
    jl invalidBuyFruitsInput
    cmp inputChar, '7'
    jg invalidBuyFruitsInput

    mov selectedBuyFruits, inputChar
    sub selectedBuyFruits, 48
    call selectBuyFruits
    jmp buyFruitsLoop

    invalidBuyFruitsInput:
    mov invalidNumberMax, 9
    call invalidNumber
    jmp buyFruitsLoop

    exitBuyFruitsLoop:
    ret
buyFruits endp

selectBuyFruits proc
    

    selectBuyFruitsLoop:
    call newline
    call newline
    call newDivider
    call newline

    mov ah, 9
    mov dx, offset selectBuyFruits1
    int 21h

    mov ah, 2



    exitSelectBuyFruitsLoop:
    ret
selectBuyFruits endp

viewCart proc

    ret
viewCart endp

admin proc
    mov exitLoginLoop, 1
    ret
admin endp

fruitStoreTitle proc
    call newline
    call newline
    call newDivider
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
    call newDivider
    call newline

    ret
fruitStoreTitle endp

syspause proc
    mov dx, offset syspauseString
    mov ah, 09h
    int 21h
    mov ah, 7
    int 21h
    ret
syspause endp

invalidNumber proc
    call newline
    call newline
    mov dx, offset invalidNumberString
    mov ah, 9
    int 21h
    call newline
    call newline
    call syspause

    cmp bx, 2
    je invalidNumberTwo
    
    mov ah, 2
    mov dl, '-'
    int 21h
    mov dl, invalidNumberMax
    add dl, 48
    int 21h

    jmp invalidNumberSystemPause

    invalidNumberTwo:
    mov dx, offset invalidNumberOr
    mov ah, 9
    int 21h

    invalidNumberSystemPause:
    call newline
    call newline
    call syspause
    call newline
    ret
invalidNumber endp

printNumber proc
    mov ax, 1 ; ax is the divisor
    mov bx, num
    cmp bx, 10
    mov printNumberCount, 1
    jl singleDigit ; If num < 10, handle as single digit

    testDivisor:
    mov cx, 10
    mul cx ; ax *= 10
    cmp ax, num
    jg doneDivisor ; Exit loop if divisor exceeds num
    push ax ; save divisor (10, 100, 1000, 10000)
    inc printNumberCount
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
    mov al, printNumberCount
    mov printPriceCount, al

    mov dl, "."
    mov ah, 2
    int 21h
    inc printPriceCount

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
    add printPriceCount, 2

    ret
printPrice endp

floatMul proc
    mov ax, floatMulI
    mov bl, floatMultiplier
    mul bl
    mov roundUpI, ax
    mov ax, floatMulF
    mul bl
    mov roundUpF, ax
    call roundUp
    mov ax, roundUpI
    mov floatMulI, ax
    mov ax, roundUpF
    mov floatMulF, ax

    ret
floatMul endp

roundUp proc
    mov ax, roundUpF
    xor dx, dx
    mov bx, 100
    div bx
    add roundUpI, ax
    mov roundUpF, dx
    ret
roundUp endp

input proc
    mov dx, offset inputOptionString
    mov ah, 09h
    int 21h
    mov ah, 1
    int 21h
    mov inputChar, al
    ret
input endp

hiddenInput proc
    mov ah, 7
    int 21h
    mov hiddenInputChar, al
    ret
hiddenInput endp

inputNumber proc
    mov inputNumberI, 0

    mov num, 0
    call printNumber

    getNumberInputLoop:
    call hiddenInput
    cmp hiddenInputChar, 13
    je exitNumberInputLoop
    cmp hiddenInputChar, 8
    je numberBackspace

    ; Check if input is a digit
    cmp hiddenInputChar, 48
    jl getNumberInputLoop
    cmp hiddenInputChar, 57
    jg getNumberInputLoop

    mov ax, inputNumberI
    mov bx, 10
    mul bx
    mov inputNumberI, ax
    ; i *= 10

    xor ax, ax
    mov al, hiddenInputChar
    sub ax, 48
    add inputNumberI, ax
    ; i += input

    ; Remove previous output
    mov al, printNumberCount
    mov removeCharCount, al
    call removeChar

    ; Print new output
    mov ax, inputNumberI
    mov num, ax
    call printNumber

    ; Check whether input exceeds max value
    mov ax, inputNumberI
    cmp ax, inputNumberMax
    jl getNumberInputLoop

    exitNumberInputLoop:
    ret

    numberBackspace:
    xor dx, dx
    mov ax, inputNumberI
    mov bx, 10
    div bx
    mov inputNumberI, ax
    ; i /= 10

    ; Remove previous output
    mov al, printNumberCount
    mov removeCharCount, al
    call removeChar

    ; Print new output
    mov ax, inputNumberI
    mov num, ax
    call printNumber

    jmp getNumberInputLoop

    ret
inputNumber endp

inputPrice proc
    mov inputPriceI, 0
    mov inputPriceF, 0

    mov printPriceI, 0
    mov printPriceF, 0
    call printPrice

    getPriceInputLoop:
    call hiddenInput
    cmp hiddenInputChar, 13
    je exitPriceInputLoop
    cmp hiddenInputChar, 8
    je priceBackspace

    ; Check if input is a digit
    cmp hiddenInputChar, 48
    jl getPriceInputLoop
    cmp hiddenInputChar, 57
    jg getPriceInputLoop

    mov ax, inputPriceI
    mov bx, 10
    mul bx
    mov roundUpI, ax
    mov ax, inputPriceF
    mov bx, 10
    mul bx
    mov roundUpF, ax
    call roundUp
    mov ax, roundUpI
    mov inputPriceI, ax
    mov ax, roundUpF
    mov inputPriceF, ax
    ; i *= 10
    ; f *= 10
    ; roundup

    xor ax, ax
    mov al, hiddenInputChar
    sub ax, 48
    add inputPriceF, ax
    ; f += input

    ; Remove previous output
    mov al, printPriceCount
    mov removeCharCount, al
    call removeChar

    ; Print new output
    mov ax, inputPriceI
    mov printPriceI, ax
    mov ax, inputPriceF
    mov printPriceF, ax
    call printPrice

    ; Check whether input exceeds max value
    mov ax, inputPriceI
    cmp ax, inputPriceMax
    jl getPriceInputLoop
    
    exitPriceInputLoop:
    ret

    priceBackspace:
    xor dx, dx
    mov ax, inputPriceF
    mov bx, 10
    div bx
    mov inputPriceF, ax
    ; f /= 10

    xor dx, dx
    mov ax, inputPriceI
    mov bx, 10
    div bx
    mov inputPriceI, ax
    mov ax, dx
    mov bl, 10
    mul bl
    add inputPriceF, ax
    ; i /= 10
    ; f += (10 * remainder)

    ; Remove previous output
    mov al, printPriceCount
    mov removeCharCount, al
    call removeChar

    ; Print new output
    mov ax, inputPriceI
    mov printPriceI, ax
    mov ax, inputPriceF
    mov printPriceF, ax
    call printPrice

    jmp getPriceInputLoop

    ret
inputPrice endp

newline proc
    mov ah, 2
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h
    ret
newline endp

newDivider proc
    mov dx, offset divider
    mov ah, 09h
    int 21h
    ret
newDivider endp

tab proc
    mov ah, 02h
    mov dl, 09h
    int 21h
    ret
tab endp

removeChar proc
    xor cx, cx
    mov cl, removeCharCount
    removeCharLoop:
    mov dl, 8
    mov ah, 2
    int 21h
    loop removeCharLoop
    mov cl, removeCharCount
    addSpace:
    mov dl, " "
    mov ah, 2
    int 21h
    loop addSpace
    mov cl, removeCharCount
    setCursorBack:
    mov dl, 8
    mov ah, 2
    int 21h
    loop setCursorBack
    ret
removeChar endp

end main
