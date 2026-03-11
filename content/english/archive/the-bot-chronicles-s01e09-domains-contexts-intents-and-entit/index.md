---
title: "The Bot Chronicles S01E09: Domains, Contexts, Intents and Entities"
meta_title: ""
description: "This is episode 9 of the series. Be sure to check out the previous episodes here:"
date: "2017-12-14T15:14:16Z"
image: "https://cdn-images-1.medium.com/max/2560/1*pRuuL-PP5I0eVFu3OkCE7w.png"
categories: ["Archive"]
author: "Frank De Graeve"
tags: ["archive", "chatbots", "conversational-ai"]
draft: false
original_platform: "Medium"
series: "Bot Chronicles"
series_weight: 9
---

{{< figure src="https://cdn-images-1.medium.com/max/2560/1*pRuuL-PP5I0eVFu3OkCE7w.png" >}}

## What’s up with those domains, contexts, intents and entities?


Every conversation we have is a combination of contexts, intents and entities, often spanning multiple domains. It is your job to detect all of these in the previous exercise mentioned in episode 7 and construct your bot functionality to encompass these concepts.


## Intents


Let’s start with intents first. Unless you build a very rigid action based bot (which can have it’s purposes) chances are you’ll not be able to write out your bot to react to exact phrases. Quick example: Imagine 5 different ways to greet someone. Now imagine you write code to react to each of these 5 greetings. Great. Your bot can now react to any of those greetings.


*“Hi” -> “Hello there, puny human”“Good morning” -> “Hello there, puny human”“Good day” -> “Hello there, puny human”“Good evening” -> “Hello there, puny human”“Hello” -> “Hello there, puny human”*


Along comes another person. They can easily find 5 totally different ways to greet your bot, and it wouldn’t know what to do, since the phrasing was different.


*“Top of the morning to you!” -> ???“Well hello there!” -> ???“Hiya!” -> ???“Howdy partner!” -> ???“‘sup?” -> ???*


However, the “Intent” is the same:


**[intent:greeting] -> [answer greeting]**


This means we need to define bot functionality based on **intent** and **not on the exact wording**.


NLP (Natural Language Processing) can help in detecting intent. Most bot building platforms will provide access to NLP to help you detect intents, or you define them yourself and you train the AI to detect these intents and extend the set of sentences that are tied to this intent.


{{< figure src="https://cdn-images-1.medium.com/max/800/0*rOPw15CSse-1Qbsh." >}}


{{< figure src="https://cdn-images-1.medium.com/max/800/0*24yBx94D63eL6CU8." >}}


Entities


“Entities” could be defined as a set of “meta data” to your intents. Let’s use the jobboard example again.


Consider these 2 sentences:


- Find me jobs
- Find me fulltime jobs as functional analist in the financial sector, with a commute time of 30 min max.


The “intent” here is: **[get me some vacancies]** But in order to provide a valuable response I’d need additional information for this intent. I need information like the job fuction, the job regime, the sector in which the candidate wants to work and what the commute time should be. These are all entities that can help in formulating the intent.


I’ll give you some additional sentences here, allowing you to find the intent and the entities for yourselves.


{{< figure src="https://cdn-images-1.medium.com/max/800/0*wHAGtrsl0QJH6_h3." >}}


Now you can start to define some pretty complex functionalities. You might for example make certain entities required in order for an intent to be executed properly.


Say a job function is the minimal requirement to have a good job search. Now you can have your bot ask follow up questions to get a value for that entity before providing an answer for the intent.


Example:


**You:** *Find me jobs *-> intent = [get me some vacancies]  
 ** Bot:** *Sure. I’ll get right on it. Could you tell me more about what type of job you’d like?* -> get the job function entity, but still with the intent of [get me some vacancies]


**You:** *I want to be… a lumberjack! *(don’t we all?!)


**Bot:** *OK. I could go and look for lumberjack vacancies, but perhaps you might want to refine this a bit? Are you looking for a fulltime job? And are you willing to travel?* -> get job regime and commute time or location entities, again, still with the intent of [get me some vacancies]


**You:** *A Part-time please, and preferably close to Ghent.*


Now the bot has all the required entities to execute on the intent [get me some vacancies]


**Bot:** *OK, Frank, here are the 5 best matching vacancies for a part-time lumberjack close to Ghent. Good luck in posting your candidacy!*


*The end result could look a bit like this:*


{{< youtube "Cib4nTmkraU" >}}


## Context


As mentioned before. NLP can help you detect intents and entities. But that alone isn’t very helpful.


To explain this, I created a funny test in Lunchbot (the companion bot to our company bot development presentation). The which the speaker could ask the bot what it was wearing and the bot would respond accordingly.


