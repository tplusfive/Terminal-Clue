require "terminal_clue/weapons.rb"
require "test/unit"

class TestWeapons < Test::Unit::TestCase
  
  def test_attr_reader
    puts " testing"
    assert_equal(false, Weapons.list.empty?)
  end
end