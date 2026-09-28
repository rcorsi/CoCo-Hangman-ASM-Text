; HANGMAN for CoCo
; by Rocco Corsi

; wait for a key press
;   register A has pressed key
;   register B has counter value (simulated random number)
WAITKEY:
        CLRB

!       INCB
        JSR     [POLCAT]    ; Call POLCAT indirectly
        BEQ     <           ; If Z flag is set (A=0), no key pressed, loop again

        RTS

; output single char held in register A
OUTKEY  JSR     [CHROUT]    ; Call CHROUT indirectly for single character

        RTS


; Perform Modulo operation
;   register A contains the input and output number
;   register B contains the modules
MODULO  STA     MODRES
!       CMPB    MODRES
        BGE     >
        SUBB    MODRES
        BRA     <
!       RTS

MODMEM  FCB     $0
MODRES  FCB     $0

; delay loop
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


POLCAT  EQU     $A000       ; ROM indirect vector for polling keyboard
CHROUT  EQU     $A002       ; ROM indirect vector for character out


BRKKEY  EQU     $03
