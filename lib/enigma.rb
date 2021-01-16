class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def split_keys(key)
    split_keys = {
      a: key[0..1].to_i,
      b: key[1..2].to_i,
      c: key[2..3].to_i,
      d: key[3..4].to_i
    }
  end

  def encrypt(message, key, date)
    a_key = key[0..1].to_i
    b_key = key[1..2].to_i
    c_key = key[2..3].to_i
    d_key = key[3..4].to_i
    date_squared = date.to_i ** 2
    date_squared_string = date_squared.to_s
    offset_a = date_squared_string[-4].to_i
    offset_b = date_squared_string[-3].to_i
    offset_c = date_squared_string[-2].to_i
    offset_d = date_squared_string[-1].to_i
    a_shift = a_key + offset_a
    b_shift = b_key + offset_b
    c_shift = c_key + offset_c
    d_shift = d_key + offset_d
    # encrypted = Hash.new(0)
    # encrypted[:encryption] = message
    # encrypted[:key] = key
    # encrypted[:date] = date
    # encrypted
  end
end
