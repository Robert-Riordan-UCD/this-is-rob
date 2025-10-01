+++
date = '2025-09-24T14:45:14+01:00'
draft = false
title = 'Demos'

summary = "Example and explanation's of 3 programs running"
tags = ["fpga"]
frontpage = false
status = "Done"
previewImage = "/img/8-bit-fpga/8-bit-fpga.jpg"
+++

### Increment

```
    0: ADD  F   (00101111)
    1: OUT      (11100000)
    2: JUMP 0   (01100000)
    ...
    F: (DATA) 1 (00000001)
```

This is a very simple program to count up in 1's. `ADD` loads the data at address `F` into the B register, adds it to the value in the A register, and stores the result in the A register. Then the value in the A register is output and the program jumps back to the beginning.

{{<video src="inc" loop="true" autoplay="true" muted="true">}}

### Fibonacci

```
    0: ADD     F (00101111)
    1: JUMP_C  9 (01111001)
    2: OUT       (11100000)
    3: STORE_A D (01001101)
    4: LOAD_A  E (00011110)
    5: STORE_A F (01001111)
    6: LOAD_A  D (00011101)
    7: STORE_A E (01001110)
    8: JUMP    0 (01100000)
    9: HALT      (11110000)
    ...
    E: (DATA)  1 (00000001)
    F: (DATA)  0 (00000000)
```

This program calculates the Fibonacci sequence until it requires more than 8 bits. It adds the value at address `F` to the A register. If the addition overflows it jumps to address `9` and halts. Otherwise, it moves some data around to save the current value in `E` and the previous value in `F`. Then is jumps back to address `0` and repeats.

{{<video src="fib" loop="true" autoplay="true" muted="true">}}

### Multiply 6 by 11 (0x6 x 0xB)
```
    0: LOAD_A  F (00011111)
    1: STORE_A D (01001101)
    2: LOAD_A  D (00011101)
    3: OUT       (11100000)
    4: ADD     F (00101111)
    5: STORE_A D (01001101)
    6: LOAD_A  E (00011110)
    7: SUB     C (00111100)
    8: JUMP_Z  B (10001100)
    9: STORE_A E (01001110)
    A: JUMP    2 (01100010)
    B: HALT      (11110000)
    C: (DATA)  1 (00000001)
    D: (DATA)  0 (00000000)
    E: (DATA)  B (00001100)
    F: (DATA)  6 (00000110)
```

This program multiplies the 2 numbers stored in `E` and `F`. It works by repeatedly adding the value at address `F` to itself, while subtracting 1 from the value at address `E`. When the subtraction results in a 0 the program halts.

{{<video src="mult" loop="true" autoplay="true" muted="true">}}

### Manual programming

This video shows the CPU being manually programmed. It is initially running the increment program above. After programming, the value at address `F` is updated to 5. So the new program counts in 5's instead of 1's.

{{<video src="program" loop="true" autoplay="true" muted="true">}}

*Unmute this video to hear the satisfying THUNKs of the switches.*

### Bootloading

In this video the CPU is initially running the increment program. After resetting it has switched to the Fibonacci counting program.

{{<video src="boot" loop="true" autoplay="true" muted="true">}}
