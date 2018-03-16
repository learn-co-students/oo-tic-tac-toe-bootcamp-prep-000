class TicTacToe

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

# def display_board
#   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#   puts "-----------"
#   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#   puts "-----------"
#   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
# end

def input_to_index(input)
  @input = input.to_i - 1
end

def move(index, value)
  @board[index] = value
end

def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  count = 0
    @board.each do |i|
      if i != " "
      count += 1
      end
    end
  count
end

def current_player
  if turn_count % 2 == 0
  return "X"
  else
  return "O"
  end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
    if !valid_move?(index)
      turn
    else
      move(index, current_player)
    end
  display_board
end

def won?
  WIN_COMBINATIONS.each do |win|
    if win.all? {|y| @board[y] == "X"} || win.all? {|y| @board[y] == "O"}
      return win
    end
  end
  false
end


def full?
  @board.all? {|taken| taken != " "}
end

def draw?
  !won? && full?
end

def over?
  draw? || full? && won? || full? && !won?
end

def winner
  player = won?
  if player
    @board[player[0]]
  end
end

def play
  while !over? && !won?
    turn
  end
  if draw?
    puts "Cat's Game!"
  elsif winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  end
end

end
