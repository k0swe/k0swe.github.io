---
layout: post
title: "Home Assistant"
date: 2024-05-09
---

In a slight departure from my usual amateur radio topics, I've been busy setting up more smart home
stuff. I've been curious about home automation for several years and slowly accumulating things like
Google Home speakers, Leviton dimmer switches and Nest outdoor cameras. However, using the Google
Home app as the central integration point and relying on WiFi for communication for everything has
been showing its limitations lately.

Enter [Home Assistant](https://www.home-assistant.io/), an open-source home automation platform that
focuses on local control and privacy. I have several work friends that have rave reviews of Home
Assistant, so I decided to give it a try. This has required revamping a lot of my basic home IT
infrastructure: I picked up a used workstation from
[The Server Store](https://www.theserverstore.com/) to use as a home lab server (for more than just
HA), and have replaced my Google WiFi mesh network with a Unifi setup. To add communication options,
I also picked up a [GoControl HUSBZB-1](https://www.amazon.com/gp/product/B01GJ826F8) USB stick that
supports both Zigbee and Z-Wave.

From there, I've been setting up Home Assistant on the server, adding integrations for existing
devices and services, and adding new devices. Most things have been wonderfully easy. Considering
it's open source, Home Assistant is really well polished in terms of usability and seamless
integration. I've added quite a few ThirdReality Zigbee devices like
[motion](https://www.amazon.com/gp/product/B09MVKWBFF/),
[door](https://www.amazon.com/gp/product/B09XCWRHCT/), and
[temperature](https://www.amazon.com/gp/product/B0BLTNZSQK/) sensors,
[wall plugs](https://www.amazon.com/gp/product/B0BPY5D1KC/), and some
[Innr color light bulbs](https://www.amazon.com/gp/product/B08428JSDZ/). I was even pleasantly
surprised to see that my OctoPi 3D printer server popped right in!

I have some overriding goals for my smart home:

1. Value add. Walking into a room turns on the lights, saving effort; the lights turn off when no
   one is there, saving energy. Notifications let us know when the garage door is left open or when
   the girls have dance class. The thermostat prioritizes rooms that are actually in use.
1. Spouse-approved. I don't want to make things more complicated for my family or guests. Everything
   should be intuitive and reliable.
1. Fail-open operation. I don't want to have to worry about my home being unusable if a sensor, the
   internet, WiFi or local HA server are down. Wall switches and the thermostat still need to do
   their basic job. Everything needs to revert to a dumb appliance in the absence of smart control.
