require 'pry'
class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS =
  [[0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]]

  winning_player = "X"

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def full?
  # @board.all? {|position| position == "X" || position == "O"}
  @board.all?{|occupied| occupied != " "}
end

def over?
  full? || won?
  # full?(board) || won?(board)
end

def draw?
  # (full?) && !(won?)
  if full?
    if won?
      false
    else
      true
    end
  end
end

# def won?
#   WIN_COMBINATIONS.detect do |win_combo|
#     if @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[0]] == @board[win_combo[2]]
#       return win_combo
#     end
#     false
#   end
# end

def won?
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      winning_player = "X"
      return win_combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      winning_player = "O"
      return win_combo
    else
      false
    end
  end
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

def move(position, current_player)
    @board[position] = current_player
end

def position_taken?(index)
  ((@board[index] != " ") && (@board[index] != ""))
end

# def position_taken?(index_i)
#   ((@board[index_i] == "X") || (@board[index_i] == "O"))
# end

def valid_move?(index)
  index.between?(0, 8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def current_player
  turn_count.even? ? "X" : "O"
end

def play
  while !over? && !draw?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end
