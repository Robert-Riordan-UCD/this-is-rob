+++
date = '2024-12-17T11:24:17+11:00'
title = 'Program Counter'
summary = "4-bit program counter with set, reset, output, and count control signals"
previewImage = "/img/8-bit-cpu/PC.jpg"
tags = ["kicad", "ben-eater-cpu", "pcb-design"]
weight=2
frontpage = false
+++

{{<video src="program-counter" loop="true" autoplay="true" muted="true">}}

The program counter is a 4-bit register used to save to position of the current instruction in RAM while the CPU is performing it. Using the count enable signal increments the position by one, so the next instruction can be preformed. The jump signal can be used to load a value from the bus into the program counter, allowing the CPU to move to a different position in RAM. In the video above the program counter counts t0 4 and then jumps back to 1.

### The errors I made and how I fixed them

1. On it's own, the program counter worked without issue and passed all tests. However, when the it was connected to the completed projected it was there were issues with skipping counts and occasional random resets. These were due to poor solder joints on the count enable and the power pins of the 4-bit counter. Resoldering the pins fixed the issues.

2. I ordered the 74HC163, which is has a synchronous reset, causing the whole CPU to become synchronously reset. I should have order a 74HC161 instead.

The source is on [Github](https://github.com/Robert-Riordan-UCD/8_Bit_CPU_PCB/tree/main/ProgramCounter).

Ben Eaters schematic and videos are [here](https://eater.net/8bit/pc).

