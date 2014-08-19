require "~/GitHub/Terminal-Clue/lib/terminal_clue/suspects.rb"
require "test/unit"

class TestSuspects < Test::Unit::TestCase
  
  def test_attr_reader
    puts " testing"
    suspects = Suspects.new
    assert_equal(false, suspects.list.empty?)
  end
end