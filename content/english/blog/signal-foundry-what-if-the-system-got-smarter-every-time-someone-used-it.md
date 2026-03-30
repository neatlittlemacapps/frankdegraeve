---
fileClass: blog-post
title: "Signal Foundry (Beta): What if the system got smarter every time someone used it?"
meta_title: "Signal Foundry: What if AI infrastructure learned from every team?"
description: What if the AI infrastructure you built for one team automatically made every other team better, without anyone having to remember to share anything?
date: 2026-03-26
image: /images/teasers/signal-foundry-b.png
og_image: /images/blogposts/signal-foundry-b-schema.png
categories:
  - Agentic Orchestration
  - DesignOps
author: Frank De Graeve
tags:
  - ux-strategy
  - designops
  - agentic-ai
  - product-design
  - design-systems
draft: false
original_platform:
---
What if the AI infrastructure you built for one team automatically made every other team better, without anyone having to remember to share anything?

I've been chewing on that for a while. Here's where I've landed. It's called Signal Foundry, it's very much beta, and I'm sharing it now because the idea matters more than whether my implementation is polished.

(It is not polished. Moving on.)

## The problem with everyone's AI setup

Everyone's sharing their agent stack right now. Their skill library. The prompt system that saves them forty minutes a day. And honestly? Some of it is good. I've stolen ideas. No shame.

But almost all of it is *personal* infrastructure. It makes one person faster. It lives in one person's context. And when that person moves on, promoted, burned out, or just quietly stopped caring, the infrastructure doesn't disappear. It calcifies. It sits in a Notion page nobody updates, a skill library nobody extends, a prompt system that still works for the thing it was built for and nothing else. Or worse: it gets copied/forked and spins off in 30 different siloed flavours that do no longer align, accelerating inconsistencies throughout an organisation.

That's not a system. That's a dependency with a productivity veneer or a large scale confusion generator.

The gap I want to close isn't individual capability. It's *organisational* capability. The connective tissue. The thing that means work done in one team automatically feeds the next. That's the gap I keep seeing. Everyone optimising the individual. Nobody building the connective tissue.

## The thought that made me build this

