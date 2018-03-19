class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def won?
    WIN_COMBINATIONS.detect do |array|
       @board[array[0]] == @board[array[1]] && @board[array[2]] == "X" && @board[array[0]] == @board[array[2]] ||
       @board[array[0]] == @board[array[1]] && @board[array[2]] == "O" && @board[array[0]] == @board[array[2]]

    end
end

def full?
  @board.all? { |element| element == "X" || element == "O" }
end

def draw?
  if full? && !won?
    return true
  else return false
  end
end

def over?
  won? || draw? || full?
end

def winner
  array = won?
  if array == nil
    nil
  elsif @board[array[0]] == "X"
    "X"
  else
    "O"
  end
end

def turn_count
  counter = 0
  @board.each do |position|
    if position == "X" || position == "O"
       counter += 1
    else
       counter += 0
    end
  end
  return counter
end


def current_player
  if turn_count % 2 == 0
    return "X"
  else return "O"
end
end

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

def move(index, current_player = "X")
  @board[index] = current_player
end

def position_taken?(index)
  @board[index] != " " && @board[index] != "" && @board[index] != nil
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
    display_board
  else
    turn
  end
end



def play

  while !over?
    turn
  end
  if won? && winner == "X"
    puts "Congratulations X!"
  elsif won? && winner == "O"
    puts "Congratulations O!"
  else
    puts "Cat's Game!"
  end
end
end
