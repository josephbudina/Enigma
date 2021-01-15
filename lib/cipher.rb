class Cipher
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end
end