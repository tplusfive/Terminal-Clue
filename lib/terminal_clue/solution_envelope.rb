class SolutionEnvelope

  attr_reader :suspect, :weapon, :room
  
  def assign_suspect(test = false, suspect = nil) # BUG rand could generate a zero
    unless test
      index = rand(Suspects.list.length + 1) - 1 # length will give number elements, rand will generate number between 0 and length
      @suspect = Suspects.list[index]
    else
      @suspect = suspect
    end
  end

  def assign_weapon(test = false, weapon = nil)
    unless test
      index = rand(Weapons.list.length + 1) - 1 # length will give number elements, rand will generate number between 0 and length
      @weapon = Weapons.list[index]
    else
      @weapon = weapon
    end
  end

  def assign_room(test = false, room = nil)
    unless test
      index = rand(Rooms.list.length + 1) - 1 # length will give number elements, rand will generate number between 0 and length
      @room = Rooms.list[index]
    else
      @room =  room
    end
  end

end