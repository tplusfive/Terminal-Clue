require "terminal_clue/player.rb"
require "test/unit"

class TestPlayer < Test::Unit::TestCase

  def test_pick_piece
    puts " testing"
    player = Player.new
    assert_equal(nil, player.piece)
    Suspects.reinitialize_picked
    assert_equal("Got it.", player.pick_piece(true, "Col. Mustard"))
    assert_equal("Col. Mustard", player.piece)
    assert_equal("Already taken.", player.pick_piece(true, "Col. Mustard"))
    assert_equal("Col. Mustard", player.piece)
    assert_equal(
      "There is no suspect with that name. Come on man!", 
      player.pick_piece(true, "fy54_")
    )
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

  def test_secret_passageway_available?
    puts " testing"
    player = Player.new
    Suspects.reinitialize_picked
    player.pick_piece(true, "Miss Scarlet")
    player.assign_starting_location # Will be the Lounge
    assert_equal(true, player.secret_passageway_available?)
    # Test for one that has no passageway
    player2 = Player.new
    player2.pick_piece(true, "Mrs. Peacock")
    player2.assign_starting_location # Will be the Billiard Room
    assert_equal(false, player2.secret_passageway_available?)
  end
  
  def test_use_secret_passageway?
    puts " testing"
    player = Player.new
    Suspects.reinitialize_picked
    player.pick_piece(true, "Miss Scarlet")
    player.assign_starting_location
    assert_equal(true, player.use_secret_passageway?(true, "Yes"))
    assert_equal(false, player.use_secret_passageway?(true, "No"))
    assert_equal(nil, player.use_secret_passageway?(true, "aic45m"))
  end
  
  def test_change_location
    puts " testing"
    player = Player.new
    assert_equal(nil, player.location)
    player.change_location("Billiard Room")
    assert_equal("Billiard Room", player.location)
  end
  
  def test_secret_passageway_option
    puts " testing"
    player = Player.new
    Suspects.reinitialize_picked
    player.pick_piece(true, "Miss Scarlet")
    player.assign_starting_location # Lounge
    player.secret_passageway_option(true, "No")
    assert_equal("Lounge", player.location)
    player.secret_passageway_option(true, "Yes")
    assert_equal("Conservatory", player.location)
    player2 = Player.new
    player2.pick_piece(true, "Mrs. White")
    player2.assign_starting_location # Ballroom
    player2.secret_passageway_option(true, "gobbledy gook")
    assert_equal("Ballroom", player2.location) # location not changed
    player2.secret_passageway_option(true, "Yes")
    assert_equal("Ballroom", player2.location)
    player2.secret_passageway_option(true, "No")
    assert_equal("Ballroom", player2.location)
  end

  def test_pick_next_room
    puts " testing"
    player = Player.new
    Suspects.reinitialize_picked
    player.pick_piece(true, "Mr. Green")
    player.assign_starting_location # Conservatory
    assert_equal("Got it.", player.pick_next_room(true, "Hall"))
    assert_equal(
      "You're already there. Come on man!",
      player.pick_next_room(true, "Hall")
    )
    assert_equal(
      "Really? You're picking a room that doesn't exist? Come on man!",
      player.pick_next_room(true, "a9-3v#")
    )
  end

  def test_set_accusation_suspect
    puts " testing"
    player = Player.new
    player.set_accusation_suspect("Col. Mustard")
    assert_equal("Col. Mustard", player.accusation_suspect)
  end

  def test_accusation_suspect_correct?
    puts " testing"
    player = Player.new
    solution_envelope = SolutionEnvelope.new
    solution_envelope.assign_suspect(true, "Mr. Green")
    player.set_accusation_suspect("Mr. Green")
    assert_equal( true, player.accusation_suspect_correct?(solution_envelope) )
    player.set_accusation_suspect("Miss Scarlet")
    assert_equal( false, player.accusation_suspect_correct?(solution_envelope) )
  end

end