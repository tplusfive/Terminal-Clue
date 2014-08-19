require "test/unit"
require "~/GitHub/Terminal-Clue/lib/terminal_clue/solution_envelope.rb"
require "~/GitHub/Terminal-Clue/lib/terminal_clue/suspects.rb"

class TestSolutionEnvelope < Test::Unit::TestCase

  def test_assign_suspect
    puts " testing"
    suspects_tested = [] # keep track of randomly generated suspects to know when done
    solution_envelope = SolutionEnvelope.new
    suspects = Suspects.new
    while suspects_tested.length < suspects.list.length # keep generating random suspects until all have been generated
      assigned_suspect = solution_envelope.assign_suspect(suspects)
      # assert whether the randomly assigned suspect is a valid suspect
      assert_block do
        suspects.list.any? { |suspect| suspect == assigned_suspect}
      end
      # Add the assigned suspect to list of suspects already tested
      suspects_tested.push(assigned_suspect) unless suspects_tested.include?(assigned_suspect)
    end
    puts suspects_tested
  end

end