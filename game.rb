require_relative "player"
require_relative "game_turn"
require_relative "treasure_trove"

class Game
	
	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def load_players(from_file)
		File.readlines(from_file).each do |line|
			name, health = line.split(",")
			player = Player.new(name, Integer(health))
			add_player(player)
		end
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
			if block_given?
				break if yield
			end
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
		puts "\n#{@title} Statistics:"

		strong_players, whimpy_players = @players.partition { |player| player.strong? }

		puts "\n#{strong_players.size} strong players"
		strong_players.each do |player|
			print_name_and_health(player)
		end

		puts "\n#{whimpy_players.size} whimpy players"
		whimpy_players.each do |player|
			print_name_and_health(player)
		end

		sorted_players = @players.sort { |a, b| b.score <=> a.score }

		puts "#{total_points} total points from treasures found"
		@players.each do |player|
			puts "\n#{player.name}'s point totals:"
			puts "#{player.points} grand total points"
		end

		puts "\n#{@title} High Scores:"
		sorted_players.each do |player|
			formatted_name = player.name.ljust(20, '.')
			puts puts "#{formatted_name} #{player.score}"
		end

		@players.sort.each do |player|
		  puts "\n#{player.name}'s point totals:"
		  player.each_found_treasure do |treasure|
		    puts "#{treasure.points} total #{treasure.name} points"
		  end
		  puts "#{player.points} grand total points"
		end

	end

	def total_points
		@players.reduce(0) { |sum, player| sum + player.points}
	end

end