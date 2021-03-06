require 'letter_press_is_not_as_good_as_boggle/board_traverser'
require 'letter_press_is_not_as_good_as_boggle/word_list'
require 'letter_press_is_not_as_good_as_boggle/word_list/searcher'
require 'set'

def LetterPressIsNotAsGoodAsBoggle(&block)
  LetterPressIsNotAsGoodAsBoggle.new(&block).words
end

class LetterPressIsNotAsGoodAsBoggle
  def self.all_words
    File.read(File.expand_path '../../data/word_list', __FILE__).split("\n")
  end

  def initialize(all_words=LetterPressIsNotAsGoodAsBoggle.all_words, &definition)
    @guessed = []
    self.searcher = WordList::Searcher.new WordList.new all_words
    instance_eval &definition
  end

  def board(chars)
    self.chars = chars
  end

  def guessed(guessed=[])
    @guessed = guessed
  end
  alias guesses guessed # to maintain backwards compatibility

  def words
    @words ||= begin
      words = Set.new
      board_traverser.each_with_recur do |word, char, recurser|
        next unless searcher.has_child? char
        searcher.down_to char do
          words << word if searcher.on_word? && !@guessed.include?(word)
          recurser.call
        end
      end
      words.sort_by &:length
    end
  end

  private

  attr_accessor :chars, :searcher

  def board_traverser
    @board_traverser ||= BoardTraverser.new chars
  end
end
