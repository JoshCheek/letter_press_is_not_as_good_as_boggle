class LetterPressIsNotAsGoodAsBoggle
  class WordList
    class Searcher
      NoPath = Class.new StandardError

      attr_reader :word_list

      def initialize(word_list)
        @node = word_list.root
      end

      def down?(char)
        @node.child? char
      end

      def down(char)
        raise NoPath, "No path #{@node.to_s << char}." unless down? char
        @node = @node.child char
      end

      def current
        @node.to_s
      end

      def up
        new_node = @node.parent
        raise NoPath, "Can't go up from root." unless new_node
        @node = new_node
      end

      # rename to on_word?
      def word?
        @node.word?
      end
    end
  end
end
