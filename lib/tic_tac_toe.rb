class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [6, 4, 2], #bottom-left to top-right diagonal
  [0, 4, 8] #top-left to bottom-right diagonal
  ]
  
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

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    token = current_player
    move(index, token)
    display_board
  else
    turn
  end
end

def turn_count
  turn_number = 0
  @board.each do |token|
    if (token == "X" || token == "O")
      turn_number += 1
    end
  end
  return turn_number
end

def current_player
  turn_number = turn_count
  turn_number.even? ? "X" : "O"
end

def won?
    WIN_COMBINATIONS.detect do |i|
      win_index_1 = i[0]
      win_index_2 = i[1]
      win_index_3 = i[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
    end
end
  
def full?
    @board.all? do |i|
       i == "X" || i == "O"
    end
end

def draw?
  if full?
    if !(won?)
      return true
    else
      return false
    end
  else
    return false
  end
end
  
def over?
  draw? || won?
end
  
def winner
  if (won?)
    winning_array = won?
    return @board[winning_array[0]]
  else
    return nil
  end
end

def play
  until over? do
  turn
  end
if won?
  puts "Congratulations #{winner}!"
elsif draw?
  puts "Cat's Game!"
end
end
end
  
  

  
  