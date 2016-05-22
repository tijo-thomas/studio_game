require_relative "player"

describe Player do

	before do
		@initial_health = 150
		@player = Player.new("larry", @initial_health)
		$stdout = StringIO.new #prevents stdout printing to console
	end
	
	it "has a capitalized name" do
		@player.name.should == "Larry"
	end

	it "has an initial health" do
		@player.health.should == 150
	end

	it "has a string representation" do
		@player.to_s.should == "I'm Larry with a health of 150 and a score of 155."
	end

	it "computes a score as the sum of its health and length of name" do
		@player.score.should == 155
	end

	it "increases health by 15 when wooted" do
		@player.woot

		@player.health.should == @initial_health + 15
	end

	it "decreases health by 10 when blammed" do
		@player.blam

		@player.health.should == @initial_health - 10
	end

	context "with a health greater than 100" do # context is for specific states that have a criteria
		before do
			@player = Player.new("larry", 150)
		end

		it "is strong" do
			@player.should be_strong # same as @player.strong?.should be_true
		end
	end

	context "with a health less than or equal to 100" do
		before do
			@player = Player.new("larry", 100)
		end

		it "is wimpy" do
			@player.should_not be_strong # same as @player.strong?.should_not be_true
		end
	end

end