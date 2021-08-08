---
layout: post
title:  "Prepare for Countdown!"
date:   2020-12-19
---
> ![Rocket launch](https://lh3.googleusercontent.com/-XHv7vb7Rwgc/X94esnQ_4LI/AAAAAAAByKs/caJYnhBoNXwEWmOqj48IoZf9_Pa2pOZmgCLcBGAsYHQ/w320-h213/1024px-Amateur_Rocket_Launch_at_Big_Ass_Loading_Lifting_Suckers_%2528BALLS%2529_2017.jpg)
> [Wikimedia](https://commons.wikimedia.org/wiki/File:Amateur_Rocket_Launch_at_Big_Ass_Loading_Lifting_Suckers_(BALLS)_2017.jpg)
> CC BY-SA 4.0

I'm continuing to focus most of my energy on getting KelLog into shape for a public launch. I'm
already using KelLog for my daily logging needs, but there are plenty of sharp corners that need to
be smoothed out before handing it to other people and expecting them to be successful and delighted.

For starters, there's the question of packaging `kel-agent`. This is the semi-magical program that
allows web applications talk to installed amateur radio programs like WSJT-X. `Kel-agent` needs to
be installed, which means it's not enough to have an executable that builds; it needs to be copied
into a particular folder on the user's machine and added to their command line `PATH`. This has to
be done separately for each operating system, so I've learned more than I ever wanted to know
about [WiX](http://wixtoolset.org/) for Windows,
[Packages](http://s.sudre.free.fr/Software/Packages/about.html) for Mac, and
[dh-make-golang](https://github.com/Debian/dh-make-golang) for Debian. I also found a sponsor to
help me submit `kel-agent` and its dependencies to the Debian APT repo, so eventually, it will be
available for users of [Debian](https://packages.debian.org/sid/kel-agent),
[Ubuntu](https://packages.ubuntu.com/hirsute/kel-agent) and derivatives to install through Linux's
version of the "app store."

I've also been investing heavily in GitHub Actions automation to make sure that I can sustainably
maintain the 8 (and growing) repositories that make up
[KelLog's complete solution](https://github.com/k0swe/docs). I want to make sure that if and when I
start getting bug reports and feature requests, I can focus on writing code and not on some
laborious process for deploying or cutting releases.

Beyond KelLog, I've been getting some requests to step up in two of my ham radio organizations.
First, I'm joining the leadership team of [Colorado ARES R1D6](https://www.coaresr1d6.org/) as their
Training Coordinator. In that role, I'll be responsible for making sure we have a training plan that
engages and illuminates the entire 45-person team from the newbies to the old hands.

Second, I'm going to be helping the Rocky Mountain Ham group to launch an extension to their
existing [RMHAM University](https://www.rmham.org/rocky-mountain-ham-university/)
program, called RMHAM Tech Talks. These are intended to be shorter presentations lasting about an
hour, and will take advantage of RMHAM's new internet livestream studio.
