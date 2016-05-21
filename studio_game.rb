require_relative "player"
require_relative "game"

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("alvin", 100)
player5 = Player.new("simon", 60)
player6 = Player.new("theo", 125)

knuckleheads = Game.new("Knuckleheads")
puts knuckleheads.title
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play

chipmunks = Game.new("Chipmunks")
puts chipmunks.title
chipmunks.add_player(player4)
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.play