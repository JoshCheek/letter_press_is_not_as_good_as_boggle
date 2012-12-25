require 'letter_press_is_not_as_good_as_boggle/word_list'
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
      searcher.down_to 't'
      searcher.down_to 'h'
      searcher.current.should == 'th'
    end

    it 'can go back up a char' do
      searcher.down_to 't'
      searcher.down_to 'h'
      searcher.up
      searcher.current.should == 't'
    end

    it 'can temporarily go down a char' do
      searcher.current.should == ''
      searcher.down_to 't' do
        searcher.current.should == 't'
      end
      searcher.current.should == ''
    end

    specify 'when temporarily going down, it comes back up even if an exception was raised' do
      expect do
        searcher.down_to 't' do
          searcher.current.should == 't'
          raise 'whatev'
        end
      end.to raise_exception 'whatev'
      searcher.current.should == ''
    end

    it "raises an error if told to go down to a char doesn't make a word" do
      searcher.down_to 't'
      expect { searcher.down_to 'a' }.to raise_error WordList::Searcher::NoPath, /ta/
    end

    it 'raises an error if told to go up from the root' do
      expect { searcher.up }.to raise_error WordList::Searcher::NoPath, /root/
    end

    it 'knows when it is on a word in the word list' do
      searcher.should_not be_on_word
      searcher.down_to 't'
      searcher.should_not be_on_word
      searcher.down_to 'h'
      searcher.should_not be_on_word
      searcher.down_to 'e'
      searcher.should_not be_on_word
      searcher.down_to 'n'
      searcher.should be_on_word
    end

    it 'knows what paths it can go down' do
      searcher.should have_child 't'
      searcher.should_not have_child 'a'
    end

    example 'acceptance' do
      searcher.should_not be_on_word
      searcher.down_to 't'
      searcher.should_not be_on_word
      searcher.down_to 'h'
      searcher.should_not be_on_word
      searcher.down_to 'e'
      searcher.should_not be_on_word
      searcher.down_to 'n'
      searcher.should be_on_word
      searcher.current.should == 'then'
      searcher.up
      searcher.down_to 'y'
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
