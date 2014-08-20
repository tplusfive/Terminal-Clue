class SolutionEnvelope

  attr_reader :suspect, :weapon, :room

  def assign_suspect(suspects) # BUG rand could generate a zero
    index = rand(suspects.list.length + 1) - 1 # length will give number elements, rand will generate number between 0 and length
    @suspect = suspects.list[index]
  end

  def assign_weapon(weapons)
    index = rand(weapons.list.length + 1) - 1 # length will give number elements, rand will generate number between 0 and length
    @weapon = weapons.list[index]
  end

  def assign_room(rooms)
    index = rand(rooms.list.length + 1) - 1 # length will give number elements, rand will generate number between 0 and length
    @room = rooms.list[index]
  end

end