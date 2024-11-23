.model small
.stack 100h
.data
    ; New Line
    newline     db 0Dh, 0Ah, '$'
    
    ; Fruits Name (grapes, apple, orange, papaya, watermelon, strawberry, pear, guava)
    fGrapes     db 'Grapes$'
    fApple      db 'Apple$'
    fOrange     db 'Orange$'
    fPapaya     db 'Papaya$'
    fWatermelon db 'Watermelon$'
    fStrawberry db 'Strawberry$'
    fPear       db 'Pear$'
    fGuava      db 'Guava$'

    ; Fruits Price
    pGrapes     dw 10
    pApple      dw 2
    pOrange     dw 3
    pPapaya     dw 7
    pWatermelon dw 15
    pStrawberry dw 10
    pPear       dw 3
    pGuava      dw 5

    ; Fruits Total Sold
    tGrapes     dw 0
    tApple      dw 0
    tOrange     dw 0
    tPapaya     dw 0
    tWatermelon dw 0
    tStrawberry dw 0
    tPear       dw 0
    tGuava      dw 0

    ; Cart fruits quantity
    cGrapes     dw 0
    cApple      dw 0
    cOrange     dw 0
    cPapaya     dw 0
    cWatermelon dw 0
    cStrawberry dw 0
    cPear       dw 0
    cGuava      dw 0

    ; Plastic Bag
    pBag        dw 1
    PBagString  db 'Plastic Bag$'

    ; Summary Report
    totalProfit dw 0

    ;==============================================================================
.code



main proc
    
     
    ; Print the string at index 3
         mov dx, offset string1      ; Move the pointer into DX
         mov ah, 09h                 ; DOS interrupt to print a string
         int 21h

    ; Exit program
    exit:
         mov ah, 4Ch
         int 21h
main endp
end main
