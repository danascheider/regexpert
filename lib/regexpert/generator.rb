module Regexpert
  class Generator
    attr_accessor :regex

    def initialize(regex)
      @regex = Regexpert::Regex.new(regex)
    end

    def generate!
      expression = regex.to_s
      str   = ""

      str << regex.split.each do |el|
        expr = Regexpert::Regex.matchers.find {|exp, val| el.match(exp) } ? expr.last : el
      end

      str
    end
  end
end
