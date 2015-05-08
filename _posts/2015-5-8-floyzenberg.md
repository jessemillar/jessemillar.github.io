---
layout: post
title: Floyzenberg
---

[![header](http://www.jessemillar.com/images/posts/floyzenberg/header.png)](http://www.jessemillar.com/floyzenberg/)

I got a Pebble a while back (may Pebble rest in peace and long live Apple Watch) and used a lot of image dithering techniques in the process of developing apps and watch faces for its black and white display. I've always been curious about image manipulation on a pixel-by-pixel basis, and the seeming simplicity of turning an image into a Pebble-worthy creation was intriguing. When I was bored a while back, I cobbled together an HTML5 <canvas> implementation of the [Floyd-Steinberg dithering algorithm](http://en.wikipedia.org/wiki/Floyd%E2%80%93Steinberg_dithering). The result is posted at [on my site](http://www.jessemillar.com/floyzenberg/).

The Floyd-Steinberg algorithm's purpose is to take a full color image and compress it down into less bits. Some versions of the algorithm compress images to three bits of color/data, but I used the version that scales things down to black and white with two bits. There are plenty of methods out there for dithering images, but the Floyd-Steinberg algorith is one of the best because it distributes the "errors" that are inherently involved when compressing data.

Because I'm lazy, give [this](http://www.tannerhelland.com/4660/dithering-eleven-algorithms-source-code/) a read if you'd like more details on how the algorithm works.

Source code is available for hacking on [GitHub](https://github.com/jessemillar/floyzenberg).
