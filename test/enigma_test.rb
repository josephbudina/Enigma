require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/enigma'
require 'date'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_encrypts
    expected = {
          encryption: "keder ohulw",
          key: "02715",
          date: "040895"
        }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_decrypts
    expected = {
      encryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end
end