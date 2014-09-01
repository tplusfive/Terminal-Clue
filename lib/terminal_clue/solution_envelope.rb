class SolutionEnvelope

  attr_reader :suspect, :weapon, :room

  def assign_suspect # BUG rand could generate a zero
    index = rand(Suspects.list.length + 1) - 1 # length will give number elements, rand will generate number between 0 and length
    @suspect = Suspects.list[index]
  end

  def assign_weapon
    index = rand(Weapons.list.length + 1) - 1 # length will give number elements, rand will generate number between 0 and length
    @weapon = Weapons.list[index]
  end

  def assign_room
    index = rand(Rooms.list.length + 1) - 1 # length will give number elements, rand will generate number between 0 and length
    @room = Rooms.list[index]
  end

end