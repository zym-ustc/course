class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    # YOUR CODE HERE
    arrange = {'S'=>'P','P'=>'R','R'=>'S'}
    if arrange.has_key?(player1.last) && arrange.has_key?(player2.last)
      then
        if player1.last == player2.last 
          then 
            return player1
          else
            if arrange[player1.last] == player2.last then return player1
                                                     else return player2
            end
        end
      else
        raise RockPaperScissors::NoSuchStrategyError.new("Strategy must be one of R,P,S")
    end
  end
  
  def self.tournament_winner(tournament)
    # YOUR CODE HERE
    if tournament.first.class == String 
       then return tournament
       else 
         p1 = tournament_winner(tournament.first)
         p2 = tournament_winner(tournament.last)
         return winner(p1,p2)
    end
  end

end



#@rock = ['Armando','R'] ; @paper = ['Dave','P'] ; @scissors = ['Sam','S']
#RockPaperScissors.winner(@rock, ['Dave', 'w'])
=begin
 puts RockPaperScissors.winner(@rock, @scissors)
 puts RockPaperScissors.winner(@paper, @scissors)
 puts RockPaperScissors.winner(@rock, @paper)
 puts RockPaperScissors.winner(@scissors, ['Dave','S'])
 puts RockPaperScissors.tournament_winner([@rock,@paper])
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
 puts RockPaperScissors.tournament_winner(tourney)

=end
