+++
date = '2025-01-04T20:05:30+11:00'
title = 'Numpad'
summary = "A quick build to experiment before designing the split keyboard"
tags = ["3d-print", "prototype", "pi-pico"]
status = "Done"
previewImage = "/img/Keyboard/numpad/full-build.jpg"
+++

I made a numpad to experiment with the firmware and check I understand the full process for building a keyboard, before committing to the PCB design for the split keyboard. As it is only a prototype, it is rough around the edges (mostly in the case design).

## Physical design

I 3D printed the case. The spacing between keys on the initial print was slightly to tight, but it worked the second time.

![Side profile with keys not fitting well next to each other](/img/Keyboard/numpad/first_print_fit.jpg)

For now the case is just held together by an elastic band because I want to move on the keyboard design.

![Completed build](/img/Keyboard/numpad/full-build.jpg)

## Electronic design

The keys are arranged in a 4x5 matrix, such that each key can be identified by raising the voltage on one column and checking to see if any rows match the raised voltage. A diode it added to each key to prevent current flowing from one row to the next if multiple keys are pressed, causing keys to registered incorrectly.

![Electrical hook up of the back of the keys](/img/Keyboard/numpad/matrix-design.jpg)

## Firmware

I planned on using [KMK](https://github.com/KMKfw/kmk_firmware) firmware on a Pico 2W. KMK is quite easy to get started with, just defining which pins the rows and columns are connected to and function of each key. However, after much debugging I discovered that the rp2350 on the Pico 2 has a [bug](http://www.doctormonk.com/2024/09/are-pico-2-rp2350-gpio-pins-broken.html) preventing the use of the pull down resistors on the GPIO pins. I switched back to an original Pico, as I had one spare and it was the cleanest solution, and suddenly everything worked perfectly. 

## Outcomes

I won't be using a Pico 2W for my keyboard. I have ordered some Seeed Studio XIAO nRF52840s, as they are what are what are used in [this](https://github.com/GEIGEIGEIST/TOTEM) keyboard build and should have a very low power draw if I decide to make the keyboard wireless.

KMK is nice and easy to use. I will give QMK and ZMK a test as well, but I know I shouldn't have major firmware issues on the keyboard now.

I may potentially convert the numpad into a macropad at some point.