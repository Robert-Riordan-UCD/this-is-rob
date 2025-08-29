+++
date = '2025-07-02T14:45:14+01:00'
draft = false
title = 'Build System'

summary = "An open source build system for the Tang Nano"
tags = ["FPGA"]
frontpage = false
status = "Done"
+++

This is how I setup and run the builds on the Tang Nano. It mostly follows [this](https://www.geeklan.co.uk/?p=2919) guide.

# Setup

The following programs are required:
1. ```yosys``` for synthesis.
2. ```nextpnr``` for place and route, and bitstream generation.
3. ```openFPGALoader``` for loading the bitstream.

```sudo apt install yosys nextpnr-gowin openfpgaloader```

# Running

Each step is covered in the `Makefile` and can all be run in one pass with this command.
```make all upload```

## Step by step

1. Synthesis
    
    System verilog files are parsed and converted into a netlist.

    WAIT_TIME sets the clock speed and DISPLAY_WAIT_TIME set the display refresh speed, by setting how many cycles to wait before toggling the clock or updating the display respectively.

    ```yosys -p "read_verilog -D WAIT_TIME=300000 -D DISPLAY_WAIT_TIME=10000 -sv fpga_interface.sv; synth_gowin -json ./build/synth.json"```

2. Place and Route 

    The netlist is connected to the constraints file (linking the IO) and mapped to the logic on the FPGA.
    
    ```nextpnr-gowin --json ./build/synth.json --write ./build/pnr.json --device GW1NR-LV9QN88PC6/I5 --family GW1N-9C --cst tangnano9k.cst```

3. Bitstream generation

    The output of Place and Route is converted to a bitstream that the FPGA can interpret.

    ```gowin_pack -d GW1N-9C -o ./build/bitstream.fs ./build/pnr.json```

4. Upload to FPGA

    The bitstream is is loaded on the FPGA.

    ```openFPGALoader -b tangnano9k ./build/bitstream.fs```

## Uploading remotely

My laptop is unable to find the FPGA as a USB device, so I am running it through a Raspberry Pi instead. I copy the file to the Pi and the run make, which runs the upload command above. I use ```make push-to-pi``` instead of ```make upload``` to upload remotely.

```scp ./build/bitstream.fs ${PI_USERNAME}@${PI_IP_ADDRESS}:${PI_DIR}/bitstream.fs```

```echo cd ${PI_DIR}; echo make | ssh ${PI_USERNAME}@${PI_IP_ADDRESS}```