Imagine you're the first UX hire in an organisation that has been building software for years without one.
Multiple product verticals. No shared design system. Few research or communities of practice. An aggressive roadmap that isn't slowing down for anyone. Budget: set. Timeline: yesterday.
You know what happens next. PMs write requirements. Engineering builds. UX isn't in the loop. The product ships. Users struggle. Someone files a ticket. A PM writes a user manual.
(This sounds like a horror story. It's just a Tuesday in a lot of organisations.)

You are one person. You cannot be in every room. You cannot review every prototype, sit in every discovery session, or coach every PM through outcome framing in real time.
The real question isn't "where do we start?" It's "how do you democratise UX thinking across an entire organisation when you are, structurally, one person?"
The answer can't be "work harder." It has to be: get the methodology and onboarding to it into the infrastructure itself, and make the infrastructure learn.

## Hub and spoke, except the spoke talks back

Hub-and-spoke model. Familiar, up to a point.

The hub holds shared foundations: UX methodology, AI interaction principles, design system seeds, validated patterns, parametrised tone of voice, research templates. Institutional knowledge that doesn't live in anyone's head.
Each product vertical gets a spoke. Its own agents, its own context, its own history. Spokes read from the hub. A new spoke spins up in minutes and immediately inherits everything accumulated so far.
{{< figure src="/images/blogposts/vertical.png" alt="Spoke details" class="wide" >}}
Here's where it stops being a library.

**Every meaningful action in a spoke emits a signal back to the hub.**
Research synthesis. Pattern observations. IA decisions. AI interaction choices. Structured, anonymised, flowing back. The hub watches all of them, looking for convergence. The same user need surfacing in two different verticals. A navigation pattern working across domains that share nothing else. An AI disclosure approach that keeps confusing people regardless of context.

When the evidence is strong enough, the pattern gets promoted. Pushed back to every spoke. No spoke knows where it came from. It just becomes how things are done.

The cycle is the system. Spokes learn from the hub. The hub learns from the spokes. Every session anyone runs feeds it forward.
{{< figure src="/images/blogposts/signal-foundry-architecture.gif" alt="Signal loops" class="wide" >}}
(Is this a utopian vision? Yes, I mean, I think so? Is it?! Anyways, does it still beat one person in seven simultaneous meetings? Also yes.)

## What the system actually does to your feature requests

This is the part I'm most proud of, and the part that will annoy people first.

Feature requests don't enter as requirements. They get reformulated. The agents push back, politely, methodically, with evidence, until the framing shifts from output to outcome.

*What's the user job here? Who's the archetype? What are we actually promising, and to whom? What does success look like for the user, not for the backlog?*

Only once that's clear does the system move to IA, through OOUX, so any prototype built has full knowledge of what it's trying to do and why everything connects. OKR suggestions come out of the same framing. Test results that return restart the cycle.

The system doesn't just receive. It onboards according to experience of the wielder, teaches, nudges. It has opinions. Strong ones, built from methodology, not vibes.

I know how that sounds. I built a very opinionated colleague. More or less correct. 😊

## The AI layer (and why it can't be naive)

Let's be honest, we're all looking at integrating (or replacing?) AI into our product offerings. so there's a parametrised AI interaction framework in the hub: transparency, human oversight, error prevention, appropriate delegation, with regulatory awareness built in where the domain requires it.

These are the constraints that shape what responsible AI interaction looks like when stakes are high. The system knows this. It flags it. It asks the right questions before anyone gets too excited about a feature that turns out to be clashing with legal requirements. (Nobody's favourite meeting. Extremely necessary.)

Tone of voice is parametrised per vertical too. This allows interfaces to not sound identical even if they share the same underlying system. Coherence isn't sameness.

## The semi-permeable membrane

Here's the property of the system I find most interesting, and the one that's hardest to explain quickly.

Spokes are not just isolated from each other. They're separated by something more deliberate than a wall. Think of it as a semi-permeable membrane. Signals, personas, patterns, and findings stay inside the spoke that produced them unless they're strong enough to pass through.

Local findings stay local. A persona developed in one vertical doesn't automatically appear in the other vertical. A navigation pattern that works in vertical A doesn't get pushed to vertical B just because it worked once. An AI interaction approach that a single team found useful sits in that spoke's context until the hub sees the same thing surfacing independently elsewhere.

When enough independent signals converge, the hub promotes the finding to the shared foundation. Only then does it reach the other spokes. Anonymised, abstracted, without attribution. (I might revoke this though. Perhaps some context traversal or decision origin data might be useful)

The membrane does two things at once. It protects teams from noise: other teams' half-formed insights, local edge cases, context-specific quirks that don't travel. And it means that whatever does make it through has genuinely earned its place. Not because someone decided it was important. Because the system saw it repeatedly, independently, across contexts that had no reason to agree.

(This is, now that I think about it, roughly how scientific consensus is supposed to work. The system is just faster and less susceptible to academic politics.)

This also matters for trust. If teams think their work is being exposed laterally, they filter before they emit, consciously or not. You lose the honest signal. Which defeats the point. So what surfaces in the hub is anonymised before it touches the foundation. *"Across multiple teams, users in high-stakes contexts prefer inline confirmation over modal interruptions"* rather than *"the pharmacy team found this, by the way."*

Privacy isn't a feature here. It's structural. (Again, I might circle back to this and adapt, in which case, ignore paragraph above)

## Where this actually is

I said beta at the top. I meant it.

The architecture holds. Signal flow works end-to-end. The agents push back when you try to skip steps, which depending on your relationship with being challenged is either genuinely useful or mildly maddening. (Both reactions are valid. The pushing back stays. Muhahahahahahaaaaa)

I'm currently in test scenario a5 of iteration 3 and 11 scenario's to go.
What I'm still calibrating: how much signal is enough before a pattern earns promotion? How do you handle genuinely contradictory findings across spokes without manufacturing consensus nobody actually believes? What does governance look like at the exact moment something is about to become institutional knowledge? How to store, transfer visual patterns (design system?)

Not blockers. The interesting part, where the system stops being an architecture diagram and has to work with actual humans in actual organisations. Which, as anyone who's tried it knows, is where all the real complexity is hiding.

## Why share this before it's done

Not because it's finished. Clearly. Not to sell anything. I don't have a product page and my logo is best described as "pending."

I want to name something while it's early. We're pretty good at individual AI capability right now. Agent setups, skill stacks, personal workflows. The art of making individuals faster.

Making *diverse organisations* smarter through AI, that's the part we haven't cracked. How do you make knowledge transfer automatic? How do you embed methodology instead of just documenting it? How do you make sure work done anywhere in the system strengthens the foundation for everyone else? The system has onboarding and nudging prompts but that's a long way away of truly integrating this, and seeing the results (Oh, look...  Turns out it's shit in the end afterall. Oh well...)

I might also be lagging already (again... ugh...) and perhaps the above is what full freewheeling agentic systems deliver. (I'm looking at you nanoClaw or whatever the newest fancy iteration of you is.) But I have to give this a shot.

If you're building something in this space, or inside an organisation navigating a version of this, I'd genuinely like to compare notes. Multiple verticals, no shared UX infrastructure, AI moving faster than your processes.

Slowly figuring this out. You're welcome to watch.
