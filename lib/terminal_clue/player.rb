# require "terminal_clue/suspects.rb" # Do not need this since ex45clue loads it - good/bad practice?

# Models the player
class Player
  
  attr_reader :piece, :location
  
  def initialize
  end
  
  def pick_piece(test = false, pick = nil) # test, pick parameters for unit testing
    begin
      # TODO: The if it says 'true' text is inaccurate now.  Need to show only rooms not taken yet.
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
    @location = Suspects.starting_location[@piece]
  end
  
  def secret_passageway_available?
    if Rooms.secret_passageways(@location) == nil
      return false
    else
      return true
      end
  end
  
  def use_secret_passageway?(test = false, choice = nil)
    begin
      puts "Do you want to take the secret passageway to " + Rooms.secret_passageways(@location) + "?"
      print "Enter 'Yes' or 'No' > "
    
      if test == false
        choice = gets.chomp
      else
        puts choice
      end
    
      case choice
      when "Yes"
        return true
      when "No"
        return false
      else
        puts "Umm... need a 'Yes' or a 'No'."
      end
    end while (choice != "Yes" and choice != "No") and test == false
    
  end

  def change_location(location)
    @location = location
  end

end