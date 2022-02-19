---
layout: post
title: "Data Interface Thingy Progress, and Dirty 30 Build Day"
date: 2021-04-11
---

![QFP microchip through a microscope](/assets/2021-04-06-qfp.jpg)

I haven't been on the air very much over the last month or so. I've been focused on continuing with
my [custom radio interface](https://github.com/k0swe/tx500-data-interface) PCB project. It's
proceeding well and I gathered a lot of good advice, but I also realized that there are plenty of
unknowns working with new integrated circuits. Do I pull this mode pin high or low? Does the power
input need to be buffered with capacitors or can I get away without that?

Because of all these unknowns, I decided to take one step back and try to create my own evaluation
boards for each of the three major components: a USB hub, a USB sound card, and a USB to serial
converter. That's essentially what I already have with my consumer devices, but now I'll try to
build my own versions of these from application notes and validate each of them individually. That
also relieves pressure to get it right the first time in the final form factor that I want; the
evaluation boards are not going to be used in the field, so there's no need to shrink them to fit in
an enclosure, and I can expose whatever jumpers or test points that I feel are useful.

I had originally set out to do all of this ordering the boards and parts and assembling them myself.
I was able to get some help learning to solder QFP chips which I figured would be the hardest part,
but it turns out that the USB micro-B connectors I chose are even more challenging because they're
designed for reflow oven soldering, and I'm attempting to use an iron. Given my difficult time
soldering, I've also been playing around with a PCB assembly service to assess whether that's worth
it. I'll have quite a few prototypes lying around before I arrive at a finished product!

![Microwave radios deployed in a parking lot](/assets/2021-04-11-dirty-30-prep.jpg)

I took a break from all of that today to join with other members of RMHAM building out the portable
microwave network to support the upcoming Golden Gate Dirty 30 race. It was great seeing folks in
person again! Most of us were at least partially vaccinated against COVID and everyone was cautious
about social distance, and we still got everything put back together. It's been 2 years since some
of that equipment was used, and there are some additions that the head honchos were eager to add, so
it was definitely worth the time getting it set up.
