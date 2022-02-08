---
layout: post
title:  "Pat Forms Updates"
date:   2021-12-06
---
![Update](/assets/update.png)

Pat officially launched [form templates](https://k0swe.radio/2021/07/10/pat-forms.html) back in
July, and the reviews since then have been pretty positive! However, there's definitely room for
improvement, particularly in the process for downloading updated versions of the form templates. To
find out about new versions, Pat has to scrape the Winlink website on a sort of blog post page.
Scraping is notoriously brittle because as soon as someone changes the way the blog page HTML looks,
there's a high chance of breaking the scraper logic. Sure, we could release a new version of Pat to
fix the problem, but that will require a lot of scrambling on the part of us, the Pat developers,
followed by every user having to download that new version of Pat. What a mess that would be.

Instead, [Martin](https://github.com/martinhpedersen) (Pat's founder) had the idea to separate the
scraping logic into an [online service/API](https://github.com/la5nta/pat-api) and take the scraper
out of the main Pat code. That way, if the Winlink blog page ever changes, we can change the online
bit. Pat clients that touch our API project don't have to be aware of the change, and everything
keeps working. Nice!
