require_relative '../config/environment.rb'

# The TwoPlayer class is the set of specific rules and scripts
# governing a one player human v. human game
class TwoPlayer < Match
  def init_players
    puts 'Player 1, please enter your name.'
    @player_one = Human.new
    @player_one.sets_token(@player_two)
    puts 'Player 2, please enter your name.'
    @player_two = Human.new
    @player_two.sets_token(@player_one)
  end
end
