+++
date = '2025-01-04T21:24:01+11:00'
title = 'Bus'
summary = "8-bit bus and control signals connecting all the modules."
tags = ["kicad", "ben-eater-cpu", "pcb-design"]
# previewImage = "/img/8-bit-cpu/bus.jpg"
weight=9
+++

TODO: Add GIF

The bus is the shared data channel that all the modules use. It also routes all the control signals, the clock, the ALU flags, and power. 

### The errors I made and how I fixed them

1. I labeled the bus to the output backwards, so the jumper cable has to rotate when connecting.

The source (with fixes to these issues) is on [Github](https://github.com/Robert-Riordan-UCD/8_Bit_CPU_PCB/tree/main/Output).

Ben Eaters schematic and videos are [here](https://eater.net/8bit/bus).
