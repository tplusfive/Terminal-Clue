# require "terminal_clue/suspects.rb" # Do not need this since ex45clue loads it - good/bad practice?

# Models the player
class Player
  
  attr_reader :piece, :location, :accused_suspect
  
  def initialize
  end
  
  # TODO Consider re-factoring like pick_accused_suspect. Use one method to verify the pick exists in the list of suspects.
  # ... Use another method to see if that piece has already been picked.  
  def pick_piece(test = false, pick = nil) # test, pick parameters for unit testing
    begin
      # TODO: Need to show only rooms not taken yet.
      puts "Choose your playing piece."
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
      
      room_pick_valid = Rooms.list.include?(pick)
      if room_pick_valid == false
        puts response = "Really? You're picking a room that doesn't exist? Come on man!"
      elsif room_pick_valid == true and @location == pick
        puts response = "You're already there. Come on man!"
      elsif room_pick_valid == true and @location != pick
        puts response = "Got it."
        change_location(pick)
        return response # For unit testing only
      else
        puts "Error in Player.pick_piece."
        Process.exit(0)
      end
      
    # BUG Where is the check for test == false???
    end while (room_pick_valid == false or (room_pick_valid == true and @location == pick)) and test == false
    return response # For unit testing only
  
  end
  
  def pick_accusation_suspect(test = false, pick = nil)
    
    begin
      puts "What suspect are you accusing? >"
      puts Suspects.list
      
      unless test == true
        pick = gets.chomp
      end
      
      suspect_pick_valid = Suspects.list.include?(pick)
      if suspect_pick_valid
        puts response = "Got it."
      else
        puts response = "Whaaa...???  That's not one of the suspects! Come on man!"
      end
    end while (test == false and suspect_pick_valid == false)
    return response
  
  end

  def pick_accusation_weapon(test = false, pick = nil)
    
    begin
      puts "What weapon do you think the suspect used? >"
      puts Weapons.list
      
      unless test == true
        pick = gets.chomp
      end
      
      weapon_pick_valid = Weapons.list.include?(pick)
      if weapon_pick_valid
        puts response = "Got it."
      else
        puts response = "Whaaa...???  That's not one of the weapons! Come on man!"
      end
    end while (test == false and weapon_pick_valid == false)
    return response
    
  end
  
  def pick_accusation_room(test = false, pick = nil)
    
    begin
      puts "Where do you think the murder happened? >"
      puts Rooms.list
      
      unless test == true
        pick = gets.chomp
      end
      
      room_pick_valid = Rooms.list.include?(pick)
      if room_pick_valid
        puts response = "Got it."
      else
        puts response = "Whaaa...???  That's not one of the rooms! Come on man!"
      end
    end while (test == false and room_pick_valid == false)
    return response
    
  end

end