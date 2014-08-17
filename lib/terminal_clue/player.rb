# require "terminal_clue/suspects.rb" # Do not need this since ex45clue loads it - good/bad practice?

class Player
  
  attr_reader :piece
  
  def initialize
  end
  
  def pick_piece(suspects, test = false, pick = nil) # test and pick for unit testing
    begin
      puts "Choose your playing piece. If it says 'true' it's already been taken."
      puts suspects.list
      print "> "
      
      if test == false
        pick = gets.chomp
      end
      
      already_taken = suspects.picked?(pick)
      case already_taken # Originally had these messages in suspects.picked? but wanted to separate UI from logic
      when false
        puts response = "Got it."
        @piece = pick
      when true
        puts response = "Already taken."
      when nil
        puts response = "There is no suspect with that name. Come on man!"
      else
        puts "Error in Player.pick_piece."
        Process.exit(0)
      end
    end while (already_taken == true or already_taken == nil) and test == false
    return response # For unit testing only
  end

end