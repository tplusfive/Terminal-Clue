require "terminal_clue/weapons.rb"
require "test/unit"

class TestWeapons < Test::Unit::TestCase
  
  def test_attr_reader
    puts " testing"
    weapons = Weapons.new
    assert_equal(false, weapons.list.empty?)
  end
end