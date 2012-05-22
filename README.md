brainrb
=======

What is brainrb?
----------------

It is an interpreter for the brainfuck programming language.

Why?
----

I had two goals when building brainrb:

 * To make a minimal but capable brainfuck interpreter
 * To make a clear and understandable example of implementing a simple interpreter in Ruby
 
The code should be straightforward to read and understand, even for Ruby beginners.

Requirements
------------

brainrb depends on the gems Trollop and HighLine. Both can be installed with rubygems:

```
gem install trollop highline
```

Trollop is used to parsing command line options, and HighLine is used for reading individual characters without waiting for a line break.

What is brainfuck?
------------------

brainfuck is a minimal programming language and turing tarpit designed primarily
to amuse programmers. It is technically capable but of little practical use.

Definition of "turing tarpit" from *Epigrams on Programming* by Alan Perlis:

> Beware of the Turing tar-pit in which everything is possible but nothing of interest is easy.

See Wikipedia for a [comprehensive explanation](http://en.wikipedia.org/wiki/Brainfuck).
