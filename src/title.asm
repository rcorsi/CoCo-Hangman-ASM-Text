; HANGMAN for CoCo
; by Rocco Corsi

; Title screen
TITLSCR
        LDX     #TEXTSTR
        LEAX    10,X

TITLL1
        CMPX    #TEXTEND
        BGT     TITLEND

        JSR     CLRSCRN

        LDY     #GTITLE
        JSR     PRINT

        LEAX    32,X
        CMPX    #TEXTEND
        BGT     TITLEND

        LDY     #GAUTHOR
        JSR     PRINT

        JSR     DELAY

        BRA     TITLL1

TITLEND
        LEAX    -32,X

        CMPX    #TEXTSTR
        BLE     TITLSCR

        JSR     CLRSCRN

        LDY     #GTITLE
        JSR     PRINT

        LEAX    32,X

        LDY     #GAUTHOR
        JSR     PRINT

        LEAX    -32,X

        JSR     DELAY

        BRA     TITLEND

        RTS


GTITLE  FCN     "COCO HANGMAN"
GAUTHOR FCN     "BY ROCCO CORSI"
