$LOAD_PATH.unshift File.expand_path '../lib', __FILE__
require 'letter_press_is_not_as_good_as_boggle'

LetterPressIsNotAsGoodAsBoggle do
  board %w[h z e o f
           h p h y i
           h w e b r
           x z u g o
           b i o g f]

  guesses %w[groupie
             hogger]

  # get the list of all known words that can be made on the board
  # unless hey have already been guessed
  words.each { |word| puts word }
end
