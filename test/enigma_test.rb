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

  def test_it_splits_the_key
    assert_equal 02, @enigma.split_keys("02715")[:a]
    assert_equal 27, @enigma.split_keys("02715")[:b]
    assert_equal 71, @enigma.split_keys("02715")[:c]
    assert_equal 15, @enigma.split_keys("02715")[:d]
  end

  # def test_it_encrypts
  #   expected = {
  #         encryption: "keder ohulw",
  #         key: "02715",
  #         date: "040895"
  #       }

  #   assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  # end

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