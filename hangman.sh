#!/bin/bash -e

lwasm -9 -b -o hangman.bin src/main.asm --list=hangman.lst

xroar -run hangman.bin

