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
  
  def test_assign_starting_location
    puts " testing"
    piece = Pieces.new.keys
    player = Player.new
    # TODO Let's try all the pieces to make sure they all have a starting location
    player.pick_piece(pieces, true, "Col. Mustard")
    piece.assign_starting_location(player)
    assert_equal("Dining Room", player.location)
    assert_not_equal("blah", player.location) # wanted to see if my test was doing anything
  end  
  
end