
target remote 127.0.0.1:65520

break *0x4000
break *0x403A

layout asm
layout regs

continue

