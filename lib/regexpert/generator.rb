module Regexpert
  class Generator
    attr_accessor :regex

    def initialize(regex)
      @regex = regex
    end

    def generate!
      expression = regex.inspect[1..-2]
      str   = ""

      Regex.matchers.each do |exp, val|
        if expression.match(exp)
          str << val
        end
      end

      str
    end
  end
end
