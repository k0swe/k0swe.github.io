---
layout: post
title: "Catalog Progress"
date: 2023-05-26
---

I've been plugging away at the [ARES Catalog](/2023/03/29/catalog.html) project. After negotiating
some clearer requirements, I set out building a prototype with [Next.JS](https://nextjs.org/).

For the database, I started out with [Postgres](https://www.postgresql.org/) using the
[Prisma](https://www.prisma.io/nextjs) library. I experimented at first with writing my own Next.JS
server-side API, then using [Next-CRUD](https://github.com/premieroctet/next-crud) to generate the
API. Ultimately, I abandoned this whole line of development because I realized that Postgres was
costing me too much money for a scale-to-zero project. Since then, I switched the Next.JS app to use
[MongoDB](https://www.mongodb.com/) via the [Mongoose](https://mongoosejs.com/) library.

The app's core functionality has been coming along. I've imported the ICS 217s from Ben's
spreadsheets into the database and can display those, both in nice web tables as well as a printable
view that closely matches the printed forms. Still, I can't help but feel like my progress has been
much slower trying to learn React than if I'd stayed in my comfort zone with Angular. React just
hasn't "clicked" for me yet.
