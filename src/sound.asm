; HANGMAN for CoCo
; by Rocco Corsi

SOUNDON
        LDA     $FF01   SELECT SOUND OUT
        ANDA    #$F7    RESET MUX BIT
        STA     $FF01

        LDA     $FF03   SELECT SOUND OUT
        ANDA    #$F7    RESET MUX BIT
        STA     $FF03

        LDA     $FF23   GET PIA
        ORA     #8      ENABLE 6-BIT SOUND
        STA     $FF23

        RTS

SOUNDOFF
        CLRA
        STA     $FF23
        STA     $FF21
        STA     $FF20
        RTS

THESOUND1
        LDX     #$FF
LOOP10
        LDB     #$5F
LOOP11
        STB     $FF20
        NOP
        NOP
        NOP
        INCB
        BNE     LOOP11
        LEAX    -1,X
        BNE     LOOP10
        RTS

THESOUND2
        LDY     #NOTES2
LOOP21
        LDX     #$080

        LDB     ,Y+
        CMPB    #0
        BEQ     SOUNDEND2
        TFR     B,A

LOOP22
        STB     $FF20
        NOP
        NOP
        NOP
        INCB
        BNE     LOOP22
        TFR     A,B
        LEAX    -1,X
        BNE     LOOP22

        BRA     LOOP21
SOUNDEND2
        RTS

NOTES2  FCB     $37,40,$49,$52,$5B,$64,$6D,$76
        FCB     $76,$6D,$64,$5B,$52,$49,40,$37
        FCB     $00

