class SolutionEnvelope

  attr_reader :suspect

  def assign_suspect(suspects)
    index = rand(suspects.list.length - 1)
    @suspect = suspects.list[index]
  end

end