+++
date = '2025-01-04T21:24:01+11:00'
draft = true
title = 'Output'
summary = "A 7-segment display."
tags = ["kicad", "ben-eater-cpu", "pcb-design"]
previewImage = "/img/8-bit-cpu/output.jpg"
weight=8
+++

TODO: Add GIF

The output is an 8-bit register, linked to a 7-segment display. An EEPROM converts the binary number in the register to the 7-segment signals. There is a counter used to rapidly select between each of the 4 digits to, displaying them 1 at a time faster than a human can see. A 2's complement input can be set to display negative numbers, although there are not enough control signals to use it currently.

### The errors I made and how I fixed them

1. I tied the one-hot counter enable high instead of low, leaving it always disabled and no output displayed. The pin was connected to a copper pour so I had to break the pin off the IC and solder and new wire in place to connect it to ground.

2. The 2's complement signal is unused and floating so the output was flickering. I added a pulling reistor to keep it in the unsigned state.

The source (with fixes to these issues) is on [Github](https://github.com/Robert-Riordan-UCD/8_Bit_CPU_PCB/tree/main/Output).

Ben Eaters schematic and videos are [here](https://eater.net/8bit/output).
