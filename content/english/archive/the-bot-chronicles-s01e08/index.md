---
title: "The Bot Chronicles S01E08"
meta_title: ""
description: "This is episode 8 of the series. Be sure to check out the previous episodes here:"
date: "2017-07-11T14:31:32Z"
image: ""
categories: ["Archive"]
author: "Frank De Graeve"
tags: ["archive", "chatbots", "conversational-ai"]
draft: true
original_platform: "Medium"
series: "Bot Chronicles"
series_weight: 8
---

{{< figure src="https://cdn-images-1.medium.com/max/2560/1*x9KxDWiztrF9Gpq_qbQZgA.jpeg" >}}

I know, I know. I promised to talk about domains, contexts, intents and entities in bot conversations, and how to develop for these. But given the recent evolutions in the bot landscape, I wanted to splice in a short article on why I believe bots will actually sneak into your life without you noticing it.
## The trojan horses amongst bots.


So I’m guessing you all have a smartphone? And chances are a lot of you have one of those fancy little battery powered bluetooth speakers lying around. You know, the little speaker sets that you, given your kids didn’t steal them and took them up to their rooms never to be seen by you again, take along outside when doing some gardening, or when camping or whatever. Always nice to have some tunes. But they remain a bit tinny so you glance at ways to connect your hifi system to streaming services, in order to get some decent tunes. And you end up buying connected speakers like Sonos. They’re nothing fancy. Just connected to the web, ‘s all.


Oh, and Netflix. Sure, we like Netflix. Our TV can play it since, right, it’s connected to the web as well.


Cleaning the floor? Got a robo vacuum for that. Look, how handy. I can control it via my smartphone since it’s connected to the web. It even tells me when it’s done in a smooth voice, preceded by a soft chime.


These are not some hyperspace powered mega toaster ovens, neither are they the outlandish “connected fridge” systems that order new stuff from Amazon when you run out of something. They’re just simple household appliances many of you have in your homes.


And yet these devices will soon deceive you and become the trojan horses for the upcoming reign of conversational bots.


Why? They’re used, and accepted in the livingroom, and they already have auditive interfaces.


## So what?


That’s all fancy and well, but how will these innocent devices become the sneaky bastards I’m talking about?


Two major players are bragging about their bot SDK that allows anyone with a bit of hardware skills to actually make a conversational bot: Amazon with Alexa, and Google with it’s Google actions SDK. Both of these allow you to start creating a bot enabled hardware device right now. Not a bot on Messenger or Slack, or an incorporated bot on a website. I’m talking true hardware devices with a built in auditive assistant.


On top of that, we have Apple trailing along with their recent launch of their version of a smart speaker: Homepod.


### Google Home


Google recently released it’s Google Assistant SDK.


{{< youtube "Wsic12MXlsc" >}}


Now you can take a simple small Arduino device (or any linux distribution really), attach a mic and an speaker to it, implement the Google Assistant SDK, and voila! Your very own Google Home.


It’s clear that Arduino tinkerers are not Google’s target audience for this SDK. In the end they want actual device makers to implement this into… yes… your connected speakers, your TV, your vacuum cleaner, or heck, why not your oven, your fridge and your car.


More on [https://developers.googleblog.com/2017/04/introducing-google-assistant-sdk.html](https://developers.googleblog.com/2017/04/introducing-google-assistant-sdk.html)


### Amazon Alexa


Amazon has been in the voice assistants game a bit longer than Google. So they too have an [integration program](https://developer.amazon.com/alexa-voice-service) running. As with Google, you can quickly prototype on a Raspberry Pi, with the end goal of submitting your request to implement the assistant in your hardware device.


Since Amazon has a bit of a lead, there are already quite some hardware devices in the running.


### Apple


Apple’s Homepod is a bit underwhelming. It’s less open and for now it remains a bit unclear as to how one can start developing for the device. Still, a force like that joining the fray is important. For now they’re mainly dabbling in the realm of “speakers” but last WWDC clearly stated this device will get the Siri assistant as well.


## Now what?


All of these players (with Apple as an exception) are trying very hard to get other hardware manufacturers to implement their assistants. This means you’ll soon be buying these “assistant enabled” appliances just like you have been over the last couple of years, without even realizing they have these capabilities. And with a flick of the switch, or the toggle of a setting, the assistants will become alive. And all of a sudden you’re sharing the home with a bunch of these.


Of course there will be an opt-in procedure, but the end result will be that all of these devices will suddenly become accessible through voice. So just to be clear. You will not need an additional Echo or Google Home device. They will be built into these everyday household appliances.


And now for the storm of protest. Yes, I understand you’re not open to bringing in microphones in your private life. Yes you’re not some tech geek who loves to talk to his/her machines, and you value human interaction over some bot. Surely you won’t be activating that functionality on those devices.


But remember the little device in your pocket?! That too has a microphone. And you probably already gave permission to that device to use it. Either in the form of Google Search or Siri or whatever Samsungs flavor of assistant is this year…


And there too that switch will be flicked. In fact, it already has. The Google Pixel comes with Google Actions already installed. And over time other Android devices will follow suit. The older Google Nexus phones already get the popup to activate Google Actions, and so does the OnePlus 3 — or 5? can’t keep up with those numbers — . It will come to all Android 6 devices and above.


So whether we like it or not. The voice assistants will barge into our lives. And as with any emerging technology, there will be awful implementations and there will be great ones. Having used them for some time now, I do notice an important change in my behaviour. I tend to start using the assistants without contemplating the fact that I’m actually starting to use them (how very meta). They’ve become a part of the house. They kind of disappear. It’s what is referred to as “ambient computing”. The computers, together with the visual interfaces they came with, start to fade or blend into our surroundings. Always there, always available, without giving it much thought.


But let me get back to the API lecture I gave in the previous article (link to the article) in this series… Is your service ready to be accessible by these assistants? It’s one thing to build a bot, but it’s another to have it actually perform valuable functions based on what your service offers. You’ll need to disclose your service as an API before you can even start thinking about a bot.


If it’s not disclosed, and you decide you want to be part of this evolution, chances are you’ll be playing catch-up for too long, and a competitor will have their integration out way before you have. And getting people to switch is a hard thing to do. I wish I could say it won’t go so fast, but the evidence above leads me to believe it just might. So get cracking and see how you too can get your service out there.


---
