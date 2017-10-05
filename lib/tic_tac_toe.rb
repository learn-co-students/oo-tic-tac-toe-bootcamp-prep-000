class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [
  [0, 1, 2], #top_row_win
  [3, 4, 5], #middle_row_win
  [6, 7, 8], #bottom_row_win
  [0, 3, 6], #left_column_win
  [1, 4, 7], #middle_column_win
  [2, 5, 8], #right_column_win
  [0, 4, 8], #left_diagonal_win
  [2, 4, 6] #right_diagonal_win
]

def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end


def valid_move?(index)
if index.between?(0, 8) && !position_taken?(index)
  return true
else index > 9 || position_taken?(index)
  return nil
end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index) == true
    move(index, current_player)
    display_board
  else
    turn
end
end


def turn_count
  counter = 0
  @board.each do |move|
    if move == "X" || move == "O"
      then counter += 1
end
end
return counter
end


def current_player
if turn_count % 2 != 0
  "O"
else
  "X"
end
end


def won?
  WIN_COMBINATIONS.each do |winning|
    win_x = winning.all? do |index|
      @board[index] == "X"
    end
    win_o = winning.all? do |index|
      @board[index] == "O"
    end
    if win_x || win_o
      return winning
    end
  end
  false
end

def full?
!@board.find{|i| i == " "}
end

def draw?
  full? && !won?
end

def over?
  if full? || won?
    return true
  end
  false
end

def winner
  done = won?
  if done
    @board[done[0]]
  else
    nil
  end
end

def play
until over? || draw?
  current_player
  turn
end
if won?
  puts "Congratulations #{winner}!"
else draw? == true
  puts "Cat's Game!"
end
end

end
