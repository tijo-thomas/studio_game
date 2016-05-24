require_relative "player"
require_relative "die"

module GameTurn
	
	def self.take_turn(player) # a module method needs to be defined on the module itself.
		die = Die.new
		case die.roll
		when 1..2
			player.blam
		when 3..4
			puts "#{player.name} was skipped."
		else
			player.woot
		end
	end

end

if __FILE__ == $0
	player = Player.new("curly", 125)
	GameTurn.take_turn(player)
end