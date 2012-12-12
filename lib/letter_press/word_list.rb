require 'letter_press/word_list/node'

class LetterPress
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
