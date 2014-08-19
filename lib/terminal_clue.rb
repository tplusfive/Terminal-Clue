## require "lib/terminal_clue/player.rb" # TODO - How to run this file from rake so LOAD_PATH in gemspec is loaded
require "~/GitHub/Terminal-Clue/lib/terminal_clue/player.rb"
require "~/GitHub/Terminal-Clue/lib/terminal_clue/pieces.rb"
require "~/GitHub/Terminal-Clue/lib/terminal_clue/solution_envelope.rb"
require "~/GitHub/Terminal-Clue/lib/terminal_clue/suspects.rb"

player = Player.new
pieces = Pieces.new
player.pick_piece(pieces)
puts "The player's piece is " + player.piece

solution_envelope = SolutionEnvelope.new
suspects = Suspects.new
assigned_suspect = solution_envelope.assign_suspect(suspects)
puts assigned_suspect + " has been added to the Confidential Solutions Envelope."