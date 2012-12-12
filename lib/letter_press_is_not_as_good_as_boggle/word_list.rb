require 'letter_press_is_not_as_good_as_boggle/word_list/node'

class LetterPressIsNotAsGoodAsBoggle
  class WordList
    attr_reader :root

    def initialize(all_words=[])
      @root = Node.new ''
      all_words.each { |word| self << word }
    end

    def <<(word)
      root.add word.chars.to_a
      self
    end

    def words
      root.words
    end
  end
end
