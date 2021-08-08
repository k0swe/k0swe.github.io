---
layout: post
title:  "New station setup and grounding problems"
date:   2020-07-19
---
A couple of weeks back I rearranged my home office and shack. The new arrangement gets my HF station
off of my desk and onto its own shelf, and it's been sitting there receiving FT8 quite happily while
I've been programming and testing a WSJT-X [UDP receiver](https://github.com/xylo04/wsjtx-go) for
Golang. However, today was my first attempt at operating FT8, and unfortunately, something about the
current arrangement is causing my CI-V control to reset every time I transmit.

Having CAT control reset on transmit is a killer problem for digital modes. With WSJT-X in
particular, the software ends the transmission if CAT resets, so you've lost that entire transmit
cycle. I had similar problems in the old desk location with certain bands; for example, I couldn't
really operate anything below 40 meters due to CI-V resets, and even on 40m I had to limit my power
to keep it reliable. Today's test on 20m was very discouraging. I used to be able to run 20m at 100W
if I felt the need (usually used less), but today even at QRP, I was having no luck transmitting.

> ![Grounding rod](/assets/HomeEarthRodAustralia1.jpg)
> 
> [Wikimedia](https://commons.wikimedia.org/wiki/File:HomeEarthRodAustralia1.jpg)
> CC BY-SA 3.0

My intuition is that I'm being bitten by the lack of a good station ground. I've gotten this far
without needing it, but something about the new configuration is allowing more RF into the shack. I
do have a radial wire on my end-fed long wire antenna, so there's not a lot more I can do to
optimize the antenna. I've been avoiding setting up a station ground because it's not as simple as
plugging something into a wall socket ground. It requires running a copper strap directly to a
dedicated grounding rod, which among other things requires finding a way to route it through the
exterior wall. I'm on the 2nd floor in the front of the house, so that's easier said than done.
However, it really is probably the next step in improving the station.

In other news, I'm continuing work on writing my own logging software. I've decided that I should
pursue creating a hosted web application with offline support. Unique among the web loggers I've
seen, I think I can achieve rig control and WSJT-X integration through an
"agent" program sitting on the same computer as the radio interface. The web application can connect
to the agent through a websocket, and the agent will translate between the webapp and
WSJT-X, `hamlib`, `flrig` or whatever else needs to be on the local machine. I have a proof of
concept for the websocket stuff, but there's still a lot of work to be done on core functionality.
The web app is in Angular with Typescript. While I probably won't use ADIF as a raw internal format,
I still need to be able to speak it for import and export, and I haven't found any native Typescript
implementations yet.
