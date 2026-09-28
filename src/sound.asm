* HANGMAN for CoCo
* by Rocco Corsi

        ORG     $4000

* clear screen

* show initial screen

* spin on variable to get "random" value

* pick word from list with random value

* clear screen

* show empty HANGMAN

* show missing letters

* ask for a guess

* if guess right, show letters

* if guess wrong, add part to HANGMAN

* if too many guess, hangman died
* else go back to "ask for a guess"

* start over

main:

        JSR TITLSCR
        ; JSR INVREPT
        ; JSR     SOUNDON
        ; JSR     THESOUND2
        ; JSR     SOUNDOFF
        RTS

SOUNDON
        LDA     $FF01   SELECT SOUND OUT
        ANDA    #$F7    RESET MUX BIT
        STA     $FF01

        LDA     $FF03   SELECT SOUND OUT
        ANDA    #$F7    RESET MUX BIT
        STA     $FF03

        LDA     $FF23   GET PIA
        ORA     #8      ENABLE 6-BIT SOUND
        STA     $FF23

        RTS

SOUNDOFF
        CLRA
        STA     $FF23
        STA     $FF21
        STA     $FF20
        RTS

THESOUND1
        LDX     #$FF
LOOP10
        LDB     #$5F
LOOP11
        STB     $FF20
        NOP
        NOP
        NOP
        INCB
        BNE     LOOP11
        LEAX    -1,X
        BNE     LOOP10
        RTS

THESOUND2
        LDY     #NOTES2
LOOP21
        LDX     #$080

        LDB     ,Y+
        CMPB    #0
        BEQ     SOUNDEND2
        TFR     B,A

LOOP22
        STB     $FF20
        NOP
        NOP
        NOP
        INCB
        BNE     LOOP22
        TFR     A,B
        LEAX    -1,X
        BNE     LOOP22

        BRA     LOOP21
SOUNDEND2
        RTS

NOTES2  FCB     $37,40,$49,$52,$5B,$64,$6D,$76
        FCB     $76,$6D,$64,$5B,$52,$49,40,$37
        FCB     $00

; Invert the 32x16 text screen repeatedly
INVREPT JSR     INVSCRN
        BRA     INVREPT

; Invert the 32x16 text screen
INVSCRN LDX     #TEXTSTR
INVL1   LDA     ,X
        EORA    #$40
        STA     ,X+
        CMPX    #TEXTEND
        BLO     INVL1
        RTS

; Clear the 32x16 text screen
; Same as CLS
CLRSCRN PSHS    A,X

        LDA     #$60
        LDX     #TEXTSTR
CLRL1   STA     ,X+
        CMPX    #TEXTEND
        BLO     CLRL1

        PULS    A,X
        RTS

; Write Y text to X location
PRINT   PSHS    A,X,Y

PRINTL  LDA     ,Y+
        CMPA    #0
        BEQ     PRINTD
        CMPA    #$20    space char
        BNE     NOTSPACE
        LDA     #$60
NOTSPACE
        STA     ,X+
        BRA     PRINTL

PRINTD  PULS    A,X,Y
        RTS

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


GTITLE  FCC     "COCO HANGMAN"
        FCB     $00
GAUTHOR FCC     "BY ROCCO CORSI"
        FCB     $00


DELAY   PSHS    X
        LDX     #$1000
DELAYL
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        LEAX    -1,X
        CMPX    #0
        BNE     DELAYL

        PULS    X
        RTS



TEXTSTR EQU     $0400
TEXTEND EQU     $0600

        END     main
