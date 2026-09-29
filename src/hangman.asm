; HANGMAN for CoCo
; by Rocco Corsi

START_GAME:

         JSR     TITLE_SCREEN

         JSR     COUNT_WORDS
         STB     NUMWORD

         JSR     PRESKEY

!        JSR     WAITKEY
         STB     NUMRAND

         LDA     NUMRAND
         LDB     NUMWORD
         JSR     MODULO

         JSR     FIND_WORD
         TFR     X,Y

         LDX     #TEXTSTR
         JSR     PRINT
         BRA     <

END_GAME:
        BRA     END_GAME

EXIT_GAME:
        JSR     CLRSCRN
        RTS

PRESKEY LDX     #TEXTEND
        LEAX    -32,X
        LDY     #PRESMSG
        JSR     PRINT
        RTS

; Count words in the word list
;   OUT register B has the count
COUNT_WORDS:
        PSHS    A,X

        CLRB
        LDX     #WORDLST
!       LDA     ,X+
        CMPA    #0
        BNE     <
        INCB
        LDA     ,X+
        CMPA    #0
        BNE     <

        PULS    A,X
        RTS

; Find words in the word list
;   IN  register A has the # of the word
;   OUT register X has the start of the word
FIND_WORD:
        PSHS    A,B

        STA     FINDNUM
        CLRB
        LDX     #WORDLST
FINDNXT:
        CMPB    FINDNUM
        BEQ     FINDDONE
        INCB
!       LDA     ,X+
        CMPA    #0
        BNE     <
        BRA     FINDNXT

FINDDONE:
        PULS    A,B
        RTS

FINDNUM FCB     $0


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