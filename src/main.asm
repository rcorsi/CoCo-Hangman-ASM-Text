; HANGMAN for CoCo
; by Rocco Corsi

        ORG     $4000

main:

        * JSR     SOUNDON
        * JSR     THESOUND2
        * JSR     SOUNDOFF
        JSR     TITLSCR
        RTS


        INCLUDE hangman.asm

        INCLUDE screen.asm

        INCLUDE sound.asm

        INCLUDE title.asm

        INCLUDE utils.asm

        END     main

