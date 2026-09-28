; HANGMAN for CoCo
; by Rocco Corsi

; Title screen
TITLSCR
        JSR     CLRSCRN

        LDX     #TEXTSTR
        LEAX    10,X

!
        CMPX    #TEXTEND
        BGT     >

        LDY     #GMTITLE
        JSR     PRINT

        LEAX    32,X
        CMPX    #TEXTEND-32
        BGT     >

        LDY     #GMAUTH
        JSR     PRINT

        JSR     DELAY

        JSR     ERASE   erase author line

        LEAX    -32,X
        LDY     #GMTITLE
        JSR     ERASE   erase title line

        LEAX    32,X

        BRA     <

!
        LEAX    -32,X

        CMPX    #TEXTSTR
        BLE     >

        LDY     #GMTITLE
        JSR     PRINT

        LEAX    32,X

        LDY     #GMAUTH
        JSR     PRINT

        JSR     DELAY

        JSR     ERASE   erase author line

        LEAX    -32,X
        LDY     #GMTITLE
        JSR     ERASE   erase title line

        BRA     <

!       LDX     CURRTOP


        RTS


GMTITLE FCN     "COCO HANGMAN"
GMAUTH  FCN     "BY ROCCO CORSI"

CURRTOP FDB     $0
CURRBOT FDB     $0
