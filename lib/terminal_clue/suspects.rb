# Models the suspect pieces and the suspect cards
class Suspects

  attr_reader :list
  
  @@starting_location = 
    { "Col. Mustard" => "Dining Room", "Prof. Plum" => "Study",
      "Mr. Green" => "Conservatory", "Mrs. Peacock" => "Billiard Room",
      "Miss Scarlet" => "Lounge", "Mrs. White" => "Ballroom" }

  @@picked = 
      { "Col. Mustard" => false, "Prof. Plum" => false, "Mr. Green" => false,
        "Mrs. Peacock" => false, "Miss Scarlet" => false,
        "Mrs. White" => false } # TODO - would like to use symbols # TODO try to add ? mark to @@picked

  @@list = @@picked.keys

  def initialize
  end

  def self.list
    @@list
  end

#  Must be only one instance of suspects class or picked? method won't work right.
#  Tried a class variable but didn't see a good way to re-initialize for unit tests
  def self.picked?(choice)
    if @@picked[choice] == false
      @@picked[choice] = true
      return false
    elsif @@picked[choice] == true
      return true
    else
      nil
    end
    
  end

  def assign_starting_location
    @location = @@starting_location[self.piece]
  end

end