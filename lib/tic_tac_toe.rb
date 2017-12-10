class TicTacToe

def initialize(board = nil)
  @board = board || Array.new(9," ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
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
  converted_input = "#{user_input}".to_i - 1
end

def move(converted_input, character)
  @board[converted_input] = character
end

def position_taken?(index)
  position = nil
    if (@board[index] ==  " " || @board[index] == "" || @board[index] == nil)
    position = false
    else
    position = true
    end
    position
end

def valid_move?(index)
move = nil
  if index.between?(0,8) && !position_taken?(index)
    move = true
  else
    move = false
  end
  move
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  converted_input = input_to_index(user_input)
  if valid_move?(converted_input) == true
  move(converted_input, current_player())
  display_board()
  else
    turn()
  end
end

def turn_count
  counter = 0
  @board.each do |turn|
  if turn == "X" || turn == "O"
     counter += 1
  end
end
counter
end

def current_player

  if turn_count == 0
    return "X"
  elsif turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end

def full?
  @board.all? do |combo|
    combo == "X" || combo == "O"
  end
end

def draw?
  full? and !won?
end

def over?
  draw? or won?
end

def winner
  if winner = won?
    @board[winner[0]]
  end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
