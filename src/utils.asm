; HANGMAN for CoCo
; Copyright (c) 2026 Rocco Corsi

; wait for a key press
;   OUT register A has pressed key
;   OUT register B has counter value (simulated random number)
WAITKEY:
        CLRB

!       INCB
        JSR     [POLCAT]    ; Call POLCAT indirectly
        BEQ     <           ; If Z flag is set (A=0), no key pressed, loop again

        RTS

; wait for an upper case letter only
;   OUT register A has pressed key
;   OUT register B has counter value (simulated random number)
WAIT_FOR_LETTER:
!       JSR     WAITKEY
        CMPA    #'A'
        BLO     >
        CMPA    #'Z'
        BHI     >
        RTS
!       JSR     THESOUND1
        BRA     WAIT_FOR_LETTER

; output single char
;   IN register A has char to print out
OUTKEY:
        JSR     [CHROUT]    ; Call CHROUT indirectly for single character

        RTS

; Perform Modulo operation
;   IN/OUT register A contains the number
;   IN register B contains the modulus divisor
MODULO:
        STB     MODDIV
!       CMPA    MODDIV
        BCS     >
        SUBA    MODDIV
        BRA     <
!
        RTS

MODDIV  FCB     $0


; delay loop using default value or value set with DELAY_SET
DELAY:
        PSHS    X
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

DELAY_SET:
        STD     CURRDLY
        RTS

DELAY_GET:
        LDD     CURRDLY
        RTS

; Current Delay value set with default value
CURRDLY FDB     $1000


POLCAT  EQU     $A000       ; ROM indirect vector for polling keyboard
CHROUT  EQU     $A002       ; ROM indirect vector for character out


BRKKEY  EQU     $03
