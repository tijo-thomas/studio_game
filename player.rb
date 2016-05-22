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

	def strong? # methods with '?' are called predicate methods
		@health > 100
	end
end

# The if expression only runs the enclosing code if the name
# of the current source file (__FILE__) is the same as the name
# of the Ruby program file being run
if __FILE__ == $0
	player = Player.new("moe")
	puts player.name
	puts player.health
	player.woot
	puts player.health
	player.blam
	puts player.health
end