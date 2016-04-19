module Regexpert
  class Generator
    attr_accessor :regex

    def initialize(regex)
      @regex = Regexpert::Regex.new(regex)
    end

    def generate!
      expression = regex.to_s
      str   = ""

      regex.split.each do |el|
        if expr = Regexpert::Regex.matchers.find {|exp, val| el.match(exp) }
          str << expr.last
        else
          str << el
        end
      end

      # Regex.matchers.each do |exp, val|
      #   if expression.match(exp)
      #     str << val
      #   end
      # end

      str
    end
  end
end
