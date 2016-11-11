require_relative 'cpu.rb'
require_relative 'board.rb'
require_relative 'human.rb'
require_relative 'game_rules.rb'

# The TwoPlayer class is the set of specific rules and scripts
# governing a one player human v. human game
class TwoPlayer
  include GameRules

  def initialize
    @board = Board.new
    puts ''
    init_players
    puts ''
    puts "New match:
#{@player_one.name}(#{@player_one.token})
vs.
#{@player_two.name}(#{@player_two.token})!"
    puts ''
    sleep(2)
  end

  def init_players
    puts 'Player 1, please enter your name.'
    @player_one = Human.new
    @player_one.sets_token(@player_two)
    puts 'Player 2, please enter your name.'
    @player_two = Human.new
    @player_two.sets_token(@player_one)
  end

  def turn
    current_player.turn(@board)
  end

  def current_player
    turn_count(@board).even? ? @player_one : @player_two
  end

  def winner
    winning_token(@board) == @player_one.token ? @player_one : @player_two
  end
end
