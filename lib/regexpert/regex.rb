module Regexpert
  class Regex

    # Class Methods
    # -------------

    class << self
      def matchers
        {
          /[^\\]./             => random_letter,
          /\\d/                => random_number,
          /\\w/                => random_letter,
          /\\W/                => random_non_word_character,
          /\\D/                => random_letter,
          /\\h/                => random_hexdigit_character,
          /\\H/                => random_non_hexdigit_character,
          /\\s/                => " ",
          /\\S/                => random_letter,
          /\[\[\:alnum\:\]\]/  => random_letter,
          /\[\[\:alpha\:\]\]/  => random_letter,
          /\[\[\:digit\:\]\]/  => random_number,
          /\[\[\:graph\:\]\]/  => random_letter,
          /\[\[\:lower\:\]\]/  => random_lowercase_letter,
          /\[\[\:print\:\]\]/  => random_letter,
          /\[\[\:xdigit\:\]\]/ => random_hexdigit_character,
          /\[\[\:punct\:\]\]/  => random_non_word_character,
          /\[\[\:space\:\]\]/  => " ",
          /\[\[\:cntrl\:\]\]/  => "\a",
          /\[\[\:upper\:\]\]/  => random_uppercase_letter
        }
      end

      private

      def random_letter
        ("a".."z").to_a.sample
      end

      alias_method :random_lowercase_letter, :random_letter

      def random_uppercase_letter
        ("A".."Z").to_a.sample
      end

      def random_number
        (0..9).to_a.sample.to_s
      end

      def random_non_word_character
        non_word_characters.sample
      end

      def random_hexdigit_character
        [(0..9).to_a.map(&:to_s), ("A".."F").to_a, ("a".."f").to_a].flatten.sample
      end

      def random_non_hexdigit_character
        ("h".."z").to_a.sample
      end

      def non_word_characters
        [
          "~", "!", "@", "#", "%", "&", "*", "(", ")", "-", "{", "}",
          "[", "]", "\\", "'", "\"", ":", ";", ",", ".", "?", "/"
        ]
      end
    end

    # Instance Methods
    # ----------------

    attr_reader :expression

    def initialize(exp)
      @expression = exp
    end

    def to_s
      expression.inspect[1..-2]
    end

    def split
      to_s.scan(/(\\\.|[^\\]?\.|\\\+|[^\\]?\+|\\\*|[^\\]?\*|\\[a-z]|[^\\]?[a-z]|\{\d*\,\d*\})/).flatten
    end
  end
end
