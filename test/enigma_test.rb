require './test/test_helper'
require './lib/enigma'
require 'date'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.alphabet
  end

  def test_it_encrypts
    expected = {
          encryption: "keder ohulw",
          key: "02715",
          date: "040895"
        }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  # def test_it_decrypts
  #   expected = {
  #     encryption: "hello world",
  #     key: "02715",
  #     date: "040895"
  #   }

  #   assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  # end

  # def test_it_can_shift_letters
  #   assert_equal "k", @cipher.shift("h")
  # end
end