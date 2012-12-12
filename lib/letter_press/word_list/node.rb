class LetterPress
  class WordList
    class Node
      attr_reader :parent

      def initialize(char, parent=nil)
        @char, @parent, @children = char, parent, Hash.new
      end

      def add(chars)
        if chars.empty?
          is_word!
          return
        end
        char = chars.shift
        add_child char, chars
      end

      def child?(char)
        @children.has_key? char
      end

      def child(char)
        @children.fetch char
      end

      def word?
        @is_word
      end

      def to_s
        @parent.to_s << @char
      end

      def words
        words = []
        words << to_s if word?
        @children.each { |char, child| words.concat child.words }
        words
      end

      def inspect
        "#<Dictionary::Node #{to_s}>"
      end

      private

      def add_child(char, chars)
        @children[char] ||= Node.new char, self
        @children[char].add chars
      end

      def is_word!
        @is_word = true
      end
    end
  end
end

