+++
date = '2025-01-04T20:05:30+11:00'
title = 'Numpad'
summary = "A quick build to experiment before designing the split keyboard"
tags = ["3d-print", "prototype", "pi-pico"]
+++

I made a numpad experiment with the firmware and check I understand the full process before committing to the PCB design for the keyboard.

## Physical design

I 3D printed the case. The spacing between keys on the initial print was slightly to tight, but it worked the second time.

![Side profile with keys not fitting well next to each other](/img/Keyboard/numpad/first_print_fit.jpg)

TODO: Print keycaps

## Electronic design

The keys are arranged in a 4x5 matrix, such that each key can be identifided by raising the voltage on one column and checking to see if any rows match the raised voltage. A diode it added to each key to prevent current flowing from one row to the next if multiple keys are pressed, causing keys to registered incorrectly.

![Electrical hook up of the back of the keys](/img/Keyboard/numpad/matrix-design.jpg)

## Firmware

I'm using [KMK](https://github.com/KMKfw/kmk_firmware) firmware on a Pico 2 W. It's a CircuitPython based keyboard firnware. Unfortunately, circuit python does not support bluetooth, as I'm writing this, and is not on Adafruits road map of feature they plan on adding. KMK is quite easy to get started with, by just defining the rows, columns, and function of each key.

I made a quick attempt at using [QMK](https://docs.qmk.fm/), but it doesn't support the RP2350 so I stuck with KMK.

TODO: Custom firmware

TODO: Bluetooth

## Outcomes

If i decide to make a wireless keyboard, I don't think I should use the Pico 2 W. Bluetooth was only recently enabled in the Pico W and the Pico W 2 was released 6 months ago, so support online is sparse. Using an ESP32 based board would be much easier. However, the Pico is perfectly fine for a wired keyboard.

I will potentially convert the numpad into a macropad once I have built the keyboard.