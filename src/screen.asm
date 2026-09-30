; HANGMAN for CoCo
; Copyright (c) 2026 Rocco Corsi


*; Fill the 32x16 text screen with char
; Similar to CLS
;   IN register A has char to fill the screen
CLRSCRN PSHS    X

        LDX     #TEXTSTR
!       STA     ,X+
        CMPX    #TEXTEND
        BLO     <

        PULS    X
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
;   IN register A has fill char
;   IN register X has screen location
;   IN register Y has text pointer
ERASE   PSHS    B,X,Y

!       LDB     ,Y+
        CMPB    #NULCHR
        BEQ     >
        STA     ,X+
        BRA     <

!       PULS    B,X,Y
        RTS


; Start of default video RAM 32x16
TEXTSTR EQU     $0400
; End of default video RAM 32x16
TEXTEND EQU     $0600


; Video RAM space character - Inverted
INVSPC  EQU     $20
; Video RAM space character - Normal
NORSPC  EQU     $60
; Video RAM black character
BLKSPC  EQU     $80
; Video RAM Green character
GRNSPC  EQU     $8F
; ASCII NULL character / string terminator
NULCHR  EQU     $0