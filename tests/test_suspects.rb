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
    assert_equal(false, Suspects.picked?("Col. Mustard"))
    assert_equal(true, Suspects.picked?("Col. Mustard"))
    assert_equal(false, Suspects.picked?("Prof. Plum"))
    assert_equal(nil, Suspects.picked?("yg41hg"))
  end

# need to figure out how to use a class variable for starting_location and @picked
=begin
  def test_assign_starting_location
    puts " testing"
    suspects = Suspects.new
    suspects.assign_starting_location
    assert_equal("Dining Room", player.location)
    assert_not_equal("blah", player.location) # wanted to see if my test was doing anything
  end
=end

end