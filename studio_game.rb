require_relative "player"
require_relative "game"
require_relative "clumsy_player"

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv") # Calls the load_players method and passes the csv file entered as command-line argument or defaults to "players.csv".

klutz = ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(klutz)

puts knuckleheads.title

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

knuckleheads.save_high_scores
