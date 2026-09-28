; HANGMAN for CoCo
; by Rocco Corsi

DELAY   PSHS    X
        LDX     CURRDLY
!
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        LEAX    -1,X
        CMPX    #0
        BNE     <

        PULS    X
        RTS

DELYSET STD     CURRDLY
        RTS

DELYGET LDD     CURRDLY
        RTS

; Current Delay value set with default value
CURRDLY FDB     $1000
