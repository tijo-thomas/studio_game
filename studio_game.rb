class Player
	
	attr_accessor :name
	attr_reader :health

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health
	end

	def to_s
		"I'm #{@name} with a health of #{@health} and a score of #{score}."
	end

	def blam
		@health -= 10
		puts "#{@name} got blammed!"
	end

	def woot
		@health += 15
		puts "#{@name} got wooted!"
	end

	def score
		@health + @name.length
	end

end

class Game
	
	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player(a_player)
		@players << a_player
	end

	def play
		puts "There are #{@players.size} players in #{@title}:"
		@players.each do |player|
			puts player
		end
		@players.each do |player|
			player.blam
			player.woot
			player.woot
			puts player
		end
	end

end

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