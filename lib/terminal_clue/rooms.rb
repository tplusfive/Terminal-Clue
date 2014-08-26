# Models the rooms on the board and the room cards
class Rooms

   @@list= 
      [ "Hall", "Lounge", "Dining Room", "Kitchen", "Ballroom", "Conservatory",
        "Billiard Room", "Library", "Study" ]
  
  @@secret_passageways = {
    "Conservatory" => "Lounge", "Study" => "Kitchen", "Lounge" => "Conservatory",
    "Kitchen" => "Study"
  }
  
  def self.list
    @@list
  end
  
  def self.secret_passageways(location)
    @@secret_passageways[location]
  end

end