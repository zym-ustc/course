require 'rock_paper_scissors'
require 'byebug'

describe RockPaperScissors, :pending => true do
  before(:each) do
    @rock = ['Armando','R'] ; @paper = ['Dave','P'] ; @scissors = ['Sam','S']
  end
  describe 'game' do
    it 'rock breaks scissors [10 points]' do
      expect(RockPaperScissors.winner(@rock, @scissors)).to be == @rock
    end
    it 'scissors cut paper [10 points]' do
      expect(RockPaperScissors.winner(@paper, @scissors)).to be == @scissors
    end
    it 'paper covers rock [10 points]' do
      expect(RockPaperScissors.winner(@rock, @paper)).to be == @paper
    end
    it 'first player wins if both use same strategy [10 points]' do
      expect(RockPaperScissors.winner(@scissors, ['Dave','S'])).to be == @scissors
    end
  end
  it "should raise NoSuchStrategyError if strategy isn't R, P, or S [10 points]" do
    expect(lambda{RockPaperScissors.winner(@rock, ['Dave', 'w'])}).to raise_error(
      RockPaperScissors::NoSuchStrategyError, "Strategy must be one of R,P,S")
  end
  describe 'tournament' do
    it 'base case [20 points]' do
      expect(RockPaperScissors.tournament_winner([@rock,@paper])).to be == @paper
    end
    it 'recursive case [30 points]' do
      tourney = [
        [
          [ ["Armando", "P"], ["Dave", "S"] ],      
          [ ["Richard", "R"], ["Michael", "S"] ]
        ],
        [
          [ ["Allen", "S"], ["Omer", "P"] ],
          [ ["David E.", "R"], ["Richard X.", "P"] ]
        ]
      ]
      expect(RockPaperScissors.tournament_winner(tourney)).to be == ['Richard', 'R']
    end
  end
end
