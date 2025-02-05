+++
date = '2025-01-01T16:48:35+11:00'
title = 'This Is Rob'
frontpage = true
summary = "How I made this website."
weight = 4
tags = ["web-dev", "hugo", "github-pages"]
previewImage = "/img/this-is-rob/this-is-rob.png"
status = "Done"
+++

## Getting started

I made this site to keep track of all my projects that I have finished. I wanted a simple website, which required little to no web development skills, but also didn't need to be regularly maintained. I decided to use [Hugo](https://gohugo.io), which would allow me to write the content for the website using markdown that is then compiled into HTML and CSS based on an added theme. I tested a few themes before settling on [Lightbi](https://themes.gohugo.io/themes/lightbi-hugo/), although it didn't fit exactly what I was looking for.

## Woops I've accidently learned HTML and CSS

I wanted to make a few changes to the theme to adapt it more to my liking, but as I made each change I kept going deeper and deeper. I think that at this point I would be capible of creating my own theme from the ground up. I did succesfully mange to avoid Javascript though, only adding one script tag to include the [Masonry](https://masonry.desandro.com/) module.

#### Modifications to the theme

These are the broad strokes of the changes I made to the theme.

1. Post previews render in a nestled grid style instead of a perfectly linear one by using [Masonry](https://masonry.desandro.com/).

2. Only certain posts show up on the home page, instead of all posts.

3. Added backward navigation to the nave bar to return to parent posts.

4. General modification of the style of the post preview cards.

## Hosting

I'm hosting the site on GitHub Pages, mostly because it means I don't have to think about hosting, the site simplely builds and deploys every time I push an update to the content. Also it's free which is a big plus.

## Future of the site

The site is pretty much looking how I want it now and will likely only make incremental cahnges to the theme from now on. The other main changes I will make will be to update the content I added while I was building it, add more content, and potentially get a custom domain.
