require "arabic2english/version"
require 'to_words'

module Arabic2english
  module_function

  def integer2word(number)
    number.to_words
  end
end
