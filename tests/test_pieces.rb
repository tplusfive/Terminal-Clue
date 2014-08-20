require "terminal_clue/pieces.rb"
require "test/unit"

class TestPieces < Test::Unit::TestCase
  
  def test_pieces
    puts " testing"
    pieces = Pieces.new
    assert_equal(
      [ "Col. Mustard", "Prof. Plum", "Mr. Green",
        "Mrs. Peacock", "Miss Scarlet",
        "Mrs. White" ], 
      pieces.list
    )
  end
  
  def test_picked?
    puts " testing"
    pieces = Pieces.new
    assert_equal(false, pieces.picked?("Col. Mustard"))
    assert_equal(true, pieces.picked?("Col. Mustard"))
    assert_equal(false, pieces.picked?("Prof. Plum"))
    assert_equal(nil, pieces.picked?("yg41hg"))
  end
  
end