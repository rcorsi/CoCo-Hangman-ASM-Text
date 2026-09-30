; HANGMAN for CoCo
; Copyright (c) 2026 Rocco Corsi

        ORG     $4000

main:

        JSR     START_GAME

; clear the screen and get it back to green background
        JSR     CLRSCRN
        JSR     INVSCRN
        RTS


        INCLUDE hangman.asm

        INCLUDE screen.asm

        INCLUDE sound.asm

        INCLUDE title.asm

        INCLUDE utils.asm

        END     main

