require "ex45clue/suspects.rb"
# require "test/unit" # needed? Was loaded with test_ex45clue.rb

class TestSuspects < Test::Unit::TestCase
  
  def test_suspects
    puts " testing"
    suspects = Suspects.new
    assert_equal(
      { "Col. Mustard" => false, "Prof. Plum" => false, "Mr. Green" => false,
        "Mrs. Peacock" => false, "Miss Scarlet" => false,
        "Mrs. White" => false }, 
      suspects.list
    )
  end
  
  def test_picked?
    puts " testing"
    suspects = Suspects.new
    assert_equal(false, suspects.picked?("Col. Mustard"))
    assert_equal(true, suspects.picked?("Col. Mustard"))
    assert_equal(false, suspects.picked?("Prof. Plum"))
    assert_equal(nil, suspects.picked?("yg41hg"))
  end
  
end