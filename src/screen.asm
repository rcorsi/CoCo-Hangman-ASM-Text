; HANGMAN for CoCo
; Copyright (c) 2026 Rocco Corsi


; Invert the 32x16 text screen
INVSCRN LDX     #TEXTSTR
!       LDA     ,X
        EORA    #$40
        STA     ,X+
        CMPX    #TEXTEND
        BLO     <
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
        JSR     FIXSPC
        ANDA    #$BF
        STA     ,X+
        BRA     <

!       PULS    A,X,Y
        RTS

; Convert ASCII space to VIDEO RAM space
;   IN/OUT register A has character to check
FIXSPC  CMPA    #ASCSPC
        BNE     >
        LDA     #VIDSPC
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