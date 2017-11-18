---
title: "Creating Labeled Training Data Programatically"
date: 2017-09-15T08:41:30Z
draft: true
categories: ['datascience']
featured: ""
featuredpath: ""
featuredalt: ""
linktitle: ""
type: "post"
---
5 hours back to my home town gives me the opportunity to catch up on some reading. That particularly journey was all about how to build data, because without it you're pretty much stuck.

[Creating large training data sets quickly](https://www.oreilly.com/ideas/creating-large-training-data-sets-quickly)

[Podcast](https://soundcloud.com/oreilly-radar/creating-large-training-data-sets-quickly)

Creating a framework for quickly building large training data sets.

Researchers at Stanford have shown that high quality models can be constructed from low quality / noisy training data.

> By developing a framework for mining low-quality sources in order to build high-quality machine learning models, Ré and his collaborators help researchers extract information previously hidden in unstructured data sources.

[Weak supervision](https://arxiv.org/abs/1605.07723)

> Deep learning models can automate the feature engineering process, but they are more complex and they need more training data to fit to their parameters.

A lot of the success deep learning models have had over the past few years has been built on large high quality labeled training sets that took years to create. But the demand for data is only growing, and businesses don't have the time or opportunity to take years to build new data sets. The applications change over time as well, and high quality today may not apply to a different problem next month.

One of the ways to reduce this constraint or bottleneck is through weak supervision, where we make it easier for human input to provide supervision to the model. 

It's a supply chain problem - theory of constraints. But the goods being moved in this case are data

[Data programming](https://arxiv.org/abs/1605.07723) is a general, flexible framework for using weak supervision to train some end model that you want to train without necessarily having any hand-labeled training data.

## Abstract

Demand for labeled training data is only get larger, but business have time constraints around creating it. I read some articles recently that might be of interest to others.

Weak supervision and active learning are processes to create labelled training data through the combination of algorithms and domain experts, without necessarily starting with any hand-labelled training data.

Essentially it is a pipeline with two modelling stages - first is input from domain experts by writing functions that take a data point and output a label or abstain. Then weight the responses and get an output of probalistic training labels.

These feed the second part, where the end model learns from the data points that got a lot of high confidence votes. Snorkel is one tool right now that applies this concept.

Couple of related posts (there are podcast links in the posts as well):
[Creating large training data sets quickly](https://www.oreilly.com/ideas/creating-large-training-data-sets-quickly)
[Data preparation in the age of deep learning](https://www.oreilly.com/ideas/data-preparation-in-the-age-of-deep-learning)