class Cipher
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def shift(word)
    # @alphabet.map do |letter|
    #   letter.o
  end
end