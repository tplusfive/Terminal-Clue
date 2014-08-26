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

  def change_location(location)
    @location = location
    puts "You are now in the " + @location
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

  # Determine if a secret passageway` exists and if player wants to take it
  def secret_passageway_option(test = false, choice = nil)
    return unless secret_passageway_available?
    return unless use_secret_passageway?(test, choice)
    new_location = Rooms.secret_passageways(@location)
    change_location(new_location)
    puts "You are now in: " + @location
  end
  
  def pick_next_room(test = false, pick = nil)
    
    begin
      puts "To which room do you want to move?"
      puts Rooms.list
      print "> "
      
      if test == false
        pick = gets.chomp
      else
        puts pick
      end
      
      # BUG: Logic here is broken
      valid_room = Rooms.list.include?(pick)
      case valid_room
      when true
        puts response = "Got it."
        change_location(pick)
      when false
        puts response = "You're already there. Come on man!"
      when nil
        puts response = "Really? You're picking a room that doesn't exist? Come on man!"
      else
        puts "Error in Player.pick_piece."
        Process.exit(0)
      end
    end while (valid_room == false or valid_room == nil) and test == false
    return response # For unit testing only
  
  end

end