---
layout: post
title:  "More Raspberry Pi Time"
date:   2019-10-17
---
![GPS satellite](/assets/gps-satellite.jpg)

I've updated
[PiPat](https://docs.google.com/document/d/1dJY5iXwyYGQgYm9Cp68SarbZO_Nobx-BP2fhIsRSx08/preview)
with new instructions for getting time from GPS. I had wanted to rely mainly on an RTC module, but
it doesn't fit in my existing 3D-printed case, so I would need to modify the case to be about 5mm
taller and print a new copy. That's honestly just too much work. I'm already using a GPS module and
figured there must be a way to get time from `gpsd`, so I dug deeper.

Back in August I found references to feeding `ntpd` from `gpsd` which assumed you wanted your very
own stratum 1 time-server, which was overly complicated and overly precise for my purposes. This
time my research uncovered that Raspberry Pi has moved from `ntpd` to `timedatectl` and `chrony`,
which makes lots of older advice obsolete. This is actually OK, because feeding `chrony` from `gpsd`
is more straightforward.

The result is that when I have the GPS unit plugged into my Raspberry Pi Pat rig, I get good time
even in the field!
