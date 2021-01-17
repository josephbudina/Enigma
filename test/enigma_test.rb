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
    assert_equal 02, @enigma.split_key("02715")[:a]
    assert_equal 27, @enigma.split_key("02715")[:b]
    assert_equal 71, @enigma.split_key("02715")[:c]
    assert_equal 15, @enigma.split_key("02715")[:d]
  end

  def test_it_squares_the_date
    assert_equal "1672401025", @enigma.date_squared("040895")
  end

  def test_it_has_offsets
    assert_equal 1, @enigma.offsets("040895")[:a]
    assert_equal 0, @enigma.offsets("040895")[:b]
    assert_equal 2, @enigma.offsets("040895")[:c]
    assert_equal 5, @enigma.offsets("040895")[:d]
  end

  def test_it_shifts
    assert_equal 3, @enigma.shift("02715", "040895")[:a]
    assert_equal 27, @enigma.shift("02715", "040895")[:b]
    assert_equal 73, @enigma.shift("02715", "040895")[:c]
    assert_equal 20, @enigma.shift("02715", "040895")[:d]
  end

  def test_it_can_generate_random_key
    assert_instance_of String, @enigma.random_key
    assert_equal 5, @enigma.random_key.length
    assert @enigma.random_key.to_i >= 0
    assert @enigma.random_key.to_i <= 99_999
  end

  def test_it_encrypts
    expected = {
          encryption: "keder ohulw",
          key: "02715",
          date: "040895"
        }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_shift_letters
    assert_equal "b", @enigma.shift_letters(1, "a")
    assert_equal " ", @enigma.shift_letters(1, "z")
    assert_equal "c", @enigma.shift_letters(5, "y")
    assert_equal "a", @enigma.shift_letters(2, "z")
    assert_equal "b", @enigma.shift_letters(92, "r")
  end

  # def test_it_decrypts
  #   expected = {
  #     encryption: "hello world",
  #     key: "02715",
  #     date: "040895"
  #   }

  #   assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  # end
end