require "test/unit"
require "terminal_clue/solution_envelope.rb"
require "terminal_clue/suspects.rb"
require "terminal_clue/weapons.rb"
require "terminal_clue/rooms.rb"

class TestSolutionEnvelope < Test::Unit::TestCase

  def test_assign_suspect
    puts " testing"
    suspects_tested = [] # keep track of randomly generated suspects to know when done
    solution_envelope = SolutionEnvelope.new
    while suspects_tested.length < Suspects.list.length # keep generating random suspects until all have been generated
      assigned_suspect = solution_envelope.assign_suspect
      # assert whether the randomly assigned suspect is a valid suspect
      assert_block do
        Suspects.list.any? { |suspect| suspect == assigned_suspect}
      end
      # Add the assigned suspect to list of suspects already tested
      suspects_tested.push(assigned_suspect) unless suspects_tested.include?(assigned_suspect)
    end
    puts suspects_tested
  end
  
  def test_assign_weapon
    puts " testing"
    weapons_tested = [] # keep track of randomly generated weapons to know when done
    solution_envelope = SolutionEnvelope.new
    while weapons_tested.length < Weapons.list.length # keep generating random weapons until all have been generated
      assigned_weapon = solution_envelope.assign_weapon
      # assert whether the randomly assigned weapon is a valid weapon
      assert_block do
        Weapons.list.any? { |weapon| weapon == assigned_weapon}
      end
      # Add the assigned weapon to list of weapons already tested
      weapons_tested.push(assigned_weapon) unless weapons_tested.include?(assigned_weapon)
    end
    puts weapons_tested
  end
  
  def test_assign_room
    puts " testing"
    rooms_tested = [] # keep track of randomly generated rooms to know when done
    solution_envelope = SolutionEnvelope.new
    while rooms_tested.length < Rooms.list.length # keep generating random rooms until all have been generated
      assigned_room = solution_envelope.assign_room
      # assert whether the randomly assigned room is a valid room
      assert_block do
        Rooms.list.any? { |room| room == assigned_room}
      end
      # Add the assigned room to list of rooms already tested
      rooms_tested.push(assigned_room) unless rooms_tested.include?(assigned_room)
    end
    puts rooms_tested
  end

end