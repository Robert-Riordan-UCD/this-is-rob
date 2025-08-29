+++
date = '2025-01-04T21:24:01+11:00'
title = 'Registers'
summary = "3 8-bit registers, for storing, moving, and operating on data"
tags = ["kicad", "ben-eater-cpu", "pcb-design"]
previewImage = "/img/8-bit-cpu/registers.jpg"
weight=4
+++


{{<video src="a_register" loop="true" autoplay="true" muted="true">}}

There are 3 8-bit registers in the CPU; A, B, and instruction. The A and instruction registers can read and write data to the bus. The B register can only read from the bus. The data in the A and B registers are read by the ALU and used to perform calculations. The data in the instruction register is used by the control module.

In the video above the A register is being loaded with the output of the ALU, which is adding 3 to it's value. It then outputs the value to the to the bus to display.

{{<video src="instruction_register" loop="true" autoplay="true" muted="true">}}

The 4 MSBs of the instruction register contain the instruction and can be seen in the blue LEDs above. The remaining 4 bits are the data that can be included with the instruction such as an address.

All 3 register use the same design. The registers can access the bus and control signals on either the left or right-hand side of the PCB. Similarly the data in the register can be read by the ALU or control modules using either the top or the bottom of the PCB.

### The errors I made and how I fixed them

1. The B registers write enable pin is not connected to the bus, as it should never write to the bus. However, this left the pin floating and the B register always writing to the bus. Adding a pulling register to the B register fixed this. I also added a pulling resistor to the PCB design.

The source (with fixes to these issues) is on [Github](https://github.com/Robert-Riordan-UCD/8_Bit_CPU_PCB/tree/main/Registers).

Ben Eaters schematic and videos are [here](https://eater.net/8bit/registers).
