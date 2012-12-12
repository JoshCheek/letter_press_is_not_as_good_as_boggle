$LOAD_PATH.unshift File.expand_path '../lib', __FILE__
require 'letter_press_is_not_a_game_of_skill'

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