I would have 2 answers defined. One answer would be “very warm clothes”, the other “a swimsuit”.


In order to give the correct answer, the bot would need to know what it’s context is in order to be able to provide the correct answer. If I would only have the bot triggerd by the intent “what are you wearing” I would have no idea which of those 2 answers I should give.


So I added a way for the speaker to actually set the context. the conversation would go like this.


**Speaker:** *OK, Lunchbot. Imagine you’re in the arctic. -> In this intent I set the context of the bot to “Arctic”*  
 **Lunchbot:** *OK. Chilly here.*  
 **Speaker:** *What are you wearing?*  
 **Lunchbot:** *I’m wearing a taun-taun I cut open some minutes ago.* ([Couldn’t help the Star Wars reference](http://nl.starwars.wikia.com/wiki/Tauntaun))  
 **Speaker:** *OK, now set your context to Hawaï*  
 **Lunchbot:** *Nice!*  
 **Speaker:** *What are you wearing?*  
 **Lunchbot:** *A very inappropriate bathing suit.*


So the important thing here is to understand that one sentence (and thus, one intent) can have different results in your bot, given the “context” it is in. The question “What are you wearing” gives 2 different results based in the context of being in the arctic or in Hawai. That too is something you’ll need to detect in the mock conversations you’re having during development (see episode 7). Contexts is something you can steer and they are very important for “follow-up” questions.


Let’s get back to the example of finding vacancies.


At the end of the conversation, the bot comes up with a couple of results. I could have the bot continue like this:


**Bot:** *OK, Frank, here are the 5 best matching vacancies for a part-time lumberjack close to Ghent. Would you like to be notified if additional vacancies for a lumberjack near Ghent pop up?*


Now, I’m switching the context of the bot to “job alert creation”. So any response I’ll be getting now should be considered within the context of job alert. Chances are I’ll get either a confirmation or a rejection.


**You:** *Yes please!*


See, this confirmation intent is useless if I don’t know the context. But it was set to “job alert creation” so I know what this “yes” intent means.


**Bot:** *Great! How often would you like me to notify you?*  
 **You:** *Weekly*  
 **Bot:** *Check! I’ll notify you weekly of any new vacancies for a part time lumberjack near Ghent.*  
 **You:** *Thx*  
 **Bot:** *You’re welcome. Good luck with your candidacy.*


I mentioned you can set a certain context for your conversation. The fun thing with these is you can keep the context alive over multiple intents through your flow. In fact, you can have multiple contexts running concurrently.


I tried visualizing this as a sort of layered cake, where every layer stands for a context.


{{< figure src="https://cdn-images-1.medium.com/max/800/0*RqPbkGI3MWjFiVRb." >}}


Within that context you can have a certain flow and a set of possible functionalities (the circles). From time to time these functionalities make you jump contexts (AKA, go to another layer in the cake). You’ll notice that some functionalities are persistent over multiple contexts.


Take “Help” for example. Within a bot there might be a “help” functionality. This functionality should be available in whatever context you’re in. In other words, the user should always be able to ask for help when they’re stuck within the bot. Help is represented by the green column on the left. You see that, whatever context the visitor is in, the “help” functionality is always available.


## Domains


So, we understand contexts, intents and entities. Turns out, you could define a whole bunch of contexts, intents and entities all covering the same purpose. That’s what we call a domain.


The whole set of contexts, entities and entities I just mentioned for the vacancy search bot is quite specific. I could group those in a “jobboard” domain.


Other purposes could have domains of themselves. Booking a flight for example, or setting an alarm, or playing music. They would all have their specific bot vocabulary (combination of contexts, intents, entities).


The concept is quite clear when looking at the prebuilt agents in Dialogflow (btw, API.AI rebranded to Dialogflow some time after this article).


{{< figure src="https://cdn-images-1.medium.com/max/800/0*md_C59ni_br7zeZF." >}}


Have a look and imagine how your service would look amongst these domains. Enticing, right


## Now what?


Through analysis and prototyping your conversations you’ve detected your conversational domains that match up with your services. You have defined your intents and corresponding entities, and you’ve mapped them out over the different main branches of your bot flow. Now it’s time to create your bot. There are multiple platforms and architectures out there. We’ve tested out the most promising ones. In the next episode of this series I’ll hand you over to our development team to go more into depth on what is out there, what to look for when choosing a platform, and how these systems compare to each other.


If I’ve peaked your interest, don’t hesitate and drop us a line. We’d be happy to guide you along your very own bot development project.


---
{{< figure src="https://cdn-images-1.medium.com/max/400/1*c1LDMH5vbnIz9rmAka8Hwg.png" >}}
