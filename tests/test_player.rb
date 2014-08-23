require "terminal_clue/player.rb"
require "test/unit"

class TestPlayer < Test::Unit::TestCase

  def test_pick_piece
    puts " testing"
    player = Player.new
    assert_equal(nil, player.piece)
    assert_equal("Got it.", player.pick_piece(true, "Col. Mustard"))
    assert_equal("Col. Mustard", player.piece)
    assert_equal("Already taken.", player.pick_piece(true, "Col. Mustard"))
    assert_equal("Col. Mustard", player.piece)
    assert_equal("There is no suspect with that name. Come on man!", 
                 player.pick_piece(true, "fy54_"))
    assert_equal("Col. Mustard", player.piece)
  end

  def test_assign_starting_location
    puts " testing"
    player = Player.new
    Suspects.reinitialize_picked
    player.pick_piece(true, "Miss Scarlet")
    player.assign_starting_location
    assert_equal("Lounge", player.location)
    assert_not_equal("blah", player.location) # wanted to see if my test was doing anything
  end

# Pseudocode:
# Determine player's location (room at this time).
# Determine rooms that have secret passageways to current room.
# Choose one of those rooms
# Change player's location to new room

  def test_choose_secret_passageway
    puts " testing"
    player = Player.new
    Suspects.reinitialize_picked
    player.pick_piece(true, "Miss Scarlet")
    player.assign_starting_location # Will be the Lounge
    # Only 4 rooms have secret passageways and each room has only one passageway
    # Test for room that has passageway
    assert_equal("Conservatory", player.choose_secret_passageway)
    # Test for one that has no passageway
  end

end