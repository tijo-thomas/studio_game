require_relative "auditable"

class Die
	include Auditable

	attr_reader :number

	def initialize
		roll
	end

	def roll
		@number = rand(1..6)
		audit
		@number
	end
	
end

# The if expression only runs the enclosing code if the name
# of the current source file (__FILE__) is the same as the name
# of the Ruby program file being run
if __FILE__ == $0
	die = Die.new
	puts die.roll
	puts die.roll
	puts die.roll
end