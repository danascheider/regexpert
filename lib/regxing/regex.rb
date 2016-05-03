require "regexp_parser"

module RegXing
  class Regex

    # Class Methods
    # -------------

    class << self
      def matchers
        {
          /(?<!\\)\./ => random_letter,
          /\\d/       => random_number,
          /\\w/       => random_letter,
          /\\W/       => random_non_word_character,
          /\\D/       => random_letter,
          /\\s/       => " ",
          /\\S/       => random_letter
        }
      end

      def groupings
        [ /\(.*\)/, /\[.*\]/ ]
      end

      def count_indicators
        [ /(?<!\\)\*/, /(?<!\\)\+/, /(?<!\\)\?/, /\{\d*\,?\d*\}/ ]
      end

      def anchors
        [ /^\^/, /\$$/, /^\\A/, /\\z$/ ]
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

    def extract_groupings
      groupings = []

      tree.each do |exp|
        groupings << exp if [ :group, :literal, :meta, :type, :escape ].include?(exp.type)
      end

      groupings
    end

    def split
      groupings = process_groupings(extract_groupings)

      groupings.each_with_index do |item, index|

        if is_indicator?(item, groupings[index + 1])
          groupings[index] = [ item, RegXing::Regex.process_count_indicator(groupings.delete_at(index + 1)) ]
        elsif is_anchor?(item)
          groupings[index] = nil
        else
          groupings[index] = [item, 1]
        end
      end

      groupings.compact
    end

    private

    def process_groupings(groupings)
      groupings.map do |grouping|
        if grouping.type == :literal
          grouping.to_s.split("")
        else
          grouping.to_s.scan(/(\\\.)|((?<!\\)\*)|((?<!\\)\+)|((?<!\\)\?)|(\{\d*\,?\d*\})|(\\d)|((?<!\\)\.)|(\\w)|(\\s)/)
        end
      end.flatten.compact
    end

    def tree
      Regexp::Parser.parse(expression, 'ruby/2.1')
    end

    def is_anchor?(char)
      RegXing::Regex.anchors.any? {|exp| char.match(exp) }
    end

    def is_indicator?(first, second=nil)
      RegXing::Regex.count_indicators.any? {|exp| second && second.match(exp) }
    end
  end
end
