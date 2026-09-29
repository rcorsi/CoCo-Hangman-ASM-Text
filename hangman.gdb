
target remote 127.0.0.1:65520

break *0x4000
break *0x42DD

layout asm
layout regs

continue

