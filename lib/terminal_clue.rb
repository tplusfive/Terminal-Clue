## require "lib/terminal_clue/player.rb" # TODO - How to run this file from rake so LOAD_PATH in gemspec is loaded
require "~/GitHub/Terminal-Clue/lib/terminal_clue/player.rb"
require "~/GitHub/Terminal-Clue/lib/terminal_clue/solution_envelope.rb"
require "~/GitHub/Terminal-Clue/lib/terminal_clue/suspects.rb"
require "~/GitHub/Terminal-Clue/lib/terminal_clue/weapons.rb"
require "~/GitHub/Terminal-Clue/lib/terminal_clue/rooms.rb"
require "~/GitHub/Terminal-Clue/lib/terminal_clue/dice.rb"

player = Player.new
player.pick_piece
puts "The player's piece is " + player.piece

solution_envelope = SolutionEnvelope.new
suspects = Suspects.new
assigned_suspect = solution_envelope.assign_suspect
puts assigned_suspect + " has been added to the Confidential Solutions Envelope."
weapons = Weapons.new
assigned_weapon = solution_envelope.assign_weapon(weapons)
puts "The " + assigned_weapon + " has been added to the Confidential Solutions Envelope."
assigned_room = solution_envelope.assign_room(Rooms.list)
puts "The " + assigned_room + " has been added to the Confidential Solutions Envelope."

player.assign_starting_location
puts player.piece + " will start in: " + player.location

player.secret_passageway_option

player.pick_next_room

dice = Dice.new
print "You roll the dice and get "
puts dice.roll