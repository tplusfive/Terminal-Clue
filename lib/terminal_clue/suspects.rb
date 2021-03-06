# Models the suspect pieces and the suspect cards
class Suspects
  
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
  
  def self.starting_location
    @@starting_location
  end

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

  def self.reinitialize_picked # HACK Move the hash to a global constant and then reference
    @@picked = 
      { "Col. Mustard" => false, "Prof. Plum" => false, "Mr. Green" => false,
        "Mrs. Peacock" => false, "Miss Scarlet" => false,
        "Mrs. White" => false } # TODO - would like to use symbols # TODO try to add ? mark to @@picked
  end

end