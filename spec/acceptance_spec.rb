require 'spec_helper'

describe LetterPressIsNotAsGoodAsBoggle do
  specify 'words are returned sorted by length asc and do not include duplicates or previous guesses' do
    unguessed_words   = %w[abc ab dac]
    guessed_words     = %w[adc dab]
    nonmatching_words = %w[x nek]
    all_words         = unguessed_words + guessed_words + nonmatching_words

    letter_press = LetterPressIsNotAsGoodAsBoggle.new all_words do
      board   %w[a b c d a]
      guessed guessed_words
    end

    letter_press.words.should == %w[ab abc dac]
  end

  specify 'assumes no guesses by default' do
    LetterPressIsNotAsGoodAsBoggle.new(%w[a b c]) { board %w[a b] }.words.should == %w[a b]
  end
end
