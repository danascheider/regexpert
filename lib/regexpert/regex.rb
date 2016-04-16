module Regexpert
  class Regex
    class << self
      def matchers
        {
          /[^\\]./ => random_letter,
          /\\d/ => random_number,
          /\\w/ => random_letter,
          /\\W/ => random_non_word_character,
          /\\D/ => random_letter,
          /\\h/ => random_hexdigit_character,
          /\\H/ => random_non_hexdigit_character,
          /\\s/ => " ",
          /\\S/ => random_letter,
        }
      end

      private
      def random_letter
        ("a".."z").to_a.sample
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
          "~", "`", " ", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "+", "=",
          "{", "}", "[", "]", "\\", "|", "'", "\"", ":", ";", ",", "<", ".", ">", "?", "/"
        ]
      end
    end
  end
end
