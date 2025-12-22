+++
date = '2025-01-01T21:59:15+11:00'
title = 'Notepad Ace'
frontpage = true
summary = "Speedrunning game made for GitHub Game Off 2024"
tags = ["game-dev", "godot", "game-jam"]
categories = ["Game-Development"]
previewImage = "/img/notepad-ace/notepad-ace.png"
weight = 3
status = "Done"
+++

![Notepad Ace GIF](/gif/notepad-ace.gif)

*Notepad Ace* is a 2D speedrunning platformer, that I made over the course of a month for [GitHub Game Off 2024](https://itch.io/jam/game-off-2024).

You can play *Notepad Ace* [here](https://thisisrob.itch.io/notepad-ace) or checkout the source [here](https://github.com/Robert-Riordan-UCD/GitHubGameOff2024).

My goal with this project was to go through the complete game development cycle within a deadline. That included coming up with an idea, prototyping, building the complete game, testing and bug fixing, and publishing the game.

## The Idea

The theme of the game jam was *secrets*, so I based my game around hidden mechanics which could be used to access short cuts to get faster times. This was mostly inspired by *Tunic*; a game where you discover how to use abilities that you have always had through various clues in the game.  

#### The Secrets

The game can be beaten without using any of the secret mechanics. However, there are 3 secret mechanics; wall jump, dash, and invert, each of which can be used to access a new shortcut and improve your time.

1. Wall jumping requires you to hold the **L** key.
2. Inverting requires double tapping the **I** key.
3. Dashing requires pressing both **J** and **K** simultaneously.

{{<video src="secrets" loop="true" autoplay="true" muted="true">}}

To make sure that players didn't discover the secrets by randomly hitting buttons, I had to make them unintuitive while still remaining reasonably ergonomic.

The controls for each mechanic are hidden in the background art around the stage. I tried to make them obvious given that this was a game jam and I can only expect a player to spend 2 or 3 minutes with my game before moving on.

## Building the game

I used the [Godot](https://godotengine.org/) game engine to build the game and [Silent Wolf](https://silentwolf.com/) to host the leaderboard. Everything else I made during the jam. I didn't want to be responsible for maintaining a server for a quick project over the long term, which is why I used Silent Wolf to host the leaderboard. It's a free service so I don't expect it to last forever, but it's already more reliable than if I had setup the server myself during the jam.

## Testing, Polishing, and Bug Fixing

Most of my time throughout the game jam was spend trying to get the player movement feeling as smooth and responsive as possible. This mostly meant adding features such as coyote time and jump buffers to each of the mechanics and tweaking their values to the best of my ability.

## Publishing

The game had to be published on [Itch.io](https://itch.io) for the jam. I set up a page early in the month to run though Godots export process. During the process of prototyping the leaderboard, I tried to integrate the player's Itch usernames into the leaderboard. While this wasn't successful, I had to play with Itch's API's and realised that it was possible to upload games through it. So I wrote a simple script to export a build of the game and upload it to Itch. This allowed be to regularly test the web build and easily get friends to play test the game.
