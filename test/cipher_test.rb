require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/cipher'

class CipherTest < Minitest::Test
  def setup
  @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end
end