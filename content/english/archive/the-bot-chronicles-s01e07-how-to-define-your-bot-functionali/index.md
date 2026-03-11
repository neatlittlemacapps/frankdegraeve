---
title: "The Bot Chronicles S01E07: How to define your bot functionality"
meta_title: ""
description: "This is episode 6 of the series. Be sure to check out the previous episodes here:"
date: "2017-06-28T14:12:11Z"
image: "https://cdn-images-1.medium.com/max/2560/1*koBoXO7g4i-B59rLjw0NJw.png"
categories: ["Archive"]
author: "Frank De Graeve"
tags: ["archive", "chatbots", "conversational-ai"]
draft: false
original_platform: "Medium"
series: "Bot Chronicles"
series_weight: 7
---

{{< figure src="https://cdn-images-1.medium.com/max/2560/1*koBoXO7g4i-B59rLjw0NJw.png" >}}

In episode 6 of this series, we covered step 2 of our discovery phase in bot development (how to define our bot personality).


Let’s repeat the steps here quickly:


In this episode we’ll cover how to define what your bot actually does.
## Define your bot functionality


### It’s about services


Just to be clear here. Given that you started thinking about a bot means you have at least a rough idea on what your bot should be doing. That, in combination with the insights you gathered from the previous steps in this methodology, should make it clear on what the main functionality of the bot should be.


That said, you might have some additional things that might help you sharpen the base functionalities of your bot. You might already have a mobile app. If you did a proper job of the app, you might consider the functionalities in the app as an MVP for your bot. Apps are quite constrained in a way. The functionalities in there should be a distillation of the core services you have to offer to your customers.


But wait a minute… What are your core services? And how will you make these available for the bot? This ties into a much bigger picture: are your services available for the network (and your bot) to be taken advantage of?


I strongly suggest to read up on this blogpost of a colleague of mine.  
 Pay special attention to the last section in that article. Your “services” should be made available to the network. In fact, instead of marketing the interface in front of your services to your customers (like a website, an app or other channels) you should market the service in and of itself as much as possible, so it becomes the preferred service to the network. A good way to do this is by making your services available to the network in the form of an API.


This is really critical stuff. If your service isn’t accessible to the network in the form of an API, your own bot can’t leverage that service and incorporate it into it’s functionalities. But not just your own bot. Other players on the network can’t leverage it, indirectly decreasing your customer base. You will loose agility in your service offering and in the way it is represented. And especially in times like these, where technology can change blazingly fast, agility is very important.


### Let me give an example:


One of our clients is one of the biggest players in the Belgian jobboards scene. They chose to invest into a total overhaul of their site. But they did not focus on the site per sé. They wisely focused on their “services”. So they decided the best approach was to have us construct an API first. The API “abstracted” the service away from all of the back-end systems and made it available to anyone who’d choose to incorporate it. The new website then just became the first “client” of that API. This setup now allows them to make parts of the API acessible to the public if they wish, and thus to other implementations and interfaces like… wait for it… right! Bots! It also allows them to remain agile. If there is a change in the back-end processes, existing API functionality towards the network stays the same. So no issues there. Additional functionality can also be quickly implemented without breaking older functionality in the API.


Whatever the functionalities of their service, they can now easily make it available to the network.


### Let me give you another way to look at this.


We all perform SEO on our web pages so they adhere to the best standards of getting found by the search engines out there. We implement microformats so the search engines understand something is a recepy, or an article, or whatever. We try to make our content the preferred content for the search engines.


Opening up your service in the form of an API is the same thing. You tweak and deliver your service in a form optimal for the network to start using.


So when the trojan horses of the bot world arrive (think Amazon Echo, Google Home, Apple’s Homepod…) you have the best possible chance to be one of the prefered services they’ll be offering in their functionality set.


OK. Big rat-hole. Let’s reign it in and get back to defining the functionalities of your bot.


## Translate services into a conversational UI.


When your services are availeble for bot development, and you know which of those services are core functionalities you want implemented in your bot, it’s time to start working out the conversational UI people will use to get the functionality out of those services.


You may choose to build a very action based bot (click on stuff, you get an answer with additional choices you can click on etc.) or a conversational bot (the bot provides functionality more by letting you converse through typing or speaking to it). Both of these bot types will require you to distill the main bot flow.  
 A good way to start defining what that flow looks like is simply by faking the “bot” part. There are plenty of ways to do this.


### 1. Drawing the flow


You could try to draw out the conversation flow in a flowchart. Given the complex nature of conversational UI, and the unpredictability of conversations (and the humans behind it) **this might not be a good first step**. You’ll end up with a very strict action based bot and you’ll miss out on a lot of interesting insights. It can help for the next solution below, but only as a rough guideline.


{{< figure src="https://cdn-images-1.medium.com/max/800/0*OgBlFQ_l6QtW_geo." >}}


### 2. Human bots


Let’s explain by using a “jobboard” bot as an example.


A very simple way to define bot flow is by setting up a slack channel, or open up any chat app of your choice, and assign the role of the “bot” to a real person. The “bot” player should know what the end goal of the service is: give the tiny human a list of vacancies that match up with it’s requests. They should also know the different aspects of the service that allow for this functionality to work: finding vacancies can be done by requesting what job function the human wants to perform, where they would like to work, in what job regime they want to work, etc…


Now start of the conversation by having the real human talk to the “fake” bot and see where the conversation takes you. Chances are, the human starts with something like “hey schlomo, gimme some jobs” (sigh). And so you react to that and get the human to hand over the exact info you need to provide a matching and useful set of vacancies they can then post their candidacy for.


Oh, and mind your tongue. Ideally the bot answers in line with the personality you defined earlier (see previous article)  
 It might also help to define some assets. Imagine the bot operates in Facebook Messages. Now imagine the search result for jobs is a gallery of cards within the messages app. You might mock up those cards and send that image to the person in the conversation.


The advantages of this method is that it probably is the fastest way of prototyping bots there is. Using existing messaging apps like Slack also allows you to go back to those conversations since they are stored. It’s like a handy archive of the conversation you can go back to and learn from.


Doing all of this will help in defining domains, contexts, intents and entities. I know. Lots of fancy words. More on this later.


### 3. Semi-working bot prototypes:


Another way of tackeling this is actually prototyping the bot. Tools like [Chatfuel](https://chatfuel.com/) allow you to actually create a working iteration of a bot.


{{< figure src="https://cdn-images-1.medium.com/max/800/0*x69dUnTwp4i7md48." >}}


The advantages of this are:


- easy to set up without much coding
- immediate feedback on what works and what doesn’t
- easy way to disclose the bot to a multitude of users (you learn most of getting a bot in contact with real people


Disadvantages are:


- Can’t handle the more complex NLP AI and contexts are difficult
- very “action based”
- Often only in messenger, so this might skew things a bit if you’re looking to build a conversational bot for Amazon’s Echo for example.


## What’s up with those domains, contexts, intents and entities you mentioned earlier?


I mentioned these terms earlier. Every conversation we have is a combination of contexts, intents and entities, often spanning multiple domains. It is your job to detect all of these in the previous exercise, and make sure your bot handles and reacts based on those concepts, and not on specific utterances of the user.


This is a very fascinating and important part of your bot development. In fact I’d rather devote an entire article just on those concepts. So let’s halt here and I’ll see you in the next episode of this series.


---
{{< figure src="https://cdn-images-1.medium.com/max/400/1*c1LDMH5vbnIz9rmAka8Hwg.png" >}}
