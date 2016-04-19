module RegXing
  class Generator
    attr_accessor :regex

    def initialize(regex)
      @regex = RegXing::Regex.new(regex)
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
      if expr = RegXing::Regex.matchers.find {|exp, val| el.match(exp) }
        expr.last
      elsif el.match(/\{\d+\,?\d*\}/)
        min, max = el.match(/\d+/).to_a
      else
        el
      end
    end
  end
end
