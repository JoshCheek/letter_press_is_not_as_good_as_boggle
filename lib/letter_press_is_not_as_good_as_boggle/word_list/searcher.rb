class LetterPressIsNotAsGoodAsBoggle
  class WordList
    class Searcher
      NoPath = Class.new StandardError

      attr_reader :word_list

      def initialize(word_list)
        @node = word_list.root
      end

      def has_child?(char)
        @node.child? char
      end

      def down_to(char)
        raise NoPath, "No path #{@node.to_s << char}." unless has_child? char
        @node = @node.child char
        if block_given?
          begin
            yield
          ensure
            up
          end
        end
      end

      def current
        @node.to_s
      end

      def up
        new_node = @node.parent
        raise NoPath, "Can't go up from root." unless new_node
        @node = new_node
      end

      def on_word?
        @node.word?
      end
    end
  end
end
