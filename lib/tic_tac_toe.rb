class TicTacToe

  def initialize(board = [" "," ", " ", " ", " ", " ", " ", " ", " "] )
    @board = board
  end

  def board=board
     @board = board
   end

   def board
     @board
   end

   WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player)
  board[index] = current_player
end

def position_taken?(index)
  board[index] != " " && board[index] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
  else
    turn
  end
  display_board
end

def turn_count
  turns = 0
board.each do |position|
  if position == "X" || position == "O"
    turns +=1
  end
end
turns
end

def current_player
  turn_count
  if turn_count % 2 == 0
    "X"
  else turn_count % 2 == 1
    "O"
end
end

def won?
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
    return combo
  elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
    return combo
  end
  end
  return false
end

def full?
  board.all? {|space| space == "X" || space == "O"}
end

def draw?
  if !won? && full?
  true
else
  false
end
end

def over?
  if won? || draw?
    true
else
  false
end
end

def winner
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
    return "X"
  elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
    return "O"
  end
  end
  return nil
end

def play
  display_board
  until over?
    turn
  end
  if winner
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
  end
end

end
