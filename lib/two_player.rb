require_relative 'cpu.rb'
require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game_rules.rb'

class TwoPlayer
  include GameRules

  def initialize
    @board = Board.new
    puts ''
    puts 'Player 1, please enter your name.'
    @player_one = Player.new
    puts ''
    @player_one.get_token
    @player_one.puts_token
    puts 'Player 2, please enter your name.'
    @player_two = Player.new
    set_player_two_token
    puts ''
    puts "New match: #{@player_one.name}(#{@player_one.token}) vs. #{@player_two.name}(#{@player_two.token})!"
    puts ''
    sleep(2)
  end

  def set_player_two_token
    @player_one.token == 'X' ? @player_two.token = 'O' : @player_two.token = 'X'
  end

  def turn
    token = current_token
    puts ''
    puts "#{player_name}, please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, token)
      puts ''
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
