# Models the rooms on the board and the room cards
class Rooms

  attr_reader :list
  
  @@secret_passageways = {
    "Conservatory" => "Lounge", "Study" => "Kitchen", "Lounge" => "Conservatory",
    "Kitchen" => "Study"
  }
  
  def initialize(name = nil)
    @list = 
      [ "Hall", "Lounge", "Dining Room", "Kitchen", "Ballroom", "Conservatory",
        "Billiard Room", "Library", "Study" ]  # TODO refactor as class variable and method
  end
  
  def self.secret_passageways(location)
    @@secret_passageways[location]
  end

end