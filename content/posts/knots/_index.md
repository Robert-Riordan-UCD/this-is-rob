+++
date = '2025-09-25T15:51:59+02:00'
draft = false
title = 'Knots'

summary = "Simple strategy game made for Godot Wild Jam 85"
tags = ["game-dev", "godot", "game-jam"]
previewImage = "/img/knots/banner.png"
frontpage = true
status = "Done"
weight = 3
+++

![Knots logo](/img/knots/large_banner.png)

Knots is a strategy game made for the [Godot Wild Jam 85](https://itch.io/jam/godot-wild-jam-85).

You can play Knots on [Itch](https://thisisrob.itch.io/knots) or check out the source on [GitHub](https://github.com/Robert-Riordan-UCD/godot-wild-jam-87).

The theme for the game was expansion. The game is based around creating the largest celtic knot by expanding across the board and preventing your opponent from doing the same. I was inspired to create something similar to the PCB board game made by *The Byte Sized Engineer* in [this](https://www.youtube.com/watch?v=Ww2G305H_oY) video.

# Building The Game

The jam was 9 days including 2 weekends so I decided to take it slow and steady. I started by 3D printing a set of tiles to play around with, to see if the idea held any merit. These quickly became a useful tool for testing ideas and debugging throughout the jam, but also a very easy distraction to pick up.

![3D printed prototype](/img/knots/3d-print.jpg)

Once I was happy there was something to the idea, I began by making SVGs for each of the tiles and setting up a tile map to place them in the game. The player could freely pick, rotate, and place the tiles anywhere they liked, so the creative mode was effectively feature complete at this point.

I moved on to rules to restrict placement. I added the the following rules, which could be enabled or disabled for different game modes.

- Deleting placed tiles
- Replacing placed tiles
- Must neighbour a tile
- Must neighbour your own tile
- Must not connect an open and a closed edge
- Must create a link with any tile
- Must create a link with your own tile

In creative mode all of these are in their unrestricted mode, and conversely for competitive mode.

Next, I began working on multiplayer. The first step in this was decoupling the player input logic from the rest of the game play by moving it into it's own player controller script.  I could then create a CPU controller that could use the same interface as the player controller. The CPU simply gets all the locations next to it's own tiles and randomly tries to place tiles in them, until one succeeds or it hit a maximum number of attempts and passes. I would have like to build something more complex (like a min-max search), but decided that I could easily lose a lot of time to this and random would be good enough for a game jam.

With all the major systems in place, I added a build system to quickly export the game and upload it to Itch to test it would work online. It's the same system I used for Notepad Ace and is based on [this post](https://mreliptik.dev/godot-auto-export/) by [MrElipteach](https://www.youtube.com/@mrelipteach/featured).

Over the next 2 days, I tried to implement a scoring system which would traverse each rope in the knot and award points to the player with the most control of that rope. Unfortunately I was struggling to get this working and decided to abandon it with 1 day to go, in favour of bug fixing and general polish and quality of life updates. So scoring was instead based simply on the number of tiles each player had placed.

The beautiful background art was made by Emma, and I added some background music and sound effects  I found online.

# Post Jam updates

I made a few updates after the jam ended, including animating the movement of the tiles, changing the music, adding a tutorial, and general bug fixes. But the biggest and hardest update was adding the scoring system. This would have been made a lot easier if the information about the tile connections was stored in a convenient manner, but instead I was trying to decode tile rotations and identify connected edges from the tile map. I knew when I started this was going to be an issue and I should have used something like the Model View Controller pattern to separate the information from the implementation. I decided not to because it was a game jam and it came back to bite me. 

# Game Demo

### Competitive

In competitive mode, up to 4 players or CPUs battle for control of the board. Tiles must be places in a way that link to one of your own tiles and does not create any invalid links.

{{<video src="4-cpus" loop="true" autoplay="true" muted="true" width="80%">}}

### Scoring

At the end of the game, each rope gets scored. Each player gets 1 point for each segment they placed in the rope. If one player has more segments than all other players, they also get points for the other players segments. And if a rope forms a closed loop all players get double points for that rope.

{{<video src="score" loop="true" autoplay="true" muted="true" width="80%">}}

### Creative

Creative mode gives the player complete freedom to place any tile anywhere they like on the board.

{{<video src="creative" loop="true" autoplay="true" muted="true" width="80%">}}
