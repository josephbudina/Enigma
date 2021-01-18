require './test/test_helper'
require './lib/caesar_cipher'

class CaesarCipherTest < Minitest::Test
  def setup
  @cipher = CaesarCipher.new
  end

  def test_it_exists
    assert_instance_of CaesarCipher, @cipher

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @cipher.alphabet
  end

  def test_it_splits_the_key
    assert_equal 02, @cipher.split_key("02715")[:a]
    assert_equal 27, @cipher.split_key("02715")[:b]
    assert_equal 71, @cipher.split_key("02715")[:c]
    assert_equal 15, @cipher.split_key("02715")[:d]
  end

  def test_it_squares_the_date
    assert_equal "1672401025", @cipher.date_squared("040895")
  end

  def test_it_has_offsets
    assert_equal 1, @cipher.offsets("040895")[:a]
    assert_equal 0, @cipher.offsets("040895")[:b]
    assert_equal 2, @cipher.offsets("040895")[:c]
    assert_equal 5, @cipher.offsets("040895")[:d]
  end

  def test_it_shifts
    assert_equal 3, @cipher.shift("02715", "040895")[:a]
    assert_equal 27, @cipher.shift("02715", "040895")[:b]
    assert_equal 73, @cipher.shift("02715", "040895")[:c]
    assert_equal 20, @cipher.shift("02715", "040895")[:d]
  end
  
  def test_it_unshifts
    assert_equal -3, @cipher.unshift("02715", "040895")[:a]
    assert_equal -27, @cipher.unshift("02715", "040895")[:b]
    assert_equal -73, @cipher.unshift("02715", "040895")[:c]
    assert_equal -20, @cipher.unshift("02715", "040895")[:d]
  end

  def test_it_can_generate_random_key
    assert_instance_of String, @cipher.random_key
    assert_equal 5, @cipher.random_key.length
    assert @cipher.random_key.to_i >= 0
    assert @cipher.random_key.to_i <= 99_999
  end

  def test_it_adds_date
    Date.stubs(:today).returns(Date.new(2020, 8, 4))
    assert_equal "040820", @cipher.todays_date
  end

  def test_it_can_shift_letters
    assert_equal "b", @cipher.shift_letters(1, "a")
    assert_equal " ", @cipher.shift_letters(1, "z")
    assert_equal "c", @cipher.shift_letters(5, "y")
    assert_equal "a", @cipher.shift_letters(2, "z")
    assert_equal "b", @cipher.shift_letters(92, "r")
  end
end