; HANGMAN for CoCo
; by Rocco Corsi

START_GAME:

; Show Title Screen
        JSR     TITLE_SCREEN

; Get the number of words
        JSR     COUNT_WORDS
        STB     NUMWORD

; Show Press Any Key message on screen
        JSR     PRESKEY

; Wait for keypress and use it as "random" number.
        JSR     WAITKEY
        STB     NUMRAND

; Massage the "random" number so is within word list limits
        LDA     NUMRAND
        LDB     NUMWORD
        JSR     MODULO

; Find location of selected word
        JSR     FIND_WORD
        STX     WORDPTR

        JSR     START_ROUND
EXIT_GAME:
        JSR     CLRSCRN
        RTS

START_ROUND:
; show empty hangman
        JSR     CLRSCRN
        JSR     SHOW_GALLOWS

; show missing letters
        JSR     SHOW_LETTERS
        RTS

; ask for a guess
; if guess right, show letters
; if guess wrong, add part to HANGMAN
; if too many guess, hangman died
; if correct word guessed, play happy music, and start over
; else go back to "ask for a guess"

SHOW_GALLOWS:
        RTS

SHOW_LETTERS:
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

WORDPTR FDB     $0000

