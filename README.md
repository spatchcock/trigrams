# Trigrams

A simple text excerpt generator based on trigram patterns.

Author: Andrew Berkeley

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
```

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
5. Full-stops ("."), commas (","), colons (":") and semi-colons (";") are considered to be valid 'words' - that is, they are generated according to the trigram rules established by the training set.
6. In the case that a trigram match is not present within the training set for a given pair of (ordered) tokens, a single match on one of the tokens (in the correct position within the duple) is used, with the specific trigram used chosen at random from the available matches.
7. Where the final sentence does not end with a full stop, more words are added until a full stop occurs. This means that the actual word count may exceed the desired word count.


## To do

* Improve heuristics around paragraphs, quotes and parentheses.

# License

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program (see the COPYING file).  If not, see
<http://www.gnu.org/licenses/>.