require_relative "player"
require_relative "game_turn"

class Game
	
	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player(a_player)
		@players << a_player
	end

	def print_stats
		strong_players, whimpy_players = @players.partition { |player| player.strong? }

		puts "\n#{@title} Statistics:"

		puts "\n#{strong_players.size} strong players"
		strong_players.each do |player|
			puts "#{player.name} (#{player.health})"
		end

		puts "\n#{whimpy_players.size} whimpy players"
		whimpy_players.each do |player|
			puts "#{player.name} (#{player.health})"
		end
	end

	def play(rounds)
		puts "There are #{@players.size} players in #{@title}:"
		
		@players.each do |player|
			puts player
		end

		1.upto(rounds) do |round|
			puts "\nRound #{round}:"
			@players.each do |player|
				GameTurn.take_turn(player)
				puts player
			end
		end
	end

end