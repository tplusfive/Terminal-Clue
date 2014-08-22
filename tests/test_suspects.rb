require "~/GitHub/Terminal-Clue/lib/terminal_clue/suspects.rb"
require "test/unit"

class TestSuspects < Test::Unit::TestCase

  def test_list
    puts " testing"
    #suspects = Suspects.new
    assert_equal(
      [ "Col. Mustard", "Prof. Plum", "Mr. Green",
        "Mrs. Peacock", "Miss Scarlet",
        "Mrs. White" ], Suspects.list
    )
  end

  def test_picked?
    puts " testing"
    Suspects.reinitialize_picked
    assert_equal(false, Suspects.picked?("Col. Mustard"))
    assert_equal(true, Suspects.picked?("Col. Mustard"))
    assert_equal(false, Suspects.picked?("Prof. Plum"))
    assert_equal(nil, Suspects.picked?("yg41hg"))
  end

end