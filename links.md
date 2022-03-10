---
layout: page
title: Links
permalink: /links
---

This is a list of resources I've found useful and would like to keep for reference. I hope others
find them useful as well!

## My Videos

- [TM-D710 Crossband Repeater](https://youtu.be/VUwnm9mY9Sw) (15 minutes)
- [TM-D710 Feature Overview](https://youtu.be/jJfxv953r0I) (1 hour 6 minutes)
- [Forester Lightning Talk](https://youtu.be/7Pn-sijfTJg) (17 minutes)
- [Programming Radios with CHIRP](https://youtu.be/RslvPYCLT-I) (1 hour 5 minutes)
- [Winlink in a Box](https://youtu.be/fSGivCXoU_0) (18 minutes)

## Denver/Boulder area clubs

- [Rocky Mountain Radio League](https://www.rmrl.org/)
- [Denver Radio Club](https://www.w0tx.org/)
- [Denver Radio League](http://denverradioleague.org/)
- [Boulder Amateur Radio Club](https://www.qsl.net/w0dk/)
- [Longmont Amateur Radio Club](http://w0eno.org/)
- [Rocky Mountain Ham Radio](https://www.rmham.org/) - a sort of "meta club" providing services to
  other clubs

## Other Denver/Boulder area groups and resources

- [Colorado ARES R1D6](https://www.coaresr1d6.org/) - Jefferson, Clear Creek and Gilpin Counties
- [Colorado ARES R1D3](http://bouldercountyares.org/) - Boulder and Broomfield Counties
- [Colorado AuxComm](https://www.colorado.gov/pacific/dhsem/auxiliary-communications) - a program of
  Colorado's Office of Emergency Management
- [Army MARS Region 8](http://www.cwamars.net/)
- [Edge Of Space Sciences](https://www.eoss.org/) - not a ham group per se, but their scientific
  balloons are tracked via amateur radio, and many members are hams
- [Colorado Connection](https://colcon.org/) repeater network - "a unique statewide two meter linked
  FM radio system with additional coverage into adjacent states"
- [Colorado Council of Amateur Radio Clubs](https://www.ccarc.net/) - Regional frequency coordinator
- [Ham Radio Outlet](https://goo.gl/maps/oTeGpAFZ2uiRnNNu6) - physical store in Aurora

## Digital Modes/Networks

### Voice

- DMR
  - [RadioID.net](https://radioid.net/) to get a DMR ID
  - [Brandmeister](https://brandmeister.network/)
  - [EchoLink](https://secure.echolink.org/)
- Digital multi-mode low-power hotspots
  - Most use the [Multi-Mode Digital Voice Modem (MMDVM)](https://github.com/g4klx/MMDVM) firmware
  - HRO [Zumspot](https://www.hamradio.com/detail.cfm?pid=H0-016490) - Raspberry Pi based, and runs
    [Pi-Star](https://www.pistar.uk/)
  - Shark RF [openSPOT2](https://www.sharkrf.com/products/openspot2/) - standalone device
  - Concise
    [comparison](http://arrl-ohio.org/digital/Amateur%20Radio%20Digital%20Hotspot%20Comparison.pdf)
    by ARRL Ohio of many hotspots, dated 2016-11, but doesn't include Zumspot
  - Another [comparison](https://amateurradionotes.com/hotspots.htm#thehotspots) by KE0FHS with more
    products covered

### Data

- [Winlink](https://www.winlink.org/) - radio email service, used heavily in EmComm
  - [Pat](https://getpat.io/) alternative client
- AX.25
  - [APRS](http://www.aprs.org/)
    - [APRS.fi](https://aprs.fi/) and [findu.com](http://www.findu.com/) for viewing APRS-IS data
      from web
    - [APRSdroid](https://play.google.com/store/apps/details?id=org.aprsdroid.app) for publishing
      and viewing APRS data from Android
  - [Xastir](https://xastir.org/index.php/Main_Page) for viewing and publishing APRS data directly
    on the Pi
  - [PiGate](http://www.pigate.net/) for using Winlink on another computer via WiFi
  - PiPat, another Winlink over Wifi system
  - [TNC-Pi](https://tnc-x.com/) - a TNC running on a Raspberry Pi
  - [Mobilinkd](http://www.mobilinkd.com/) - a portable TNC with Bluetooth
- [VARA](https://rosmodem.wordpress.com/) - primarily for Winlink but also has an IM client
  - [vARIM](https://www.whitemesa.net/varim/varim.html)
- [WSJT-X](https://physics.princeton.edu/pulsar/k1jt/wsjtx.html) - I've worked a lot of FT8
- [JS8Call](http://js8call.com/) - instant messaging using modified FT8

## Radio-specifics

### TYT MD-380

- [md380tools](https://github.com/travisgoodspeed/md380tools) and
  [md380tools-vm](https://github.com/KD4Z/md380tools-vm): This looks like a great improvement for
  the TYT MD-380, but I don't think it was compatible with the V05.01 hardware that I got. I
  encountered an [analog squelch issue](https://ham.stackexchange.com/q/14604/14609) I couldn't
  resolve. The md380tools repo is currently based on D013.020. I was able to get the radio working
  again with stock D015.001.

### AnyTone D878UV

- Jim Blocker KF5IW continuously updates and publishes a
  [DMR contact list](https://kf5iw.com/contactdb.php) with worldwide coverage from sources like
  radioid.net, so you can always tell who's talking.
- Dave Casler KE0OG has a [helpful video](https://youtu.be/MjnmOmSdqVU) on setting up the AnyTone
  D878UV for APRS, because it's not intuitive (at least, not as a first-time APRS user).

## Software

- Since I primarily use Linux and many radio programs are built for Windows, I use Virtualbox to run
  Windows as a guest within Linux. There's a
  [good guide](https://feeding.cloud.geek.nz/posts/programming-anytone-d878uv-on-linux-using-windows10-and-virtualbox/)
  from François Marier VA7GPL; I had missed the point about the `vboxusers` group, and it prevented
  me from attaching USB devices.

## Test study aids

- ARRL [Technician](https://www.amazon.com/dp/B07DFSW94G),
  [General](https://www.amazon.com/dp/B07TDVH426) and [Extra](https://www.amazon.com/dp/B01FTDEJN6)
  license manuals for in-depth learning
- ARRL [General](https://www.amazon.com/dp/B00XAFJ8HS) and
  [Extra](https://www.amazon.com/dp/B01FWFFQ9C) license Q&A books for exam cramming
- Roy Watson's
  [Technician](https://play.google.com/store/apps/details?id=com.delasystems.hamradioexamtech),
  [General](https://play.google.com/store/apps/details?id=com.delasystems.hamradioexamgeneral) and
  [Extra](https://play.google.com/store/apps/details?id=com.delasystems.hamradioexamextra) practice
  exam Android apps
- Practice exams on [hamstudy.org](https://hamstudy.org)

(I'm only linking the products I used personally, but most of these study resources are available
for all three exam levels.)
