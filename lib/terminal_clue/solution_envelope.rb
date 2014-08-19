class SolutionEnvelope

  attr_reader :suspect

  def assign_suspect(suspects)
    index = rand(suspects.list.length + 1) - 1 # length will give number elements, rand will generate number between 0 and length
    @suspect = suspects.list[index]
  end

end