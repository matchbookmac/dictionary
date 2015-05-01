#Dictionary

<a href="http://dictionarybyian.herokuapp.com/" target="#">Link to Heroku app</a>

By Ian MacDonald (<a href="https://github.com/matchbookmac" target="#">GitHub</a>)

@ Epicodus Programming School, Portland, OR

GNU General Public License, version 3. Copyright (c) 2015 Ian C. MacDonald.

##A user-added word personal dictionary

This web app provides a tool for a user to add words to a dictionary, and add definitions to those words. The user can then later look up those words and their definitions.

## Installation

This app was written in `ruby '2.0.0'`.

Clone this repo with
```console
> git clone https://github.com/matchbookmac/dictionary.git
```

Navigate to the top level directory `word_freq` with
```console
> cd /dictionary
```

Run bundler to install the required gems
```console
> bundle install
```

Run specs in `dictionary` with
```console
> rspec
```

If all specs pass, start app at `localhost:4567`, with
```console
> ruby app.rb
```

## The method
### `String#word_freq`

The method is defined for the String class in ruby. As such, the method is called on a string, which is the word to be searched for; and also takes a string as an argument, through which the method will search for the word provided. The method will return a fixnum of the number of times the word was found in the the string provided. If the word was not found, the method will return `0`.

```ruby
> 'path'.word_freq('Little red riding hood walked down the path. On that path she met a ...')
> 2
> 'path'.word_freq('There she was just walkin\' down the street.')
> 0
```

The method will ignore punctuation in contractions and possessive, as well as capitalization.

```ruby
> 'Ian'.word_freq('Come over to Ian\'s house for tea.')
> 1
> 'won'.word_freq('Won\'t you come over to Ian\'s house for tea?')
> 1
```

It will also, however, find a contracted word within a sentence.
```ruby
> 'won\'t'.word_freq('Won\'t you ask the camel to stop spitting? He is getting spit on my wontons.')
> 1
```

It will not, however, find a word that is within another word.
```ruby
> 'won'.word_freq('Your wanton ways do not deserve any wontons.')
> 0
```
