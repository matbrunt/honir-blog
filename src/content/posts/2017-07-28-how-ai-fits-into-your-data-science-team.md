---
title: "How Ai Fits Into Your Data Science Team"
date: 2017-07-28T11:47:35Z
draft: false
categories: []
featured: ""
featuredpath: ""
featuredalt: ""
linktitle: ""
type: "post"
---
I read an interesting article this morning from an interview with Hilary Mason on Harvard Business Review about [How AI fits into your data science team](https://hbr.org/2017/07/how-ai-fits-into-your-data-science-team).

There are a few sections I wanted to capture and expand upon, as I think analytics / data science / machine learning will all see an increase in adoption from business over the coming years, and am very interested in how this might play out.

## Foundations

> you can’t do AI without machine learning. You also can’t do machine learning without analytics, and you can’t do analytics without data infrastructure.

I like the fact this calls out there are a number of foundations we need to build upon to get to the point of using AI techniques. One common pattern I keep seeing repeated is data scientists have models queued up to run in production because there isn't the engineering capacity to get them migrated from an exploratory / concept pipeline to a production ready system.

I have always believed in cross skilling as much as possible, and being from a software engineering background I particularly like the idea in having enough competency in all areas to embed in teams to develop the models and deploy them. For me, it is part of the lifecycle, developing the model is only part of it, until it's deployed it's not generating its full value.

## Three Applications of Data Science

The three areas of data science that Hilary called out feels a very good fit, thinking back over the companies I have worked in I can see the application of data science in each of them.

**Understanding the business**

What we have traditionally called business analytics, or business intelligence, this is the ability to ask questions and analyse information to make better business decisions.

**Product data science**

The is the 'coal face' of data science in my mind; the application of technique to improve the product. This might be building algorithms and data products using a variety of tools such as recommender systems, data visualisation, search algorithms etc.

**Research and Development**

A lot of the places I have worked counted this in with product data science, which matches what Hilary calls out. For example I currently work on growth modelling which sometimes feels like it sits between both camps, developing and running a data product, but also investigating using our data on what new areas we could open up for new business or revenue opportunities.

## What Deep Learning offers

> deep learning makes data accessible that was previously inaccessible to any kind of analysis

The majority of analysis pieces seem to be on textual data, rather than audio and video as is mentioned in the article, probably because this is the most abundant resource we have right now. 

But as the article says we are gathering more and more types of data each day, so it will be interesting to see what comes up in this field. That's one of the things I like about the data science area so much, there are constantly new and exciting advancements being made, and always something new to learn.

## What should you implement?

> You’ll leave opportunities on the table if you pursue only one of these use cases. 

As we referred to at the beginning of this post, there are a number of different ways we can use data science in business, and the concepts themselves are all built on top of each others foundations.

By spending time and effort on building good foundations in the infrastructure and analytics we can produce better data science implementations. Airbnb are doing interesting things in this field with their open source tools and processes.

This is something I believe in quite strongly, internally at work I'm trying to drive reproducible environments and tools where we can bring engineering best practises to enable greater sharing of ideas and models in the data science community.

## Mistakes

> At the outset of a data science project, you don’t know if it’s going to work. At the outset of a software engineering project, you know it’s going to work. This means that software engineering processes fail when they encounter uncertainty. By contrast, data science requires an experimental process that allows for uncertainty.

As the article says developing data science systems is fundamentally different. There are many successful processes in software engineering that can be brought over, but I think if you try to force a data science project into the same shape as an engineering project it will fail because it is held against different expectations.

I particularly like applying the concept of *Lean* practises on a data science project however. Building the simplest effective thing possible initially, getting it all the way to production, then iterating on the design and making measurable improvements.

For example, on a project I recently worked on we implemented a very simple algorithm and got it deployed, then went back and evaluated different techniques to try and improve upon it. This meant we had performance metrics throughout the process so we could see that we were improving, and we dealt with the dragons getting a system working in production up front.

It also proved that we were generating value as soon as possible. We could have spent months building a much more complex model first that would undoubtably be more accurate, but then find that the environment had changed so we no longer needed it, or that it was infeasible to run it in production.

I have also seen projects that were modelled in the first month, but then spent three months trying to get them into production, by which time the underlying environment had changed and it needed restarting because one of the base assumptions had changed. When I see things like that it reminds me of my early days in software engineering, I think there are a lot of learnings that can be brought over. 

> A lot of companies aren’t places where you can work on something that doesn’t succeed. Data science requires having that cultural space to experiment and work on things that might fail.

I think this may be one of most probable blockers to getting data science accepted within business. So many of the companies I have worked in had the wrong underlying culture to support projects not guaranteed to succeed, even if those 'failings' raised valuable information for the business.

Two of the concepts I took to heart years ago were *"embrace failure"* and *"fail fast"*. I don't think these are just applicable to software engineering or data science, but to everything you do.

If you only wait until you are positive of a successful outcome then you aren't moving fast enough. Embrace getting things wrong, analyse what happened and learn from those lessons. Everything is a learning opportunity. Apart from skydiving, maybe on that one wait for a surer outcome.

I have no idea if Edison actually said this about finding a more commercially viable bulb filament, but I like the motivation behind the story: *"I have not failed X times. I have successfully discovered X ways to not make a light bulb"*.

The other advantage is by failing quickly you can save time by not wasting it on things that don't generate value towards your goal.
