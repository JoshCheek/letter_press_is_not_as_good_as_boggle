require 'letter_press_is_not_as_good_as_boggle/word_list'

describe LetterPressIsNotAsGoodAsBoggle::WordList do
  it 'knows all the words that were added to it' do
    word_list = LetterPressIsNotAsGoodAsBoggle::WordList.new
    word_list.words.should == []
    word_list << "abc"
    word_list << "abcd"
    word_list << "ecx"
    word_list.words.should == ["abc", "abcd", "ecx"]
  end
end
