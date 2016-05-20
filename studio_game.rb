class Player
	
	attr_reader :health
	attr_accessor :name

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

	def name=(new_name)
		@name = new_name.capitalize
	end
end

	player1 = Player.new("moe")
	puts player1
	player1.blam
	puts player1
	puts player1.health

	player2 = Player.new("larry", 60)
	puts player2
	player2.woot
	puts player2
	puts player2.health
	player2.name = "lawrence"
	puts player2.name

	player3 = Player.new("curly", 125)
	puts player3
	player3.blam
	puts player3
	player3.woot
	puts player3
	puts player3.health