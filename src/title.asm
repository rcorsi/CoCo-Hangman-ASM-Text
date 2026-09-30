; HANGMAN for CoCo
; Copyright (c) 2026 Rocco Corsi

; Title screen
TITLE_SCREEN:
        LDA     #INVSPC
        JSR     CLRSCRN

        LDD     #$200
        JSR     DELAY_SET

; set bottom to one line from the bottom
        LDX     #TEXTEND
        LEAX    -32,X
        STX     CURRBOT

; set top
        LDX     #TEXTSTR
        STX     CURRTOP

; plus 10 chars to center title text
        LEAX    10,X

TITLE_START:
!
        CMPX    CURRBOT
        BGT     >

        LDY     #GMTITLE
        JSR     PRINT

        LEAX    32,X
        CMPX    CURRBOT
        BGT     >

        LDY     #GMAUTH
        JSR     PRINT

        JSR     DELAY

        LDA     #INVSPC
        JSR     ERASE   erase author line

        LEAX    -32,X
        LDY     #GMTITLE
        JSR     ERASE   erase title line

        LEAX    32,X

        BRA     <

!
        LEAX    -32,X

        CMPX    CURRTOP
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

!       LDX     CURRBOT
        LEAX    -32,X
        STX     CURRBOT

        LDX     CURRTOP
        LEAX    32,X
        STX     CURRTOP

        LEAX    10,X

        CMPX    CURRBOT
        BLT     TITLE_START

        LDY     #GMTITLE
        JSR     PRINT

        LEAX    32,X

        LDY     #GMAUTH
        JSR     PRINT

        RTS


GMTITLE FCN     "COCO HANGMAN"
GMAUTH  FCN     "BY ROCCO CORSI"

; Current Top of Video RAM
CURRTOP FDB     $0400
; Current Bottom of Video RAM
CURRBOT FDB     $0600


