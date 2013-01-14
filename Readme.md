LetterPressIsNotAsGoodAsBoggle
==============================

There's this game called LetterPress, it's sort of like Boggle, but less awesome.
But that doesn't mean that _you_ can't be awesome!

![screenshot](https://raw.github.com/JoshCheek/letter_press_is_not_as_good_as_boggle/master/data/screenshot.jpg)


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

  guessed %w[groupie
             hogger]

  # get the list of all known words that can be made on the board
  # unless hey have already been guessed
  words.each { |word| puts word }
end
```

WTF Public License
==================

    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                       Version 2, December 2004

    Copyright (C) 2012 Josh Cheek <josh.cheek@gmail.com>

    Everyone is permitted to copy and distribute verbatim or modified
    copies of this license document, and changing it is allowed as long
    as the name is changed.

               DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
      TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

     0. You just DO WHAT THE FUCK YOU WANT TO.

