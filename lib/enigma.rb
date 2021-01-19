require 'date'
require_relative 'caesar_cipher'

class Enigma < CaesarCipher
  def initialize
    super
  end

  def encrypt(message, key = random_key, date = todays_date)
    encrypted = {
      encryption: encrypt_message(message, key, date).join,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = todays_date)
    expected = {
      encryption: decrypt_message(message, key, date).join,
      key: key,
      date: date
    }
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def random_key
    rand(99_999).to_s.rjust(5,"0")
  end
end
