module RegXing
  class Generator
    attr_accessor :regex

    def initialize(regex)
      @regex = RegXing::Regex.new(regex)
    end

    def generate!
      str   = ""

      regex.split.each do |el|
        str << compile(el.first) * el.last
      end

      str
    end

    private

    def compile(el)
      if expr = RegXing::Regex.matchers.find {|exp, val| el.match(exp) }
        expr.last
      else
        el
      end
    end
  end
end
