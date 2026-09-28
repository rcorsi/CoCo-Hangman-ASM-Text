; HANGMAN for CoCo
; by Rocco Corsi

        ORG     $4000

main:

        JSR TITLSCR
        RTS


        INCLUDE hangman.asm

        INCLUDE sound.asm

        END     main

