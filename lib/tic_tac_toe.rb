class TicTacToe
  def initialize(board = nil)
  @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(position, char = "X")
@board[position-1] = char
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(index)
  if index.between?(0, 8) && !position_taken?(index)
    return true
  else
    return false
  end
end

def input_to_index(user_input)
index= user_input.to_i - 1
end

def turn
  puts "Please enter 1-9:"
  user_input= gets.strip
  index= input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
      turn
  end
end

def turn_count
    counter = 0
    @board.each do |marker|
      if marker == "X" || marker == "O"
      counter += 1
      end
    end
    return counter
end

def current_player
  if turn_count.even?
    return "X"
  else
    return "O"
  end
end

def won?
WIN_COMBINATIONS.each do |win_combination|
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
    end
  end
  return false
end

def full?
  @board.all? {|player| player != " "}
end

def draw?
if won? == false && full? == true
  return true
elsif won? == false && full? == false
  return false
else
  return false
  end
end

def over?
if won? != false || draw? == true || full? == true
  return true
  end
end

def winner
if won? != false
  win_combination = won?
end
if won? != false && @board[win_combination[0]] == "X"
  return "X"
elsif won? != false && @board[win_combination[0]] == "O"
  return "O"
else
  return nil
end
end

def play
  until over?
    turn
  end
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  elsif draw? == true
    puts "Cats Game!"
  end
end

end
