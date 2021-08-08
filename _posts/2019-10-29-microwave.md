---
layout: post
title:  "Microwave IP Networks"
date:   2019-10-29
---
![MikroTik LHG](/assets/mikrotik-lhg.jpg)

I've been curious ever since June to learn more about [RMHam](https://www.rmham.org/)'s microwave
data network that they deployed up at the Dirty 30, so I started doing some research and asking
questions.

My research brought me back to [AREDN](https://www.arednmesh.org/); I'd seen references to it in the
past but this time I dug in a bit further. In concept, it's an ad-hoc mesh IP network operating on
microwave ham bands. The frequencies are close enough to Wi-Fi that even some consumer Wi-Fi access
points like the Linksys WRT54G will work, although commercial equipment like Ubiquiti is
recommended. Hams can opt to put up a node on their shacks, become part of the mesh, and use any
services available elsewhere in the mesh. Services include things like chat, file sharing, VoIP
audio/video conferencing and IP webcams. Internet access can also be piped in, although due to the
prohibition on encryption on ham bands, it can't be raw internet access. AREDN sounds like it's
closely related to [BBHN](http://www.broadband-hamnet.org/).

This sounded useful and somewhat similar to RMHam's system, so I asked a couple of folks about it.
Apparently they haven't adopted AREDN because they've had some negative experiences with it. Pueblo
County ARES attempted to deploy a large AREDN system, but found that it didn't integrate well with
non-AREDN systems, particularly RMHam's existing microwave IP network. It turns out some of the
autoconfiguration magic of AREDN that allows any ham to get a node up and running quickly also
interferes with being able to interoperate with other systems. Specifically, all AREDN nodes
use [private network](https://en.wikipedia.org/wiki/Private_network) addresses, which means anyone
outside of AREDN can't connect to services inside without having some sort of network address
translation (NAT) in place. That could probably be overcome with something similar to UPnP, but
Pueblo ARES also apparently found that the network was not reliable; I didn't ask further on that
point.

Instead of using AREDN's autoconfiguration, RMHam prefers to manually manage most of the details.
They prefer MikroTik hardware, use a lot of static IPs and select their own routing protocols; this
lets them interop with commercial ISPs and access the entire network directly. I hope to learn more
about how RMHam conducts business. I'm not savvy enough at networking to say whether all of this is
necessary. I like the idea of network autoconfiguration, but I'm enough of a computer power user to
know that choosing "auto" isn't always the best option.
