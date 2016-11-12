require_relative '../config/environment.rb'

# The Match class defines the basic rules of the game
# including winning conditions, moves, draw conditions, and more
class Match
  attr_accessor :board, :player_one, :player_two

  WIN_COMBINATIONS = [
      [0, 1, 2], # top row
      [3, 4, 5], # middle row
      [6, 7, 8], # bottom row
      [0, 3, 6], # left column
      [1, 4, 7], # middle column
      [2, 5, 8], # right column
      [0, 4, 8], # top left to bottom right diagonal
      [6, 4, 2] # bottom left to top right diagonal
  ].freeze

  def initialize
    @board = Board.new
    puts ''
    init_players
    puts ''
    sleep(1)
    puts "New match:
#{@player_one.name}(#{@player_one.token})
vs.
#{@player_two.name}(#{@player_two.token})!"
    sleep(2)
  end

  def turn_count
    occupied_cells = @board.select { |cell| cell == 'X' || cell == 'O' }
    occupied_cells.length
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if  win_combination.all? { |index| @board[index] == 'X' } ||
          win_combination.all? { |index| @board[index] == 'O' }
        return win_combination
      end
    end
    false
  end

  def full?
    @board.all? { |i| i != ' ' }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winning_token
    @board[won?.first]
  end

  def turn
    current_player.go(@board, opponent)
  end

  def current_player
    turn_count.even? ? @player_one : @player_two
  end

  def opponent
    current_player == @player_two ? @player_one : @player_two
  end

  def winner
    winning_token == @player_one.token ? @player_one : @player_two
  end
end
