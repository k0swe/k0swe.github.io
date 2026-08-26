---
layout: post
title: "MagTag Sketch for Satellite Passes"
date: 2026-08-26
---

This is too cool not to share!

At this past weekend's [RMHAM](https://www.rmham.org/) Summer Swapfest, I acquired a couple of e-ink
display gadgets with ESP32 microcontrollers without knowing exactly what they were. I figured that,
at worst, they would be cheap Chinese Arduino-compatible devices that would be clunky but possible
to program. Once I got them home and was able to research them properly, I discovered they were
[Adafruit MagTags](https://www.adafruit.com/product/4800)!

Being Adafruit products running CircuitPython, these boards came batteries included (literally, but
also figuratively) with great documentation and support! It was quick and easy to get them loaded
with the baseline bootloader and CircuitPython firmware, and then start experimenting with test
sketches that ping Google and the like.

With a baseline established, I went searching and found the excellent
[N2YO.com API](https://www.n2yo.com/api/) for AMSAT and other orbital objects. The great thing about
it is that, in addition to providing fresh, raw
[TLEs](https://en.wikipedia.org/wiki/Two-line_element_set), it can also provide pre-crunched pass
information given the observer's location. This is huge because it means I don't have to do orbital
math on a puny microcontroller! I can query each satellite I'm interested in, sort them all by the
Acquisition of Signal (AOS) time, and throw them on the display.

![Basic MagTag display](/assets/2026-08-26-magtag-basic.jpg)

I started out simple, having the device wake up once an hour and update the display. Once that was
working, I got a bit fancier and started highlighting current passes and graying out recent passes
closer to real time. This required caching my N2YO queries because I was using up my API quota. As
it turns out, when you're querying six satellites on every run and making code changes that cause
the program to run every few minutes, it's rather easy to blow through 100 queries in an hour and
get rate-limited! I also added a low battery mode to make the display show when the gadget needs to
be recharged instead of just displaying stale data forever.

![Active MagTag display](/assets/2026-08-26-magtag-active.jpg)
![Recent MagTag display](/assets/2026-08-26-magtag-recent.jpg)

Overall, I'm quite happy with this very functional new gadget I have to keep me aware of AMSAT
opportunities. Check out the
[MagTag Sketch for Satellite Passes](https://github.com/xylo04/magtag/tree/main/sat-passes).
