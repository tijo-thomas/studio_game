require_relative 'game'

describe Game do

  before do
    @game = Game.new("Knuckleheads")

    @initial_health = 100
    @player = Player.new("moe", @initial_health)
    
    @game.add_player(@player)
    $stdout = StringIO.new
  end
  
  it "has a title" do
  	@game.title.should == "Knuckleheads"
  end

  it "woots the player if a high number, ie. 5 or 6, is rolled" do
  	Die.any_instance.stub(:roll).and_return(5)

  	@game.play(2)

  	@player.health.should == @initial_health + (15 * 2)
  end

  it "skips the player if a medium number, ie. 3 or 4, is rolled" do
  	Die.any_instance.stub(:roll).and_return(3)

  	@game.play(2)

  	@player.health.should == @initial_health
  end

  it "blams the player if a low number, ie. 1 or 2, is rolled" do
  	Die.any_instance.stub(:roll).and_return(1)

  	@game.play(2)

  	@player.health.should == @initial_health - (10 * 2)
  end

  it "assigns a treasure for points during a player's turn" do
    game = Game.new("Knuckleheads")
    player = Player.new("moe")

    game.add_player(player)

    game.play(1)

    player.points.should_not be_zero

    # or use alternate expectation syntax:
    # expect(player.points).not_to be_zero
  end
  
end