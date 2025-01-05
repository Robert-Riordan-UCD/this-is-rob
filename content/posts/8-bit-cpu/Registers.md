+++
date = '2025-01-04T21:24:01+11:00'
draft = true
title = 'Registers'
summary = "3 8-bit registers, for storing, moving, and operating on data."
tags = ["kicad", "ben-eater-cpu", "pcb-design"]
previewImage = "/img/8-bit-cpu/registers.jpg"
weight=4
+++

TODO: Add GIF

There are 3 8-bit registers in the CPU; A, B, and instruction. The A and instruction registers can read and write data to the bus. The B register can only read from the bus. The data in the A and B registers are read by the ALU and used to perform calculations. The data in the instruction register is used by the control module.

All 3 register use the design. The registers can access the bus and control signals on either the left or righthand side of the PCB. Similarly the data in the register can be read by the ALU or control modules using either the top or the bottom of the PCB.

### The errors I made and how I fixed them

1. The B registers write enable pin is not connected to the bus, as it should never write to the bus. However, this left the pin floating and the B register always writing to the bus. Adding a pulling registor to the B register fixed this. I also added a pulling resistor to the PCB design.

The source (with fixes to these issues) is on [Github](https://github.com/Robert-Riordan-UCD/8_Bit_CPU_PCB/tree/main/Registers).

Ben Eaters schematic and videos are [here](https://eater.net/8bit/registers).
