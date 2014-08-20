class Rooms

  attr_reader :list
  
  def initialize(name = nil)
    @list = 
      [ "Hall", "Lounge", "Dining Room", "Kitchen", "Ballroom", "Conservatory",
        "Billiard Room", "Library", "Study" ]
  end

end