---
layout: page
title: PiPat
permalink: /pipat
---
A reference design to set up a Raspberry Pi and TNC-Pi as a stand-alone, multi-user Winlink client
with Pat.

Updated 2020-10-18

## Overview

Use a Raspberry Pi with a [TNC-Pi2](https://tnc-x.com/TNCPi.htm) as a
[Winlink](https://en.wikipedia.org/wiki/Winlink) client. When used in the field, the Raspberry Pi
sets up a WiFi access point and hosts the [Pat](http://getpat.io/) HTTP Winlink client. Any laptop
or smartphone can connect with WiFi and a web browser, and send and receive Winlink email.

This reference design is meant to be as simple and straightforward as possible to assemble and
configure; as such, it does not use the full flexibility of any of the components. Use this as a
starting point, then extend based on your own interests or requirements.

Many thanks to Martin Hebnes Pedersen LA5NTA for creating and maintaining
[Pat](https://github.com/la5nta/pat)!

PiPat is inspired by [PiGate](http://www.pigate.net/) by Mark Griffith KD0QYN.

Also check out videos from Jason Oleham KM4ACK about building basically the same thing. He has tons
of videos incorporating Raspberry Pi and ham radio, and has built up scripts for many tasks
including those outlined here.

## Need help?

Use the [Pat users mailing list](https://groups.google.com/forum/?#!forum/pat-users); I'm on there,
and if I can't answer immediately, you'll have more eyes on your question.

## Equipment

*   Raspberry Pi, I suspect any hardware version with either built-in WiFi or an AP-capable dongle
    (I use a [Raspberry Pi 3 B+](https://www.sparkfun.com/products/14643))
*   Latest Raspbian OS with updates installed (I use Buster)
*   [Coastal ChipWorks TNC-Pi 2](https://tnc-x.com/TNCPi.htm) and interface cable (I bought the kit
    and built my own cable)
    *   Coastal Chipworks is no longer operating, and the TNC-Pi 2 is hard to find, but MFJ has a
        clone called the [MFJ-1270PI](https://mfjenterprises.com/products/mfj-1270pi-pitnc-board).
        At roughly double the price of the old TNC-Pi 2 kit, I'm not sure I'd recommend it.
    *   There are plenty of other good options for TNCs that work with libax25:
        *   [Mobilinkd TNC3](https://store.mobilinkd.com/products/mobilinkd-tnc3)
        *   [Signalink USB](http://www.tigertronics.com/slusbmain.htm) and
            [Direwolf](https://github.com/wb2osz/direwolf)
        *   [TARPN NinoTNC](http://tarpn.net/t/nino-tnc/nino-tnc.html)
        *   Traditional TNCs like Kantronics, SCS, AEA
*   Any VHF/UHF amateur radio, from a Baofeng UV-5R on up (I mainly use an Anytone AT-D878UV)
*   Power in the field (I use an Aukey Power Bank USB battery)

Optional:
*   USB GPS module for position reports and time (I bought a
    [GlobalSat BU-353-S4](https://www.amazon.com/dp/B008200LHW/))
*   Add-on RTC module for time (I bought [this one](https://www.adafruit.com/product/4282))
*   A case for the Pi & TNC (I 3D-printed [this one](https://www.thingiverse.com/thing:763710))

## Configuration

Assumes starting from a fresh and updated Raspbian image. At the time of writing, this is Raspbian
Buster. Raspbian currently comes in 3 sizes: "desktop and recommended software", "desktop" and
"lite"; the mid-tier desktop-only image is sufficient.

Open a terminal window and issue the command:

```
sudo apt update && sudo apt -y full-upgrade
```

You should also change the pi user’s password from raspberry to something else:

```
passwd
```

## Enable serial0 for TNC-Pi

```
sudo raspi-config
```

Network
*   Change hostname (if desired, for identifying the Pi on your home network)

Interfaces
*   serial console: disable (we don’t want system logs going to the TNC-Pi)
*   serial port: enable (we want to talk to the TNC-Pi through the GPIO pins)
*   I2C: enable (for optional RTC)
*   SSH: enable (for remote debugging)

Localization
*   set time zone

## Set up Pi as an Access Point

For now, I’m using the `wpa_supplicant` feature of first attempting to connect to a known network,
then falling back to creating an access point. I’d prefer to have more control with a physical
toggle switch, but that’s more work.

I’ve had good luck using this script: https://github.com/0unknwn/auto-hotspot.

Contents of `/etc/wpa_supplicant/wpa_supplicant-wlan0.conf`:

```
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
ap_scan=1

network={
    priority=10
    ssid="MyHomeNet"
    psk="MyHomePassword"
    key_mgmt=WPA-PSK
}

network={
    ssid="PiPat"
    mode=2
    key_mgmt=WPA-PSK
    psk="HelloWinlink"
    frequency=2462
}
```

Then run:

```
git clone https://github.com/0unknwn/auto-hotspot.git
cd auto-hotspot
chmod +x auto-hotspot install.sh
sudo ./install.sh
sudo reboot
```

If you look closely in the
[auto-hotspot script](https://github.com/0unknwn/auto-hotspot/blob/master/install.sh), you can see
the Pi will have an IP address of 192.168.4.1 when it’s in AP mode. If desired, that can be modified
in the `/etc/systemd/network/12-wlan0-AP.network` file.

## Install and configure ax25.service

```
sudo apt install ax25-tools ax25-apps
```

Contents of `/etc/ax25/axports`:

```
# name  callsign    speed   paclen  window  description
tncpi   K0SWE-1     19200   255     2       TNC-PI
```

Above, 19200 is the baud rate of `/dev/serial0` between the Pi and TNC-Pi. Below, 1200 is the baud
rate between the TNC-Pi and the RF transceiver, and must match the remote Winlink RMS.

Contents of `/etc/default/ax25`:
```
# Configuration for AX.25 systemd unit file from Pat.

# The axport from /etc/ax25/axports to bring up.
AXPORT=tncpi

# The AX.25 baudrate the TNC is configured for.
# Make sure this matches the HBAUD setting of your TNC.
HBAUD=1200

# The TNC serial path.
DEV=/dev/serial0
```

## Install and configure Pat

Follow directions at https://getpat.io. Download from https://github.com/la5nta/pat/releases. Need
the “armhf” version.

Below is a summary of [quickstart](https://github.com/la5nta/pat/wiki/The-command-line-interface)
and [AX.25](https://github.com/la5nta/pat/wiki/AX25-Linux) wiki pages:

Start ax25 service at boot

```
sudo /usr/share/pat/ax25/install-systemd-ax25-unit.bash
sudo systemctl enable ax25
sudo systemctl start ax25
```

Run pat configure (equivalent to `$EDITOR ~/.wl2k/config.json`), then set these values:

```
{
  "mycall": "K0SWE",
  "secure_login_password": "YOUR_WINLINK_PASSWORD",
  "locator": "DM79lv",
  "http_addr": "0.0.0.0:8080",  ← Allow web from any host, not just local
  "ax25": {
    "port": "tncpi", ← must match /etc/ax25/axports
    "rig": "", ← have to manually tune your radio
  },
  ...
}
```

Then start Pat HTTP and enable on boot:

```
sudo systemctl start pat@pi
sudo systemctl enable pat@pi
```

## (Optional) GPS Position reports

Pat can send position reports. This can be fed by browser-based geolocation APIs, but that’s
considered a “powerful feature” and is
[disabled for insecure origins](https://www.chromium.org/Home/chromium-security/deprecating-powerful-features-on-insecure-origins),
so it’s hard to get running with Pat over Wifi. Instead, a GPS module can feed location directly to
the Pi.

```
sudo apt install gpsd gpsd-clients
```

I noticed that gpsd was not picking up
[my particular USB GPS unit](https://www.amazon.com/dp/B008200LHW/) when plugged in. I tracked it
down to a udev rule in `/lib/udev/rules.d/60-gpsd.rules`:

```
# Prolific Technology, Inc. PL2303 Serial Port [linux module: pl2303]
# rule disabled in Debian as it matches too many other devices
#ATTRS{idVendor}=="067b", ATTRS{idProduct}=="2303", SYMLINK+="gps%n", TAG+="systemd", ENV{SYSTEMD_WANTS}="gpsdctl@%k.service"
```

After uncommenting the `ATTRS` line, hot-plugging the USB GPS unit works as expected.

Test `gpsd` with `cgps` or `gpsmon`.

After that, creating a position report in Pat can be done from CLI. It can also be enabled in the
Pat web interface with another change in pat configure:

```
  "GPSd": {
    "enable_http": true, ← change this to enable GPS reports in Pat web
    "use_server_time": false,
    "addr": "localhost:2947"
  },
```

## (Optional) Accurate Time

The Raspberry Pi does not come with an onboard Real-Time Clock (RTC) with a battery power supply the
way most desktop and laptop computers do. This means the system clock will stop when power is
disconnected, making timestamps of emails and log messages inaccurate.

In an internet-connected context, an NTP client can be used to fetch time from an NTP server. ~~A
program called `ntpd` was the old standard~~; now `systemd-timesyncd` (with `timedatectl`) is the
lightweight, pre-installed replacement, and `chrony` is the full-featured replacement. Any guides
referencing `ntpd` should be avoided. See
[this](https://wiki.archlinux.org/index.php/systemd-timesyncd) for more details.

For field-deployed situations without internet, a couple of solutions for accurate time are
possible.

### Get Time from GPS

In addition to location, GPS provides accurate time which can be used to set the system clock. If
you’re already using GPS, it’s a great option. See
[this guide from Mike Richards G4WNC](https://photobyte.org/raspberry-pi-stretch-gps-dongle-as-a-time-source-with-chrony-timedatectl/).
In summary:

```
sudo apt -y install gpsd gpsd-clients python-gps chrony
```

Contents of `/etc/default/gpsd`:

```
START_DAEMON="true"
USBAUTO="true"
DEVICES=""       ← G4WNC recommends specifying this, but I leave mine dynamic
GPSD_OPTIONS="-n"
```

Add to end of `/etc/chrony/chrony.conf`:

```
# Use NMEA data from gpsd shared memory
refclock SHM 0 offset 0.5 delay 0.2 refid NMEA
```

Reboot, then check if it’s working:

```
# Is GPS getting good data?
cgps
# or
gpsmon
# Is chrony getting input from GPS? Will say so even when internet-connected
chronyc sources -v
```

That setup uses NMEA data which has <1 second precision and is good enough for my purposes. There’s
also a PPS protocol which is extremely accurate but not supported by all GPS modules and needs Linux
kernel support, which is just too much work.

### Add-on RTC module

Add an RTC module with battery: [cheap](https://www.adafruit.com/product/3386) or
[precise](https://www.adafruit.com/product/4282) options from Adafruit, or
[precise, cheap but dodgy](https://www.amazon.com/dp/B01N1LZSK3) from China. These use the I2C bus
and need some setup as described here.

If you didn’t already:

```
sudo raspi-config
# enable I2C interface & set time zone
```

Add *one* of these lines at the end of `/boot/config.txt`, depending on which RTC chip you're using:

```
dtoverlay=i2c-rtc,ds3231
dtoverlay=i2c-rtc,ds1307
dtoverlay=i2c-rtc,pcf8523
```

Then:

```
sudo reboot

sudo apt-get -y remove fake-hwclock
sudo update-rc.d -f fake-hwclock remove
sudo systemctl disable fake-hwclock
```

In file `/lib/udev/hwclock-set`, comment out lines:

```
#if [ -e /run/systemd/system ] ; then
# exit 0
#fi

#/sbin/hwclock --rtc=$dev --systz --badyear

#/sbin/hwclock --rtc=$dev --systz
```

Make sure clock is updated, then write to RTC:

```
# Sync time using the internet
sudo timedatectl
# or
sudo chronyc -a makestep

# Save the time to the RTC
sudo hwclock -w
```

Now when the system boots, the Pi should read from the RTC to set system time.

## Using PiPat

In the field, the Pi will start a WiFi access point named `PiPat` with password `HelloWinlink`.
Connect your laptop or phone to that network, then point your web browser at
http://192.168.4.1:8080. The Pat web application should be served up!

When transmitting and receiving, note that your radio should be set to leave the *squelch open/off*!

## Future ideas for PiPat

*   Consider scripting this document and producing daily images by forking
    https://github.com/RPi-Distro/pi-gen/ or something.
*   Physical toggle switch for setting WiFi to Home vs Field, and
    [physical button for safe shutdown](https://core-electronics.com.au/tutorials/how-to-make-a-safe-shutdown-button-for-raspberry-pi.html)
*   It’s illegal to encrypt the ham radio side, but the web frontend on WiFi could use TLS and
    authentication. Easiest way is to
    [use a reverse proxy](https://github.com/la5nta/pat/issues/159) in front of Pat.

## Appendix

### Dire Wolf

I tried this basic setup with [Dire Wolf](https://github.com/wb2osz/direwolf) 1.5, and got it
working reasonably well. This variation doesn’t use the TNC-Pi, but does need either a sound card
radio interface like a [SignaLink USB](http://www.tigertronics.com/slusbmain.htm) (the way I
tested), or a cheap USB sound card and a
[GPIO PTT circuit](https://www.marcelpost.com/wiki/index.php/GPIO_pin_on_the_RPi_to_trigger_PTT).
I’m not going to automate it with `systemd`, but it does work.

Contents of `/etc/ax25/axports`:

```
# name  callsign        speed   paclen    window  description
dwlf    K0SWE-1         0       255       2       Direwolf/Signalink
```

Contents of `~/.wl2k/config.json`:
```
"ax25": {
    "port": "dwlf",
    ...
}
```

Direwolf config, figure out which sound card number:

```
arecord -l
aplay -l
```

Then, contents of `~/direwolf.conf`:

```
ADEVICE  plughw:1,0
```

To start:

```
direwolf -t 0 -p > direwolf.log 2>&1 &
# note that /dev/pts/1 can change, have to watch direwolf logs to verify
sudo kissattach /dev/pts/1 dwlf
# workaround for "Invalid transmit channel 8 from KISS client app"
sudo kissparms -c 1 -p dwlf

pat http
```

If you see "Invalid transmit channel 8 from KISS client app" in Direwolf logs, see
https://github.com/wb2osz/direwolf/issues/42.
