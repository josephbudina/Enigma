require './test/test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.alphabet
  end

  def test_it_can_generate_random_key
    assert_instance_of String, @enigma.random_key
    assert_equal 5, @enigma.random_key.length
    assert @enigma.random_key.to_i >= 0
    assert @enigma.random_key.to_i <= 99_999
  end

  def test_it_encrypts
    Date.stubs(:today).returns(Date.new(1995, 8, 4))
    @enigma.stubs(:random_key).returns("02715")
    expected = {
          encryption: "keder ohulw?",
          key: "02715",
          date: "040895"
        }

    assert_equal expected, @enigma.encrypt("hello world?", "02715", "040895")
    assert_equal expected, @enigma.encrypt("hello world?", "02715")
    assert_equal expected, @enigma.encrypt("hello world?")
    assert_equal expected[:encryption], @enigma.encrypt_message('hello world?', "02715", "040895").join
  end

  def test_it_adds_date
    Date.stubs(:today).returns(Date.new(2020, 8, 4))
    assert_equal "040820", @enigma.todays_date
  end

  def test_it_decrypts
    Date.stubs(:today).returns(Date.new(1995, 8, 4))
    expected = {
      encryption: "hello world",
      key: "02715",
      date: "040895"
    }
    expected2 =["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    assert_equal "u", @enigma.index_shift(3, @enigma.shift("02715", "040895"), "a")
    assert_equal expected2, @enigma.decrypt_message("keder ohulw", "02715", "040895")
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715")
  end
end