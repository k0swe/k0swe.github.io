---
layout: post
title: "Fun with PulseAudio"
date: 2021-10-15
---

![Screenshot of VARA FM in Audacity](/assets/2021-10-15-digirig-vs-signalink.png)

I've taken a slight diversion from integrating Pat with VARA because I need a reliable test bed.
Learning BPQ helped with the software side, but I've been having enough reliability problems to
start suspecting the hardware. I've been trying to use a
[Digirig Mobile](https://digirig.net/product/digirig-mobile/) for at least one of the Winlink
stations, either the client or the server, but have consistently had problems trying to use it for
VARA FM. It's been great for my QRP HF station and FT8/JS8, but for whatever reason, it's not doing
well with VHF protocols, either AX25 or VARA FM. I really felt compelled to investigate further.

After some fussing, I found a
[way to set up](https://lists.freedesktop.org/archives/pulseaudio-discuss/2021-October/032167.html)
Linux PulseAudio so I could hear exactly what the soundcard interface was sending to the software
modem program, and what the modem was producing. That resulted in the image above. The top window
shows a VARA FM ping exchange with the Digirig Mobile while the bottom shows a SignaLink USB. Within
each window, the top track is the received audio from the radio, and the bottom track is the audio
transmitted out to the radio. The white highlighted portions are the pause between TX and RX.
Notice, the pause on the Digirig is about 2 seconds, where the pause on the SignaLink is about half
a second. The ping response visible on the SignaLink's RX track is completely in the deaf section of
the Digirig's RX track.

I'm not giving up on the Digirig yet and I'm working with the designer, Denis `K0TX`, to understand
what's happening. In the meantime, my VARA FM adventures will need to use the SignaLink.
