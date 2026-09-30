# CoCo Assembler Hangman - text version

First CoCo 6809 assembler program written in a long while for me. I had attempted this way back in early 80s when I was too young. I had given up as EDTASM+ was a nightmare with crashes, with the long delays in reloading everything. I can't remember if I was saving to cassette or diskette, but either way it would really test someones patience.

Now attempting again many years later with Linux, VSCode, lwasm, xroar, m6809-gdb

## Status

In progress as of 2026/09/29.

## PSEUDO CODE for the game

| Description | Status |
| :- | :-: |
| show title screen | done |
| spin on variable to get "random" value | done |
| pick word from list with "random" value | done |
| clear screen | done |
| show empty HANGMAN gallows | done |
| show missing letters | not done |
| ask for a guess | in progress |
| if guess right, show letters | not done |
| if guess wrong, add part to HANGMAN | not done |
| if too many guess, hangman died | not done |
| if correct word guessed, play happy music, and start over | not done |
| else go back to "ask for a guess" | not done |

