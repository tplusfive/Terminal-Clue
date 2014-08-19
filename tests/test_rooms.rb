require "~/GitHub/Terminal-Clue/lib/terminal_clue/rooms.rb"
require "test/unit"

class TestRooms < Test::Unit::TestCase
  
  def test_attr_reader
    puts " testing"
    rooms = Rooms.new
    assert_equal(false, rooms.list.empty?)
  end
end