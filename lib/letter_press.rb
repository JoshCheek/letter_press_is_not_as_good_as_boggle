require 'letter_press/board_traverser'
require 'letter_press/word_list'
require 'letter_press/word_list/searcher'
require 'set'

def LetterPress(&block)
  LetterPress.new(&block).words
end

class LetterPress
  def self.all_words
    words = File.readlines File.expand_path '../../data/word_list', __FILE__
    words.map &:chomp!
    words
  end

  def initialize(all_words=LetterPress.all_words, &definition)
    self.definition = definition
    self.searcher = searcher_for all_words
    instance_eval &definition
  end

  def searcher_for(all_words)
    WordList::Searcher.new WordList.new all_words
  end

  def board(chars)
    self.chars = chars
  end

  def guesses(guesses=nil)
    guesses && (@guesses = guesses)
    @guesses
  end

  def words
    @words ||= begin
      words = Set.new
      board_traverser.each_with_recur do |word, char, recurser|
        next unless searcher.down? char
        searcher.down char
        words << word if searcher.word? && !@guesses.include?(word)
        recurser.call
        searcher.up
      end
      words.sort_by { |word| word.length }
    end
  end

  private

  attr_accessor :chars, :searcher, :definition

  def board_traverser
    @board_traverser ||= BoardTraverser.new chars
  end
end

