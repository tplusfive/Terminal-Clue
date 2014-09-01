require "terminal_clue/rooms.rb"
require "test/unit"

class TestRooms < Test::Unit::TestCase
  
  def test_attr_reader
    puts " testing"
    assert_equal(false, Rooms.list.empty?)
  end
end