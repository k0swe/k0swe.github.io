---
layout: post
title:  "Mountaineer works! Sort of"
date:   2021-05-26
---
![USB hub on breadboard](https://1.bp.blogspot.com/-vZv1Aw_HLk8/YQarSaAP4iI/AAAAAAAB3hY/nXJIFWxCmPY_74FXMbobaESXGcER9AB8wCPcBGAsYHg/s320/PXL_20210525_141004702.jpg)

After reworking my radio interface board, I eagerly sent it off to JLCPCB for a small batch. I got
them back on May 14th, but for the past two weeks or so they've been haunting me. When I plugged
them into the computer, the USB hub would enumerate and show up in the operating system, but the
serial and audio chips would not! It was infuriating! I had to go back to breadboard prototypes to
figure out the issue.

It turns out, a component swap I had made was my problem. I had built my separated USB hub prototype
with a TI TPS2044D power management chip, but then decided on the full radio interface I
could get away with the smaller and cheaper TPS2041. Unfortunately, I assumed that I could just
connect it to one of the hub's overcurrent/enable pairs. After much banging my head against the
table, I've found that all the overcurrent pins and enable pins need to be tied together. Rookie
mistake!

![PCB project with ugly soldering](https://1.bp.blogspot.com/-bLooF_mi4WY/YQasXtdEHyI/AAAAAAAB3ho/-CYL7KLxbDE8tBEBrNzWitu8cB7bhVxeQCPcBGAsYHg/s320/PXL_20210525_165745353.jpg)

Testing that with some ugly soldering on the real PCB confirms it. I need a new batch of boards to
fix this properly. But now I know!
