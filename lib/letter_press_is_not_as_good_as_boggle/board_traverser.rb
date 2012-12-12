class LetterPressIsNotAsGoodAsBoggle
  class BoardTraverser

    attr_accessor :characters

    def initialize(characters)
      self.characters = characters
    end

    def each_with_recur(&block)
      recursive_each_with_recur "", [], block
    end

    def recursive_each_with_recur(current, path, block)
      characters.each do |char|
        next if path.any? { |path_char| path_char.equal? char }
        new_current = current + char
        path.push char
        recurser = lambda { recursive_each_with_recur new_current, path, block }
        block.call new_current, char, recurser
        path.pop
      end
    end

  end
end

