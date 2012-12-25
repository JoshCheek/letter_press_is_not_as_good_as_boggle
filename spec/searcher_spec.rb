require 'letter_press_is_not_as_good_as_boggle/word_list/searcher'

class LetterPressIsNotAsGoodAsBoggle
  describe WordList::Searcher do
    let(:word_list) { WordList.new }
    let(:searcher)  { WordList::Searcher.new word_list }

    before do
      word_list << 'they'
      word_list << 'then'
    end

    it 'can go down a char' do
      searcher.down('t')
      searcher.down('h')
      searcher.current.should == 'th'
    end

    it 'can go back up a char' do
      searcher.down('t')
      searcher.down('h')
      searcher.up
      searcher.current.should == 't'
    end

    it "raises an error if told to go down to a char doesn't make a word" do
      searcher.down 't'
      expect { searcher.down('a') }.to raise_error WordList::Searcher::NoPath, /ta/
    end

    it 'raises an error if told to go up from the root' do
      expect { searcher.up }.to raise_error WordList::Searcher::NoPath, /root/
    end

    it 'knows when it is on a word in the word list' do
      searcher.should_not be_on_word
      searcher.down('t')
      searcher.should_not be_on_word
      searcher.down('h')
      searcher.should_not be_on_word
      searcher.down('e')
      searcher.should_not be_on_word
      searcher.down('n')
      searcher.should be_on_word
    end

    it 'knows what paths it can go down' do
      searcher.should be_down 't'
      searcher.should_not be_down 'a'
    end

    example 'acceptance' do
      searcher.should_not be_on_word
      searcher.down 't'
      searcher.should_not be_on_word
      searcher.down 'h'
      searcher.should_not be_on_word
      searcher.down 'e'
      searcher.should_not be_on_word
      searcher.down 'n'
      searcher.should be_on_word
      searcher.current.should == 'then'
      searcher.up
      searcher.down 'y'
      searcher.should be_on_word
      searcher.current.should == 'they'
      searcher.up
      searcher.up
      searcher.up
      searcher.up
      expect { searcher.up }.to raise_error WordList::Searcher::NoPath
    end
  end
end
