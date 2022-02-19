---
layout: post
title: "Winlink in a Box"
date: 2022-01-17
---

![ARES Pod](/assets/2022-01-15-ARES-pod.jpg)

Saturday was the [NCARC](http://ncarc.net/) Winter Hamfest up in Loveland, Colorado, and the first
in-person hamfest locally in a good long while. Even with masking and whatnot, it was wonderful to
be back in person to see folks. I spent most of my time at talks. I got a proper introduction to
amateur television from Jim KH6HTV, and that looks like something I'll have to play with soon! I
also really enjoyed an EmComm talk from Jim AD0ZM, and was particularly interested in the
communications pod he had on display. Sure, I've seen pods like it before, but I was reminded that
one of the really nice points about them is that it simplifies setup onsite.

Seeing Jim's EmComm talk got me back in the thought process of working on Pat integration with VARA.
Pat is sorely lacking VARA support which limits its utility to EmComm folks, and the project has
been languishing. Seeing the pod got me thinking about the reasons I've been dragging my feet with
the VARA integration. One of my biggest excuses (for excuse it is) is that setting up both the RMS
station to test against as well as the client station is a lot of toil. It's not that hard, but it
takes a lot of connecting wires, booting programs and tuning gain levels before I can even start
making any headway. And because I don't have a lot of space, I inevitably have to take the whole
thing apart within a day or two.

So my next (hopefully quick) project to springboard me back into Pat+VARA is going to be **Winlink
in a Box**. I want to take an HT, a soundcard interface and a Raspberry Pi and semi-permanently fix
them in an ammo can. The can should have a power plug on one end, an antenna port on the other, and
it should just work when I power it on. Seal it up so I don't have to touch the gain knobs, set all
of the software programs to start on boot, and go from zero to working Winlink RMS on VHF VARA FM
within about 60 seconds. All of my work on [PiPat](https://k0swe.radio/pipat) a few years ago will
help, although I'll no longer be relying on the TNC-Pi. The TNC-Pi only works for AX.25, and for my
purpose I need VARA FM.
