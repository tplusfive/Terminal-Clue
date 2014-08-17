## require "lib/ex45clue/player.rb" # TODO - How to run this file from rake so LOAD_PATH in gemspec is loaded
require "~/Dropbox/Work/Training/Software Development Training/Learning Ruby/Learn Ruby The Hard Way/projects/ex45clue/lib/ex45clue/player.rb"
require "~/Dropbox/Work/Training/Software Development Training/Learning Ruby/Learn Ruby The Hard Way/projects/ex45clue/lib/ex45clue/suspects.rb"

player_model = PlayerModel.new
player_view = PlayerView.new(player_model)

player_view.show_message("Howdy")

suspects = Suspects.new
player_view.select_piece(suspects)
puts "The player's set piece is " + player_model.piece