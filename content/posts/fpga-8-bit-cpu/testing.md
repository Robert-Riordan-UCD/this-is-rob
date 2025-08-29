+++
date = '2025-08-29T14:45:14+01:00'
draft = false
title = 'Verification with PyUVM'

summary = "System verification using PyUVM"
tags = ["FPGA", "UVM", "PyUVM"]
frontpage = false
status = "Done"
+++

I verified each of the modules using [pyuvm](https://github.com/pyuvm/pyuvm). This was my first time getting a complete picture of how UVM works, so I'm going to create this post of how I set everything up and then my understanding of UVM now.

# Verification

## Setup

Install ```pyuvm``` for testing and ```gtkwave``` for viewing waveforms.

I needed to use a python virtual environment to install pyuvm.

~~~
    python3 -m venv env
    source ./env/bin/activate
    pip install pyuvm
    sudo apt install gtkwave
~~~

## Testing

Navigate to the directory of the module you want to test and run make.

~~~
    cd verif/<MODULE>
    make
~~~

To  see the waveforms, run ```make waves```.

# How UVM works

UVM is a standard method for RTL verification. It uses a number of reusable modules make verification faster, easier, and maintainable. These are the main modules.

## Sequence items
Contain a set of inputs for the DUT.

## Sequencer
Schedules the sequence items.

## Driver
Drives the inputs of the DUT, based on sequence items received from the sequencer.

## Monitor
Monitors the DUTs inputs and outputs, and passes them to the scoreboard and coverage.

## Scoreboard
Verifies the current outputs collected by the monitor are correct.

## Coverage
Collects the output from the monitor and makes sure certain conditions are met by the end of testing.

## Environment
Links each of the components together.