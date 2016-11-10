require_relative 'cpu.rb'
require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game_rules.rb'

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
    @player_one = Player.new
    @player_one.sets_token(@player_two)
    puts 'Player 2, please enter your name.'
    @player_two = Player.new
    @player_two.sets_token(@player_one)
  end

  def turn
    token = current_token
    puts ''
    puts "#{player_name}, please enter 1-9:"
    input = gets.strip
    make_move(input, token)
  end

  def make_move(input, token)
    if valid_move?(@board, input)
      move(@board, input, token)
      puts ''
      @board.display
    else
      turn
    end
  end

  def current_token
    turn_count(@board).even? ? @player_one.token : @player_two.token
  end

  def player_name
    turn_count(@board).even? ? @player_one.name : @player_two.name
  end

  def winner
    winning_token(@board) == @player_one.token ? @player_one : @player_two
  end
end
