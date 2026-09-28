; HANGMAN for CoCo
; by Rocco Corsi

START_GAME:
        JSR     TITLSCR

        LDX     #TEXTEND
        LEAX    -32,X
        LDY     #PRESKEY
        JSR     PRINT

END_GAME:
        BRA     END_GAME

        RTS

PRESKEY FCN     "PRESS ANY KEY"

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
        FCN     "ZEBRA"
        FCB     $00


