
class TicTacToe
  # access with `TicTacToe::WIN_COMBINATIONS`
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left column
    [1,4,7],  # Middle column
    [2,5,8],  # Right column
    [0,4,8],  # Diaonal 1
    [2,4,6]  # Diagonal 2
    ]
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def empty?
    @board.all? { |pos| (pos.nil? || pos == " ")} 
  end
  
  def full?
    @board.none? {|this_pos| (this_pos.nil? || this_pos == " ")} 
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end  
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end  
  
  def valid_move?(index)
    !position_taken?(index) && (index >= 0 && index <= 8)
  end  
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      char =current_player
      if valid_move?(index)
         move(index, char)
         display_board
      else
        turn
      end  
  end  
  
  def won?
    # .detect  returns the first item in the collection for which the 
    #  block returns TRUE and returns nil if it doesn't find any.
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      end
        false
    end
  end  
  
  def draw?
    !(won?)  && (full?)
  end
  
  def over?
    won? || full? || draw?
  end
  
  def winner
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return "X"
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return "O"
      else
        nil
      end
    end
  end
 
  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end

#  ./bin/tictactoe
#require 'pry'
#require_relative '../lib/tic_tac_toe.rb'

#puts "Welcome to Tic Tac Toe!"
#game = TicTacToe.new
#game.display_board
#game.play






