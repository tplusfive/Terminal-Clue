# There should only be one instance of this class or these counts will be off
#   Tried a class variable but didn't see a good way to re-initialize for unit tests
#   Other option would be to use a global variable and re-initialize it somehow
class Pieces
  
  attr_reader :list
  
  def initialize
    @picked = 
      { "Col. Mustard" => false, "Prof. Plum" => false, "Mr. Green" => false,
        "Mrs. Peacock" => false, "Miss Scarlet" => false,
        "Mrs. White" => false } # TODO - would like to use symbols # TODO try to add ? mark to @@picked
    @list = @picked.keys
  end

  def picked?(choice)
    if @picked[choice] == false
      @picked[choice] = true
      return false
    elsif @picked[choice] == true
      return true
    else
      nil
    end
    
  end

end