# Trigrams

A simple text excerpt generator based on trigram patterns.

Licensed under the BSD 3-Clause license (See LICENSE.txt for details)

Author: Andrew Berkeley

Copyright: Copyright (c) 2012 Andrew Berkeley

## INTRODUCTION

Trigrams enables the generation of text excerpts based on trigram patterns established from a source text.

## REQUIREMENTS

 * Ruby

## USAGE
Trigram patterns are established on the basis of a 'training set' text formatted as plain text. An example text is available under /data/call_of_the_wild.txt.

Create a 'training set' based upon an existing text:

```ruby

    training_set = Trigram::TrainingSet.new('data/call_of_the_wild.txt')
```

Create an instance of Trigram::Excerpt, using the instantiated TrainingSet:

```ruby

    excerpt = Trigram::Excerpt.new(training_set)
```ruby

Generate an excerpt, specifying the desired word count:

```ruby

    excerpt.generate(5) #=> ["Led", "by", "the", "hairy", "man", "sleeping", "by", "the", "side", "."] 
    excerpt.text        #=> "Led by the hairy man sleeping by the side." 
```

## Heuristics

1. Text is generated iteratively on the basis of trigram patterns - the current last two tokens are matched against the trigrams established from the training set data. A 'valid' third token is appended (chosen at random from the available matches), and the process repeated.
2. Text is initially bootstrapped on the basis of a random two-word phrase (termed a 'duple') found in the training set.
3. The bootstrap phrase is capitalised.
4. Quotes ('"'), parentheses ('(', ')') and new lines ('\r','\n') are ignored in the training set.
5. Full-stops ("."), commas (","), colons (":") and semi-colons (";") are considered to be valid 'words' - that is, they are represented within trigram structures.
6. In the case that a trigram match is not present within the training set for a given pair of (ordered) tokens, a single match on one of the tokens is used, with the specific trigram used chosen at random from the available matches.
7. Where the final sentence does not end with a full stop, more words are added until a full stop occurs. This means that the actual word count may exceed the desired word count.


## TO DO

* Improve heuristics around paragraphs, quotes and parentheses.

