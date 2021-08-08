---
layout: post
title:  "Raspberry Pi Time"
date:   2019-09-01
---
![Clock showing 12:00](/assets/clock12.gif)

One thing that bugs me when working with Raspberry Pis is that they don't have a real-time clock (
RTC), so when you remove power, the system clock stops. This isn't a problem when you're
internet-connected, because `ntpd` will just go out to the internet and fetch the current time.
However, when working in the field, the lack of an RTC causes Winlink emails and application logs to
have the wrong time stamps, which is annoying at best.

I did a little research into using my GPS module to update the system clock. Apparently that is
[supported by `ntpd`](https://gpsd.gitlab.io/gpsd/gpsd-time-service-howto.html#_feeding_ntpd_from_gpsd),
but the documentation on it assumed a much deeper knowledge of NTP than I have, and it's not clear
it even works in a non-internet-connected situation. It also uses a protocol called `1PPS`, which
has to be supported by the GPS hardware as well as the kernel. That's too much work for me to track
down right now.

But another option presented itself: Adafruit sells
[add-on RTC modules](https://www.adafruit.com/product/4282) which use the Pi's I2C bus. I picked one
up, and it didn't take too much fiddling to get it working. Hooray for accurate time in the field!
