---
layout: post
title:  "Cloud WSJT-X"
date:   2021-11-23
---
![Screenshot of CloudWsjtx](/assets/2021-11-23-CloudWsjtx.png)

A couple of weeks ago, I was approached by Pearce N2LW with an interesting project idea. I don't
want to spoil the entire idea, but the basic premise is to be able to "play" WSJT-X from anywhere.
With Forester and `kel-agent`, I have a good tech foundation to make that a reality, and Pearce's
background also lends itself to the project, so we've been working together.

The first phase of the project needs a basic WSJT-X GUI in a web app so we can see what all WSJT-X's
UDP interface can and cannot provide, which led to the screenshot above. It's surprising useful for
making FT-8 QSOs, but there are also some pretty wide gaps in functionality that make it hard to
replicate the full WSJT-X experience. The biggest information gap is the band graph showing the
waterfall of activity. Since that information isn't available over the UDP interface, we'll have a
hard time showing the user where they can safely transmit without stepping on another station (or
being stepped on). Still, it gives us a good base to work from.
