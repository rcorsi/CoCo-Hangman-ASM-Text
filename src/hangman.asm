; HANGMAN for CoCo
; Copyright (c) 2026 Rocco Corsi

START_GAME:

; Get the number of words
        JSR     COUNT_WORDS
        STB     NUMWORD

; Show Title Screen
        JSR     TITLE_SCREEN

; Show Press Any Key message on screen
        JSR     PRESS_A_KEY

; Wait for keypress and use it as "random" number.
        JSR     WAITKEY
        STB     NUMRAND
        CMPA    #BRKKEY
        BEQ     EXIT_GAME

; Massage the "random" number so is within word list limits
        LDA     NUMRAND
        LDB     NUMWORD
        JSR     MODULO

; Find location of selected word
        JSR     FIND_WORD
        STX     WORDPTR

        JSR     START_ROUND
EXIT_GAME:
        RTS

START_ROUND:
; reset counters
        CLRA
        CLRB
        STA     TOTAL_GUESSES
        STA     WRONG_GUESSES

; show empty hangman
        LDA     #BLKSPC
        JSR     CLRSCRN
        JSR     SHOW_GALLOWS

; show missing letters
        JSR     SHOW_LETTERS

; ask for a guess
!       LDA     TOTAL_GUESSES
        INCA
        CMPA    #MAX_GUESSES
        BEQ     END_ROUND
        STA     TOTAL_GUESSES

        JSR     GUESS_KEY
        JSR     WAITKEY
        BRA     <

; end of the round
END_ROUND:
        RTS

; if guess wrong, add part to HANGMAN
; if too many guess, hangman died
; if correct word guessed, play happy music, and start over
; else go back to "ask for a guess"

SHOW_GALLOWS:
        PSHS   A,B,X,Y

        LDX    #TEXTSTR
        LEAX   24,X
        LDY    #GALLOW_DATA
        PSHS   X

SHOW_GALLOWS_DATA:
        LDA    ,Y+
        CMPA   #$FF     end of a line
        BEQ    >
        CMPA   #$FE     end of the data
        BEQ    SHOW_GALLOWS_END
        ADDA   #$80     get a "graphic" text character
        STA    ,X+
        BRA    SHOW_GALLOWS_DATA
!       PULS   X
        LEAX   32,X
        PSHS   X
        BRA    SHOW_GALLOWS_DATA
SHOW_GALLOWS_END:

!       PULS   X
        PULS   A,B,X,Y
        RTS

SHOW_LETTERS:
        PSHS    A,B,X,Y

        LDB     #EMPTY_CHAR
        LDX     WORDPTR
        LDY     #WORD_POSITION
!       LDA     ,X+
        CMPA    #0
        BEQ     >
; if guess right, show letter
        STB     ,Y
        LEAY    2,Y
        BRA     <

!       PULS    A,B,X,Y
        RTS

PRESS_A_KEY:
        PSHS    X,Y

        LDX     #TEXTEND
        LEAX    -32,X
        LDY     #PRESMSG
        JSR     PRINT

        PULS    X,Y
        RTS

GUESS_KEY:
        PSHS    X,Y

        LDX     #TEXTEND
        LEAX    -32,X
        LDY     #MKGUESS
        JSR     PRINT

        PULS    X,Y
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
MKGUESS FCN     "GUESS A LETTER!"

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

GALLOW_DATA:
        FCB     3,3,3,3,3,3,3,3,0,0,255
        FCB     5,0,0,0,9,0,0,10,0,0,255
        FCB     0,0,0,0,0,9,0,10,0,0,255
        FCB     0,0,0,0,0,0,9,10,0,0,255
        FCB     0,0,0,0,0,0,0,10,0,0,255
        FCB     0,0,0,0,0,0,0,10,0,0,255
        FCB     0,0,0,0,0,0,0,10,0,0,255
        FCB     0,0,0,0,0,0,0,10,0,0,255
        FCB     0,0,0,0,0,0,0,10,0,0,255
        FCB     0,0,0,0,0,0,0,10,0,0,255
        FCB     0,0,0,0,0,0,0,10,0,0,255
        FCB     0,0,0,0,0,0,0,10,0,0,255
        FCB     15,15,15,15,15,15,15,15,0,0,255
        FCB     254


; Number of Words available for the game
NUMWORD FCB     $0
NUMRAND FCB     $0

WORDPTR FDB     $0000

TOTAL_GUESSES:
        FCB     $0
WRONG_GUESSES:
        FCB     $0

LETTER_GUESSES:
        ZMB     12

WORD_POSITION EQU    $5A5
EMPTY_CHAR    EQU    '-'
MAX_GUESSES   EQU    7
