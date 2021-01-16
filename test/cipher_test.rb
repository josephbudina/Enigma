require './test/test_helper'
require './lib/cipher'

class CipherTest < Minitest::Test
  def setup
  @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @cipher.alphabet
  end

  def test_it_can_shift_letters
    assert_equal "k", @cipher.shift("h")
  end
end