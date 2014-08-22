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
  
end