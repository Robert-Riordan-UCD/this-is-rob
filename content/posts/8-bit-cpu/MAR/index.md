+++
date = '2025-01-04T21:24:01+11:00'
title = 'Memory Address Register'
summary = "4-bit register, controlling access to RAM"
tags = ["kicad", "ben-eater-cpu", "pcb-design"]
previewImage = "/img/8-bit-cpu/MAR.jpg"
weight=3
+++

{{<video src="mar" loop="true" autoplay="true" muted="true">}}

The Memory Address Register (MAR) is a 4-bit register, which is used to select a location in RAM when accessing data or storing. The MAR can run in regular or programming mode. In regular mode, the register is updated from the bus if an enable signal is asserted when the clock signal goes high. Switching to programming mode allows the user to manually set the address so RAM can be programmed by hand.

In the video above, the MAR is repeatedly accessing the addresses 1, 14, 2, and 3, respectively. This is because the program is looping through instructions 1 to 3 and instruction 1 loads a value from address 14.

### The errors I made and how I fixed them

1. The footprint for the 2 to 1 selector on the suppliers website was incorrect. The input order for bit 3 and bit 4 were swapped. i.e. If the bus had `abcd` and the program switches had `wxyz`, in regular mode the register would store `abyz` and in program mode `wxcd`. This was a nightmare to debug because the MAR was functionally working but I was getting nonsense data. I had to break the traces to bits 3 and 4 and connect a new wires to fix it. I should have double checked the datasheet.

2. The silkscreen for bus is inverted. I updated it on the PCB.

3. The mode switch is labeled backwards. I swapped the labels on the PCB.

The source (with fixes to these issues) is on [Github](https://github.com/Robert-Riordan-UCD/8_Bit_CPU_PCB/tree/main/MemoryAccessRegister).

Ben Eaters schematic and videos are [here](https://eater.net/8bit/ram).
