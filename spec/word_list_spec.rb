require 'letter_press/word_list'

describe LetterPress::WordList do
  it 'knows all the words that were added to it' do
    word_list = LetterPress::WordList.new
    word_list.words.should == []
    word_list << "abc"
    word_list << "abcd"
    word_list << "ecx"
    word_list.words.should == ["abc", "abcd", "ecx"]
  end
end
