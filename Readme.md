LetterPress
===========

There's this game for the iPhone called LetterPress.
I can't play because I have an LG Chocolate 1.
So... screw your fun!

Install
=======

`$ gem install letter_press`

Example
=======

```ruby
require 'letter_press'

LetterPress do
  board %w[h z e o f
           h p h y i
           h w e b r
           x z u g o
           b i o g f]

  guesses %w[groupie
             hogger]

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

