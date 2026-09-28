; HANGMAN for CoCo
; by Rocco Corsi


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
