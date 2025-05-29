+++
date = '2024-12-17T13:08:31+11:00'
title = '8-Bit CPU'
summary = "An 8-bit CPU based on the SAP-1 architecture and Ben Eater's breadboard computer"
categories = ["Electronics", "PCB"]
tags = ["kicad", "ben-eater-cpu", "pcb-design"]
previewImage = "/img/8-bit-cpu/8-bit-cpu.jpg"
frontpage = true
weight = 1
status = "Work in progress"
+++

{{<video src="cpu_running" loop="true" autoplay="true" muted="true">}}

This is a PCB version of [Ben Eater's 8-bit breadboard computer](https://eater.net/8bit). It's based on the 'Simple As Possible' architecture, with modifications made to make the computer turing complete. My main goal building this was to learn the in's and out's of PCB design, but I also learned a whole lot about computer architecture in the process.

The computer is made up of 10 modules and an 8-bit bus.

In the video, the CPU is running a program which increments a counter by 3 and displays it on the output.

I sourced all of the components using Ben Eaters BOM. Not all components were still in stock or even in production anymore, but I match each component as closely as possible. In some cases, I modified the design slightly to accommodate a different component, but each module functions in the same way as Ben Eater computer.