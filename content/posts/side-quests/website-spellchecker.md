+++
date = '2025-02-12T17:18:51+11:00'
draft = false
title = 'Website Spell Checker'

summary = "A shell script to spell check my website"
tags = ["game-dev", "godot", "addons"]
frontpage = false
status = "Done"
+++

This a simple shell script to catch anything I mistype on this site. It's not perfect but it's good enough for now. You can find it [here](https://github.com/Robert-Riordan-UCD/this-is-rob/blob/main/spell-check.sh).

It works in the following steps
1. Extract all the site pages using *lynx*.
2. From the pages, extract and clean the pages to create a list of unique words on the site.
3. Find words in the list that aren't in */usr/share/dict/words*.

I made it in a couple of hours because the spell check in VSCodium keeps failing me. It seems it only warns me if it can find at least one possible solution.

The biggest issue I ran into while writing this was dealing with apostrophes. The apostrophe either in a Hugo generated site or decoded by lynx is a *right single apostrophe* (&#8217;), while my keyboard produces just an *apostrophe* (&#39;). I probably spent an hour trying to figure out why all my test cases were working perfectly, but on the real site they were completely ignored.