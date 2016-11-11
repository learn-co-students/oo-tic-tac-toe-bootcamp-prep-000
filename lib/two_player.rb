require_relative 'cpu.rb'
require_relative 'board.rb'
require_relative 'human.rb'
require_relative 'game_rules.rb'

# The TwoPlayer class is the set of specific rules and scripts
# governing a one player human v. human game
class TwoPlayer
  include GameRules

  def init_players
    puts 'Player 1, please enter your name.'
    @player_one = Human.new
    @player_one.sets_token(@player_two)
    puts 'Player 2, please enter your name.'
    @player_two = Human.new
    @player_two.sets_token(@player_one)
  end
end
