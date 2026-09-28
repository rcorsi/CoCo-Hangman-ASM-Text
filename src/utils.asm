; HANGMAN for CoCo
; by Rocco Corsi

DELAY   PSHS    X
        LDX     #$1000
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

