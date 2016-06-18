require_relative "player"
require_relative "game"

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players("players.csv") # Calls the load_players method and specified file into it.
puts knuckleheads.title

# knuckleheads.add_player(player1)
# knuckleheads.add_player(player2)
# knuckleheads.add_player(player3)

loop do
	puts "\nHow many games rounds? ('quit' to exit)."
	answer = gets.chomp.downcase
	case answer
	when /^\d+$/
		knuckleheads.play(answer.to_i)
	when "quit", "exit"
		knuckleheads.print_stats
		break
	else
		puts "Please enter a number or 'quit'."
	end
end
