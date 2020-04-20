class TicTacToe
def initialize
  @board = Array.new(9, " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  @user_input = user_input.to_i
  index = @user_input - 1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  if @board[index] != " "
    return true
  else
    return false
  end
end

def valid_move?(index)
  spot = index.to_i
  if position_taken?(spot) == false && spot.between?(0, 8)
    return true
  else
    return false
  end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  if turn_count.even? == true
    return "X"
  else
    return "O"
  end
end

def turn
  puts "Please enter 1-9:"
  num = gets.strip
  index = input_to_index(num)
  if valid_move?(index) == true
    move(index, current_player)
    return display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.detect do |win_combo|
    if position_taken?(win_combo[0]) && @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]]
      return win_combo
  end
end
end

def full?
  if @board.all? {|i| i == "X" || i == "O"}
    return true
  else
    return false
  end
end

def draw?
  if !won? && full?
    return true
  elsif won?
    return false
  else !full?
    return false
  end
end

def over?
  if won? || full? || draw?
    return true
  else
    return false
  end
end

def winner
  win_token = won?
  if won?
    return @board[win_token[0]]
  end
end

def play
  until over?
    turn
  end
  if won?
    winner == "X" || winner == "O"
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
