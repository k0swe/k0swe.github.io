---
layout: post
title:  "Progress on Pat+VARA"
date:   2021-09-28
---
![Two stations running VARA FM](/assets/2021-09-24-vara-fm.jpg)

I've spent a lot of time developing on [Pat](https://getpat.io/) this month. For a long time, adding
support for the [VARA](https://www.winlink.org/tags/vara) transport has been a major requested
feature, but it was never prioritized because VARA is only designed for Windows, and Pat's primary
user base is Linux & Raspberry Pi. However, folks in the community have been experimenting with
running VARA in [Wine](https://www.winehq.org/), and have even gone so far as to write an
[installation script](https://github.com/WheezyE/Winelink). When someone has made it this easy to
install VARA on Linux, we don't have any excuses left to delay integrating Pat!

I've been helping to lay some of the [groundwork](https://github.com/n8jja/Pat-Vara) for the modem
driver. At this point I can complete an HF Winlink session, but I need to do a lot more testing
before we hand it over to the general public. I'm battling bad propagation from my QTH (home) HF
station and its poor antenna. There aren't any VARA FM Winlink gateways within VHF distance, so I've
been forced to pursue setting up my own VHF Winlink RMS/gateway.

And that in turn has forced me to pursue a topic I've been avoiding for some time:
[BPQ](https://www.cantab.net/users/john.wiseman/Documents/index.html). It's an extremely flexible
piece of software that at its heart wants to be a AX.25 packet radio gateway for Winlink and
[BBS](https://en.wikipedia.org/wiki/Bulletin_board_system)'s, but it can be configured for much
more. Because it's so flexible, it's also difficult to configure. I took a look at it a couple of
years ago and decided it was too much to bite off at the time, but it's really the tool I need for
testing Pat+VARA integration, so I'm now climbing the steep learning curve.
