require "test/unit"
require "~/GitHub/Terminal-Clue/lib/terminal_clue/solution_envelope.rb"
require "~/GitHub/Terminal-Clue/lib/terminal_clue/suspects.rb"

class TestSolutionEnvelope < Test::Unit::TestCase

  def test_assign_suspect
    for test in (1..20)
      puts " testing"
      solution_envelope = SolutionEnvelope.new
      suspects = Suspects.new
      assigned_suspect = solution_envelope.assign_suspect(suspects)
      puts assigned_suspect
      assert_block do
        suspects.list.any? { |suspect| suspect = assigned_suspect }
      end
      # Need to test boundary - can all suspects possibly be assigned
    end
  end

end