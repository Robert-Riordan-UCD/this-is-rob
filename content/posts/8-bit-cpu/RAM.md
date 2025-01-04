+++
date = '2025-01-04T21:24:01+11:00'
draft = true
title = 'Random Access Memory'
summary = "16 8-bit memory loctions to read and write data to."
tags = ["kicad", "ben-eater-cpu", "pcb-design", "atmega-328"]
previewImage = "/img/Clock.jpg"
weight=4
+++

TODO: Add GIF

The Random Access Memory (RAM) has 16 bytes of memory. The data can be write or read from the bus, and is selected using the [MAR](../mar). If the MAR is in programming mode the RAM can be written to manually using the 8 switches set the data and the push button to write.

The RAM doesn't actually have a RAM chip on it. Instead it has an Atmega328U, which emulates the RAM chip that I should have used. This allowed me to preload the RAM with a program when booting, so I don't have to manually program it each time.

### The errors I made and how I fixed them

1. There was no pulling resistor on the output of the programming button, so once the button had been pressed once the output would stay high and no edge would be detected on future presses. Adding a pulling resistor fixed the issue.

2. I got `Atmega328U`'s instead of `Atmega328-PU`'s. As far as I can tell these are identical in all ways except the ID. However, arduino's run on the `Atmega328-PU` and the arduino IDE doesn't support the `Atmega328U`. To program them using the arduino IDE, I had to rebuild the IDE from source with the ID swapped.

The source (with fixes to these issues) is on [Github](https://github.com/Robert-Riordan-UCD/8_Bit_CPU_PCB/tree/main/RAM).

Ben Eaters schematic and videos are [here](https://eater.net/8bit/ram).
