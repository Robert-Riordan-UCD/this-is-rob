+++
date = '2025-01-04T21:24:01+11:00'
draft = true
title = 'Arithmetic Logic Unit'
summary = "Add or subtract 2 8-bit numbers."
tags = ["kicad", "ben-eater-cpu", "pcb-design"]
previewImage = "/img/Clock.jpg"
weight=6
+++

TODO: Add GIF

The Arithmetic Logic Unit (ALU) either adds the contents of the A and B registers together or subtracts B from A, based on a control signal. When the result is output to the bus, it also checks if the results is zero or an overflow occurred and saves this in 2 1-bit registers. These are used by the control module to perform conditional logic.

### The errors I made and how I fixed them

1. I forgot to include a flags enable control signal. This is because I used a 2-bit register without an enable input. I used the flags enable signal in place of the clock input. This could potentially lead to stability issues as the flags enable signal now changes at the same time as the subtract signal, as all control signals change on the negative edge of the clock. I haven't noticed any issues so far. I was using only using 3 of the 4 AND gates on the board, so I was able to update design to use the spare gate as a clock gate with the flags enable signal.

The source (with fixes to these issues) is on [Github](https://github.com/Robert-Riordan-UCD/8_Bit_CPU_PCB/tree/main/ALU).

Ben Eaters schematic and videos are [here](https://eater.net/8bit/alu).
