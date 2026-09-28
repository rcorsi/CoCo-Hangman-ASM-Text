; HANGMAN for CoCo
; by Rocco Corsi

        ORG     $4000

main:

        JSR TITLSCR
        RTS


        INCLUDE hangman.asm

        INCLUDE sound.asm

        INCLUDE title.asm

        END     main

