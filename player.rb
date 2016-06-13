class Player
	
	attr_accessor :name
	attr_reader :health

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health
		@found_treasures = Hash.new(0) # Initializes an hash instance that has a default of 0 for all values.
	end

	def to_s
		"I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
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
		@health + points
	end

	def strong? # methods with '?' are called predicate methods
		@health > 100
	end

	def <=>(other) # the comparison operator, this is what ruby uses for sorting
		other.score <=> score
	end

	# Adds key-value pair to @found_treasures hash.
	def found_treasure(treasure)
		@found_treasures[treasure.name] += treasure.points
		puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
		puts "#{@name}'s treasures: #{@found_treasures}."
	end

	def points
		@found_treasures.values.reduce(0, :+)
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