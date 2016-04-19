module Regexpert
  class Generator
    attr_accessor :regex

    def initialize(regex)
      @regex = Regexpert::Regex.new(regex)
    end

    def generate!
      expression = regex.to_s
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
