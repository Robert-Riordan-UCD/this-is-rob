+++
date = '2025-11-26T10:48:23+01:00'
draft = false
title = 'Dutch Vocab Screen'

summary = "A desk display to help me learn dutch"
tags = ["microcontroller", "raspberry-pi", "wifi", "cad"]
categories = ["Electronics"]
previewImage = "/img/vocab-screen/both.jpg"
frontpage = true
status = "Done"
weight = 3
+++

I wanted a small display to constantly test my vocab as I'm learning dutch. I also figured it would be a good way to learn the basics of how to setup a server. The source code is available [here](https://github.com/Robert-Riordan-UCD/vocab_screen).

# Display

The display is made from 3 main components; an LCD, an ESP32, and 2 buttons. The ESP requests a word from a server and then displays either the dutch or the english on the LCD. I can press the blue button to display the translation, and if I get it right I can then press the green button and the ESP will notify the server which keeps track of the all the successes.

![Display showing dutch and english](/img/vocab-screen/both.jpg)

I also designed the housing. I based it on [this](https://www.printables.com/model/426719-alphanumeric-lcd-16x2-display-stand) model, with the addition of the buttons and a mounting point for a standard 5x7cm perf board. You can find my CAD [here](https://cad.onshape.com/documents/6e1b4ad38081a2428f22711b/w/466b2723d2919377544370e4/e/e612c7284fc94ad013f7c423?renderMode=0&uiState=6929c45a76695c086c871bc2) or get the STLs [here](https://www.printables.com/model/1496773-16x2-lcd-display-case).

# Server

The server is built in python using flask and runs on a raspberry pi on my local network. It has a simple web server to add words and an api for the ESP32.

### Web server

The web server has 2 pages. The first is an entry field to add new words to the database.

![New vocab input page](/img/vocab-screen/input.png)

The second is a table to display the database and a delete buttons to remove entries. It also generates a histogram with the current success status of all the words in the database using matplotlib.

![Database view page](/img/vocab-screen/view.png)

### API

There are 3 API endpoints; random word, success, and delete word.

1. Random word returns a random word from the database with it's translation, in JSON format. Words above a success threshold set in the database are not selected. Currently this is 10 successes. I will probably increase this at some point or make it possible to select these words but with a lower chance than words below the threshold.
2. Success receives a words and updates the success count for that word in the database.
3. Delete removes a word from the database.
