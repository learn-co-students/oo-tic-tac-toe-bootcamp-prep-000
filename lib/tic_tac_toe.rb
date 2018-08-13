require 'pry'

class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  
  def initialize(board=nil)
    @board = board || Array.new(9, ' ')
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(position, current_player)
    @board[position] = current_player
  end
  
  def position_taken?(index)
    !@board[index].strip.empty?
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count { |element| element == 'X' || element == 'O' }
  end
  
  def current_player
    turn_count % 2 == 0 ? 'X' : 'O'
  end
  
  def turn
    puts 'What is your move? (1-9)'
    index = input_to_index(gets.strip)
    
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |winning_combo|
      @board[winning_combo[0]] != ' ' &&
      @board[winning_combo[0]] == @board[winning_combo[1]] &&
      @board[winning_combo[1]] == @board[winning_combo[2]]
    end
  end
  
  def full?
    @board.all? { |element| element == 'X' || element == 'O' }
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    won? ? @board[won?[0]] : nil
  end
  
  def play
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end