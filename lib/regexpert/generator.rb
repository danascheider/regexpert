module Regexpert
  class Generator
    def generate(regex)
      regex = regex.inspect[1..-2]
      str   = ""

      Regex.matchers.each do |exp, val|
        if regex.match(exp)
          str << val
        end
      end

      str
    end
  end
end
