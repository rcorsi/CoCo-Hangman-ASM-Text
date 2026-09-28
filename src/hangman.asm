; HANGMAN for CoCo
; by Rocco Corsi

START_GAME:

*         * JSR     TITLSCR

         JSR     CNTWRDS
         STB     NUMWORD

         JSR     PRESKEY

         JSR     WAITKEY
         STB     NUMRAND
 
END_GAME:
        BRA     END_GAME
;JSR     CLRSCRN
EXIT_GAME:
        RTS

PRESKEY LDX     #TEXTEND
        LEAX    -32,X
        LDY     #PRESMSG
        JSR     PRINT
        RTS

; Count words in the word list
;   register B has the count
CNTWRDS CLRB
        LDX     #WORDLST
!       LDA     ,X+
        CMPA    #0
        BNE     <
        INCB
        LDA     ,X+
        CMPA    #0
        BNE     <
        RTS



PRESMSG FCN     "PRESS ANY KEY"

WORDLST FCN     "AMAZING"
        FCN     "BEFRIEND"
        FCN     "COMPOSITE"
        FCN     "DECIMATE"
        FCN     "EQUATOR"
        FCN     "FANTASTIC"
        FCN     "GEOGRAPHY"
        FCN     "HOSPITAL"
        FCN     "INFORMATION"
        FCN     "JAVELIN"
        FCN     "KNOWLEDGE"
        FCN     "LANYARD"
        FCN     "MACHINE"
        FCN     "NOISY"
        FCN     "OPERATE"
        FCN     "POPULATE"
        FCN     "QUESTION"
        FCN     "RAPIDLY"
        FCN     "STANDARD"
        FCN     "TOXIC"
        FCN     "UNIFORM"
        FCN     "VICTOR"
        FCN     "WINNER"
        FCN     "XENON"
        FCN     "YELLOW"
        FCN     "ZEBRA"
        FCB     $00

; Number of Words available for the game
NUMWORD FCB     $0
NUMRAND FCB     $0