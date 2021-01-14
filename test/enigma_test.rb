require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/enigma'
require 'date'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_equal Enigma, @enigma
  end
end