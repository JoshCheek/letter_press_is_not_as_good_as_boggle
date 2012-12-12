require 'letter_press'

describe 'traversing the board' do
  it 'traverses each possibility, yielding the current word, current char and a recur object' do
    words = []
    LetterPress::BoardTraverser.new(%w[a b c]).each_with_recur do |word, char, recurser|
      word.should end_with char
      words << word
      recurser.call
    end
    words.should =~ %w[a b c ab ac abc acb ba bc bac bca ca cb cab cba]
  end

  it "recurses when called, and doesn't when not called" do
    words = []
    LetterPress::BoardTraverser.new(%w[a b c]).each_with_recur do |word, char, recurser|
      words << word
      recurser.call if word.end_with?("a")
    end
    words.should =~ %w[a b c ab ac]
  end
end
