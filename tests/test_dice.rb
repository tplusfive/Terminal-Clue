require "terminal_clue/dice.rb"
require "test/unit"

class TestDice < Test::Unit::TestCase

  def test_roll
    puts " testing"
    dice = Dice.new
    test_rolls = []
    while test_rolls.length < 6
      roll = dice.roll
      # print "Roll is " + roll.to_s + " "
      assert(roll >= 1 && roll <= 6, "Roll is not 1,2,3,4,5 or 6")
      test_rolls.push(roll) unless test_rolls.include?(roll)
      # print "Rolls array is "; print test_rolls; puts
    end
  end

end