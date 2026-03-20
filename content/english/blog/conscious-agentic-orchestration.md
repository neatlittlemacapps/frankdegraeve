---
fileClass: blog-post
title: Conscious Agentic Orchestration with DPC
meta_title: Conscious Agentic Orchestration
description: Why I integrating a "Dead Penguin Calculator" skill in all my projects.
date: 2026-03-20
image: /images/teasers/DPC.png
categories:
  - Agentic Orchestration
author: Frank De Graeve
tags:
  - skills
  - fun
draft: false
original_platform:
---
We're talking April 2025. The entire UX team of the organisation I worked for at that time had a 2 day get-together in Antwerp. The theme at hand was discovering the opportunities vibe coding would bring to our UX workflow. We got ourselves some accounts to V0, Bolt, Lovable, and I believe Figma make just started out. Some decks were shared introducing people to how this newfangled tech worked, some guidelines and best practices in prompting, and everyone got to work.

Given we were using temp accounts some teams ran against the token limits, which kickstarted a conversation on the ecological impact of vibe coding and AI (LLM) in general. "Ice caps melting" and that type of stuff.

Anyways, as one tends to do, one does not fill up a get-together like that with just work. All work and no play,... you know how it goes. So aside from the work-related activities we also spend a nice afternoon "Bob Rossing" it: everyone gets a blank canvas, a bunch of brushes and some paint. You start filling up one third of the canvas, pass on your work to a colleague who adds their third and so on until you get a nice slightly schizo painting. By this time the conversation on ecological footprint had grown into heated discussions on how many penguins died because our vibe coding contributed to the melting of the icecaps, and as such the demise of said penguins... It stuck.

Fast-forward to today where I'm knee deep into agentic context engineering. During one of my hyper-focused sessions the dead penguins popped up again. See, my entire setup lives for a big part in Obsidian. And within my setup I have a separate skill that summarizes what I did that day and pushes that in an Obsidian file, so I can use it later for... well... not sure yet, but something cool. Sorta like a logger. Alongside my agentic work I also have a personal "Visual Style Guide" for my blog or any other GUI related functionality that my skills might spit out. So it felt only natural to combine the logger the visual style guide and the penguins. enter the "Dead Penguin Calculator" skill or rather the "DPC".

The Dead Penguin Calculator estimates the ecological cost of any of my AI conversations and visualizes it as an HTML penguin mortality grid. It works by scoring each chunk of a session using a hybrid cost model (token load × complexity multiplier), then converts that into a penguin count. Tongue-in-cheek, obviously, but grounded in real energy-consumption estimates for LLM inference. The output is a branded HTML report (my Yokogaki visual identity, Space Grotesk/Mono fonts, all in OKLCH colours) with a grid of penguin icons, dead ones and surviving ones. Plus a breakdown of which parts of the conversation cost the most.

It's a conversation piece more than a scientific instrument, but it makes the abstract cost of AI usage visceral and a little absurd. Right how I like it. And before you ask, yes, it takes into account the actual cost of generating the report as well.