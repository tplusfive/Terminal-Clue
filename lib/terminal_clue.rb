## require "lib/terminal_clue/player.rb" # TODO - How to run this file from rake so LOAD_PATH in gemspec is loaded
require "~/GitHub/Terminal-Clue/lib/terminal_clue/player.rb"
require "~/GitHub/Terminal-Clue/lib/terminal_clue/pieces.rb"

player = Player.new
pieces = Pieces.new
player.pick_piece(pieces)
puts "The player's piece is " + player.piece