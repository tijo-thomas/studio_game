require_relative "player"
require_relative "game_turn"
require_relative "treasure_trove"

class Game
	
	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player(a_player)
		@players << a_player
	end

	def play(rounds)
		puts "There are #{@players.size} players in #{@title}:"
		
		@players.each do |player|
			puts player
		end

		# Created local variable of the TREASURES constant thats an array.
		treasures = TreasureTrove::TREASURES
		puts "\nThere are #{treasures.size} treasures to be found:"
		treasures.each do |treasure|
			puts "A #{treasure.name} is worth #{treasure.points} points."
		end

		1.upto(rounds) do |round|
			puts "\nRound #{round}:"
			@players.each do |player|
				GameTurn.take_turn(player)
				puts player
			end
		end
	end
	
	def print_name_and_health(player) # refactoring of previous code, see below
		puts "#{player.name} (#{player.health})"
	end

	def print_stats
		strong_players, whimpy_players = @players.partition { |player| player.strong? }

		puts "\n#{@title} Statistics:"

		puts "\n#{strong_players.size} strong players"
		strong_players.each do |player|
			print_name_and_health(player)
		end

		puts "\n#{whimpy_players.size} whimpy players"
		whimpy_players.each do |player|
			print_name_and_health(player)
		end

		sorted_players = @players.sort { |a, b| b.score <=> a.score }

		puts "\n#{@title} High Scores:"
		sorted_players.each do |player|
			formatted_name = player.name.ljust(20, '.')
			puts puts "#{formatted_name} #{player.score}"
		end
	end


end