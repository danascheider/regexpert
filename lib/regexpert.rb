module Regexpert
  class << self
    def generate(regex)
      regex = regex.inspect[1..-2]

      if regex.match(/\./) || regex.match(/\\w/)
        "a"
      elsif regex.match(/\\d/)
        "1"
      elsif regex.mat
      end
    end
  end
end
