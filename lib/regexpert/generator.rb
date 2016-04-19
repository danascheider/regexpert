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
        str << compile(el)
      end

      str
    end

    private

    def compile(el)
      if expr = Regexpert::Regex.matchers.find {|exp, val| el.match(exp) }
        expr.last
      else
        el
      end
    end
  end
end
