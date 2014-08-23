# require "terminal_clue/suspects.rb" # Do not need this since ex45clue loads it - good/bad practice?

# Models the player
class Player
  
  attr_reader :piece, :location
  
  def initialize
  end
  
  def pick_piece(test = false, pick = nil) # test, pick parameters for unit testing
    begin
      puts "Choose your playing piece. If it says 'true' it's already been taken."
      puts Suspects.list
      print "> "
      
      if test == false
        pick = gets.chomp
      else
        puts pick
      end
      
      already_taken = Suspects.picked?(pick)
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

  def assign_starting_location
    @location = Suspects.starting_location[self.piece]
  end
  
  def choose_secret_passageway
    Rooms.secret_passageways(self.location)
  end

end