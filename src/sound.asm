; HANGMAN for CoCo
; Copyright (c) 2026 Rocco Corsi

SOUNDON:
        PSHS    A

        ORCC    #$50    Disable interrupts (01010000)

        LDA     $FF23   GET PIA
        ORA     #8      ENABLE 6-BIT SOUND (00001000)
        STA     $FF23

        PULS    A
        RTS

SOUNDOFF:
        PSHS    A

        LDA     #$80
        STA     $FF20

        LDA     $FF23   GET PIA
        ANDA    #$F7    DISABLE 6-BIT SOUND (11110111)
        STA     $FF23

        ANDCC   #$AF    Re-enable interrupts (10101111)

        PULS    A
        RTS

THESOUND1:
        JSR     SOUNDON
        PSHS    B,X

        LDX     #$40
LOOP10
        LDB     #$5F
LOOP11
        PSHS    B
        ANDB    #$FC    top 6-bits = 1111_1100 = $FC
        STB     $FF20
        PULS    B
        NOP
        NOP
        NOP
        INCB
        CMPB    #0
        BNE     LOOP11
        LEAX    -1,X
        CMPX    #0
        BNE     LOOP10

        PULS    B,X
        JSR     SOUNDOFF
        RTS

THESOUND2:
        JSR     SOUNDON
        PSHS    A,B,X,Y

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

SOUNDEND2:
        PULS    A,B,X,Y
        JSR     SOUNDOFF
        RTS

NOTES2  FCB     $37,40,$49,$52,$5B,$64,$6D,$76
        FCB     $76,$6D,$64,$5B,$52,$49,40,$37
        FCB     $00

