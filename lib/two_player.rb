require_relative 'cpu.rb'
require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game_rules.rb'

class TwoPlayer
  include GameRules

  def initialize
    @board = Board.new
    puts 'Player 1, please enter your name.'
    @player_one = Player.new
    @player_one.token = 'X'
    puts 'Player 2, please enter your name.'
    @player_two = Player.new
    @player_two.token = 'O'
  end

  def turn
    token = current_token
    puts "#{player_name}, please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, token)
      @board.display
    else
      turn
    end
  end

  def current_token
    turn_count.even? ? @player_one.token : @player_two.token
  end

  def player_name
    turn_count.even? ? @player_one.name : @player_two.name
  end

  def winner
    @board.status[won?.first] == @player_one.token ? @player_one : @player_two
  end
end
