def time
	current_time = Time.new
	current_time.strftime("%I:%M:%S")
end

def say_hello(name, health=100)
	"I'm #{name.capitalize} with a health of #{health} as of #{time}."
end

puts say_hello("larry", 60)
puts say_hello("curly", 125)
puts say_hello("moe")
puts say_hello("shemp", 90)
















# name1 = "larry"
# health1 = 60
# name2 = "curly"
# health2 = 125
# name3 = "moe"
# health3 = 100
# name4 = "shemp"
# health4 = 90
# current_time = Time.new


# puts "#{name1.capitalize}'s health is #{health1 / 9.0}"
# puts "Players: \n\tlarry\n\tcurly\n\tmoe"
# puts "#{name2.upcase} has a health of #{health2}."

# health2 = health1
# puts "#{name2.upcase} has a health of #{health2}."

# health1 = 30
# puts "#{name1.upcase} has a health of #{health1}."
# puts "#{name2.upcase} has a health of #{health2}."

# text = "#{name3.capitalize} has a health of #{health3}."
# puts text.center(50, '*')

# puts "#{name4.capitalize.ljust(30,'.')} #{health4} health"

# puts "The game started on #{current_time.strftime("%A %m/%d/%Y at %I:%M %p")}."