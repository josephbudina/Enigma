class CaesarCipher
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end 

  def split_key(key)
    split_keys = {
      a: key[0..1].to_i,
      b: key[1..2].to_i,
      c: key[2..3].to_i,
      d: key[3..4].to_i
    }
  end
end