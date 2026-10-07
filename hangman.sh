#!/bin/bash -e

lwasm -9 -b -o hangman.bin src/main.asm --list=hangman.lst

decb dskini hangman.dsk
decb copy -2 hangman.bin hangman.dsk,HANGMANT.BIN

xroar -load-fd0 hangman.dsk -type 'LOADM"HANGMANT.BIN\rEXEC'
