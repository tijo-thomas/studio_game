module Playable

	def woot
		@health += 15
		puts "#{@name} got wooted!"
	end

	def blam
		@health -= 10
		puts "#{@name} got blammed!"
	end

	def strong? # methods with '?' are called predicate methods
		@health > 100
	end	
	
end