require 'spec_helper'

describe 'some acceptance specs' do
  specify 'words are returned sorted by length asc and do not include duplicates or previous guesses' do
    unguessed   = %w[abc ab dac]
    guessed     = %w[adc dab]
    nonmatching = %w[x nek]
    all_words   = unguessed + guessed + nonmatching

    letter_press = LetterPressIsNotAsGoodAsBoggle.new all_words do
      board   %w[a b c d a]
      guesses guessed
    end

    letter_press.words.should == %w[ab abc dac]
  end
end
