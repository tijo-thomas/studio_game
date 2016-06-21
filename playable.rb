module Playable

	def woot
		self.health += 15 # Changed from '@health' to 'self.health' because when assigning a value to an attribute you must use self
		puts "#{name} got wooted!"
	end

	def blam
		self.health -= 10 # Changed from '@health' to 'self.health' because when assigning a value to an attribute you must use self
		puts "#{name} got blammed!"
	end

	def strong? # methods with '?' are called predicate methods
		health > 100
	end	
	
end