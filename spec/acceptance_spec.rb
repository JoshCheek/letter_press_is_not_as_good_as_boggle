require 'spec_helper'

describe 'some acceptance specs' do
  specify 'words are returned sorted by length asc and do not include duplicates or previous guesses' do
    unguessed   = %w[ab abc dac]
    guessed     = %w[adc dab]
    nonmatching = %w[x nek]
    all_words   = unguessed + guessed + nonmatching

    letter_press = LetterPress.new all_words do
      board   %w[a b c d a]
      guesses %w[adc dab]
    end

    letter_press.words.should == %w[ab abc dac]
  end
end
