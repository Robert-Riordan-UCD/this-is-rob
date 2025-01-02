+++
date = '2024-11-08T17:06:00+11:00'
title = 'Clock'
summary = "Clock module with variable frequency and manual mode."
tags = ["kicad", "ben-eater-cpu", "pcb-design"]
previewImage = "/img/Clock.jpg"
weight=1
frontpage = false
+++

![Clock GIF](/gif/clock.gif)

The clock can run in continuous mode or manual mode. In continuous mode the clock frequency can be varied using the potentiometer. It can also be halted using an external halt signal.

### The errors I made and how I fixed them

1. I connected the manual pulse button incorrectly in the schematic, causing the button to always be connected. I was able to fix this on the PCB by rotating the button 90&deg;.

2. I didn't realise the pins on the switch were larger than most other pins so it didn't fit through the board. I soldered some wires to the pins through on the switch through the holes to fix it.

3. I connected the pull up resistor on button the wrong pin on the 555 IC, causing the manual pulse to never work. I had to break the trace on the PCB and connect a new wire to the resistor to fix it.

The source (with fixes to these issues) is on [Github](https://github.com/Robert-Riordan-UCD/8_Bit_CPU_PCB/tree/main/ClockModule).

Ben Eaters schematic and videos are [here](https://eater.net/8bit/clock).
