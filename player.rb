require_relative "treasure_trove"
require_relative "playable"

class Player
	include Playable
	
	attr_accessor :name
	attr_reader :health

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health
		@found_treasures = Hash.new(0) # Initializes an hash instance that has a default of 0 for all values.
	end

	def self.from_csv(string)
		name, health = string.split(',')
		Player.new(name, Integer(health))
	end

	def score
		@health + points
	end

	def points
		@found_treasures.values.reduce(0, :+)
	end

	# Adds key-value pair to @found_treasures hash.
	def found_treasure(treasure)
		@found_treasures[treasure.name] += treasure.points
		puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
		puts "#{@name}'s treasures: #{@found_treasures}."
	end

	def <=>(other) # the comparison operator, this is what ruby uses for sorting
		other.score <=> score
	end

	def to_s
		"I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
	end

	def each_found_treasure
		@found_treasures.each do |name, points|
			yield Treasure.new(name, points)
		end
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