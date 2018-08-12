class TicTacToe

def initialize
  @board = [" "," "," "," "," "," "," "," "," "]
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
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

def move(index, value)
  @board[index] = value
end

def position_taken?(index)
  taken = nil
if  @board[index] == "" || @board[index] == " " || @board[index] == nil
  taken = false
else
  taken = true
  end
  taken
end

def valid_move?(index)
  move = nil
if index.between?(0,8) && position_taken?(index) == false
  move = true
end
move
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
turn = 0
@board.each do |board|
if board == "O"
 turn += 1
 elsif board == "X"
   turn += 1
end
end
turn
end

def current_player
 if turn_count.even?
   return "X"
 else return "O"
 end
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
    else false
    end
  end
end

def full?
if @board.include?("") || @board.include?(" ")
  return false
else
  return true
  end
end

def draw?
if !won? && full?
  return true
else return false
  end
end

def over?
if won? || draw? || full?
  return true
else
  return false
  end
end

def winner
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
if !won? || draw?
    return nil
  elsif won? && @board[win_index_2] == "X"
    return "X"
  elsif won? && @board[win_index_1] == "O"
    return "O"
    end
  end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else puts "Cat's Game!"
  end
end




end
