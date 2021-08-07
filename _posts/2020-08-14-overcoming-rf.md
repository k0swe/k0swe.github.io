---
layout: post
title:  "Overcoming RF in the shack, the sneaky way"
date:   2020-08-14
---
![Ham radio connected to a Raspberry Pi computer](https://1.bp.blogspot.com/-F7qBed_m_NY/Xzbv2YXIbVI/AAAAAAABwfQ/VvA96kHPb-AyDWsKX9KBvZCS4k_oiF0NQCLcBGAsYHQ/w263-h263/IMG_20200811_083114.jpg)

Life has conspired to keep me from doing as much with ham radio lately, but I'm happy to report that
I'm at least back on the air. In my last post I described my troubles with RF getting into the shack
which resets my radio-computer CI-V (CAT) control. I posited that finally setting up a first-class
station ground would help, but alas, I haven't gotten that far.

However, I did find a sneaky solution to my problem. The radio was connected to my desktop computer
with USB extension cords which made the entire USB run about 10 ft. I made those runs shorter, not
by moving anything particular, but by adding a Raspberry Pi single-board computer dedicated to
running the radio. This keeps the USB cords a couple of feet long, and so far it has resolved the
interference that was resetting my CAT control. I can run VNC remote desktop from my main computer
for a similar experience to what I was doing before, but I also now have the option to use a laptop
around the house, which is kind of liberating. The biggest downside of running WSJT-X or other modes
from another room is that my Icom 718 doesn't give me accurate power and SWR readings, so I have to
do a little bit of guesstimation from experience with my station.

I initially set up a Raspberry Pi 3 B+ I had on hand, but decoding FT8 was slow. When decodes are
showing up 5 seconds into a 15 second transmit period, it's not effective to respond. Therefore, I
upgraded to an RPi 4 for the first time. I used
[`KM4ACK`'s Build-A-Pi](https://github.com/km4ack/pi-build) script to set up my RPi software. There
are a few things I'd tweak about it, but overall, it's extremely nice to have so much ham software
available and preconfigured.

