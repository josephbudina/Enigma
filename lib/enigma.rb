class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
  encrypted = Hash.new(0)
  encrypted[:encryption] = message
  encrypted[:key] = key
  encrypted[:date] = date
  encrypted
  end
end
