LetterPress
===========

There's this game called LetterPress, it's sort of like Boggle, but less awesome.
It's only for the iPhone, but I have a Chocolate 1, so I can't play.
So... screw your fun!

Install
=======

`$ gem install letter_press_is_not_as_good_as_boggle`

Example
=======

```ruby
require 'letter_press_is_not_as_good_as_boggle'

LetterPressIsNotAsGoodAsBoggle do
  board %w[h z e o f
           h p h y i
           h w e b r
           x z u g o
           b i o g f]

  # omit previous guesses from results
  guesses %w[groupie
             hogger]

  # get the list of all known words that can be made on the board
  words.each { |word| puts word }
end
```

License
=======

    WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                       Version 2, December 2004

    Copyright (C) 2012 Josh Cheek <josh.cheek@gmail.com>

    Everyone is permitted to copy and distribute verbatim or modified
    copies of this license document, and changing it is allowed as long
    as the name is changed.

               DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
      TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

     0. You just DO WHAT THE FUCK YOU WANT TO.

