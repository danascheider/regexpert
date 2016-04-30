module RegXing
  class Regex

    # Class Methods
    # -------------

    class << self
      def matchers
        {
          /(?<!\\)\./          => random_letter,
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

      def count_indicators
        [ /(?<!\\)\*/, /(?<!\\)\+/, /(?<!\\)\?/, /\{\d*\,?\d*\}/ ]
      end

      def anchors
        [ /^\^/, /\$$/, /^\\A/, /\\z$/ ]
      end

      def posix
        /\[\[\:[a-z]{5,6}\:\]\]/
      end

      def is_posix?(string)
        string.match(posix) ? true : false
      end

      def process_count_indicator(indicator)
        if indicator.match count_indicators.last

          minimum = indicator.match(/(?<=\{)\d+/) ? indicator.match(/(?<=\{)\d+/)[0].to_i : 1

          return minimum
        else
          return 1
        end
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
          "!", "@", "#", "%", "&", "*", "(", ")", "-", "{", "}",
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

    def extract_groupings
      to_s.split(/[\(\)\[)\]](?![\[\]])(?<![\[\]])/).reject {|str| str == "" }
    end

    def is_anchor(char)
      RegXing::Regex.anchors.any? {|exp| char.match(exp) }
    end

    def return_matches(string)
      string.scan(/\\\||\\\?|[^\\]?\?|\\\.|[^\\]?\.|\\\+|[^\\]?\+|\\\*|[^\\]?\*|\\[a-zA-Z]|(?<!\\)[a-zA-Z]|\{\d*\,?\d*\}|\[\[\:.{5,6}\:\]\]|./).flatten
    end

    def is_indicator(first, second=nil)
      RegXing::Regex.count_indicators.any? {|exp| second && second.match(exp) }
    end

    def split
      arr = extract_groupings.map {|item| return_matches item }.flatten

      arr.each_with_index do |item, index|
        if is_indicator(item, arr[index + 1])
          arr[index] = [ item, RegXing::Regex.process_count_indicator(arr.delete_at(index + 1)) ]
        elsif is_anchor(item)
          arr[index] = nil
        else
          arr[index] = [item, 1]
        end
      end

      arr.compact
    end
  end
end
