+++
date = '2025-01-04T21:24:01+11:00'
title = 'Control'
summary = "The decision center of the CPU"
tags = ["kicad", "ben-eater-cpu", "pcb-design"]
previewImage = "/img/8-bit-cpu/control.jpg"
weight=7
+++

TODO: Add GIF

The control module is where of the logic that determines what each of the other modules should be doing is. There are 6 inputs to the control module; 4-bits from the instruction register, the ALU zero flag, and the ALU carry flag. There is also a counter, which counts from 0 to 5, to create the microcode steps for each instruction. These go into two 8-bit EEPROMs which are used to select which of the 16 output control signals should be asserted.

There is also a reset button, which resets all of the registers and the microcode timer.

The microcode timer is clocked on the negative edge of the clock. This allows all the control signal to change on the negative edge of the clock and settle, before all the registers are updated on the positive edge of the clock.

### The errors I made and how I fixed them

1. The reset and not reset outputs to the bus are wired backwards. I rotated the jumper wires to the bus to fix it and updated the design files too.

The source (with fixes to these issues) is on [Github](https://github.com/Robert-Riordan-UCD/8_Bit_CPU_PCB/tree/main/Control).

Ben Eaters schematic and videos are [here](https://eater.net/8bit/control).
