; HANGMAN for CoCo
; Copyright (c) 2026 Rocco Corsi


; Invert the 32x16 text screen
INVSCRN PSHS    A,X

        LDX     #TEXTSTR
!       LDA     ,X
        EORA    #$40    flip bit 6 (0100_0000) only
        STA     ,X+
        CMPX    #TEXTEND
        BLO     <

        PULS    A,X
        RTS


; Clear the 32x16 text screen
; Same as CLS
CLRSCRN PSHS    A,X

        LDA     #VIDSPC
        LDX     #TEXTSTR
!       STA     ,X+
        CMPX    #TEXTEND
        BLO     <

        PULS    A,X
        RTS

; Write text to screen location
;   IN register Y has text pointer
;   IN register X has screen location
PRINT   PSHS    A,X,Y

!       LDA     ,Y+
        CMPA    #NULCHR
        BEQ     >

        JSR     MAKE_INVERTED
        STA     ,X+
        BRA     <

!       PULS    A,X,Y
        RTS

; Convert to inverted char if char < 128
;   IN/OUT register A has character to check
MAKE_INVERTED:
        CMPA    #$80    special graphics symbols?
        BCC     >       do nothing, skip them
        ANDA    #$BF    turn off bit 6 (1011_1111)
!       RTS


; Erase text to screen location
;   IN register Y has text pointer
;   IN register X has screen location
ERASE   PSHS    A,X,Y

!       LDA     ,Y+
        CMPA    #NULCHR
        BEQ     >
        LDA     #VIDSPC
        STA     ,X+
        BRA     <

!       PULS    A,X,Y
        RTS


; Start of default video RAM 32x16
TEXTSTR EQU     $0400
; End of default video RAM 32x16
TEXTEND EQU     $0600


; ASCII space character
ASCSPC  EQU     $20
; Video RAM space character
VIDSPC  EQU     $20
; ASCII NULL character / string terminator
NULCHR  EQU     $0