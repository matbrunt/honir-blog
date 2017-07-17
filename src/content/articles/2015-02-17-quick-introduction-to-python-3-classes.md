---
title: "Quick Introduction to Python 3 Classes"
date: 2015-02-17T16:05:43Z
draft: false
categories: []
featured: ""
featuredpath: ""
featuredalt: ""
linktitle: ""
type: "post"
---
If you are looking for a good introduction to Python 3 Classes then the [Python Classes Strike Again](http://blog.thedigitalcatonline.com/blog/2014/08/20/python-3-oop-part-2-classes-and-members/) post by Leonardo Giordani is very good.

	class Door:
		colour = 'brown'

		def __init__(self, number, status):
			self.number = number
			self.status = status

		@classmethod
		def knock(cls):
			print("Knock!")

		@classmethod
		def paint(cls, colour):
			cls.colour = colour

		def open(self):
			self.status = 'open'

		def close(self):
			self.status = 'closed'

> The `paint()` class method now changes the class attribute `colour` which is shared amongst instances. The class method can be called on the class, but this affects both the class and the instances, since the colour attribute of instances is taken at runtime from the shared class.

	>>> door1 = Door(1, 'closed')
	>>> door2 = Door(2, 'closed')
	>>> Door.colour
	'brown'
	>>> door1.colour
	'brown'
	>>> door2.colour
	'brown'
	>>> Door.paint('white')
	>>> Door.colour
	'white'
	>>> door1.colour
	'white'
	>>> door2.colour
	'white'

It covers the basics, along with class functions and instance methods.

	>>> Door.open
	<function Door.open at 0xb687e074>
	>>> door1.open
	<bound method Door.open of <__main__.Door object at 0xb6f9834c>>
	>>> type(Door.open)
	<class 'function'>
	>>> type(door1.open)
	<class 'method'>

> As you can see, Python tells the two apart recognizing the first as a function and the second as a method, where the second is a function bound to an instance. Class methods are functions that are bound to the class and not to an instance.

There is also a link within the article to the code as an [iPython notebook](http://blog.thedigitalcatonline.com/notebooks/Python_3_OOP_Part_2__Classes_and_members.ipynb).