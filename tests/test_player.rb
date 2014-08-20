require "terminal_clue/player.rb"
require "test/unit"

class TestPlayer < Test::Unit::TestCase

  def test_pick_piece
    puts " testing"
    pieces = Pieces.new
    player = Player.new
    assert_equal(nil, player.piece)
    assert_equal("Got it.", player.pick_piece(pieces, true, "Col. Mustard"))
    assert_equal("Col. Mustard", player.piece)
    assert_equal("Already taken.", player.pick_piece(pieces, true, "Col. Mustard"))
    assert_equal("Col. Mustard", player.piece)
    assert_equal("There is no suspect with that name. Come on man!", 
                 player.pick_piece(pieces, true, "fy54_"))
    assert_equal("Col. Mustard", player.piece)
  end
  
  def test_assign_starting_location
    puts " testing"
    pieces = Pieces.new.keys
    player = Player.new
    player.pick_piece(pieces, true, "Col. Mustard")
    player.assign_starting_location
    assert_equal("Dining Room", player.location)
    assert_not_equal("blah", player.location) # wanted to see if my test was doing anything
  end
  
end