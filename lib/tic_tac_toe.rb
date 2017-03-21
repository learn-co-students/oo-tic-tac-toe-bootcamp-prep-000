class TicTacToe
def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [2,4,6]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  index = input.to_i-1
end

def move(index, token)
@board[index] = token
end

def position_taken?(index)
@board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
!position_taken?(index) && index.between?(0,8)
end

def turn
   puts "Please enter a number (1-9):"
   user_input = gets.strip
   index = input_to_index(user_input)
   if valid_move?(index)
     token = current_player
     move(index, token)
   else
     turn
   end
   display_board
 end

def turn_count
count = 0
@board.each do |move|
  if move == "X" || move == "O"
  count += 1
  end
end
count
end

def current_player
turn_count.even? ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end

def full?
@board.all?{|cell| cell == "X" || cell == "O"}? true: false
end

def draw?
full? && !won?
end

def over?
  won? || draw? || full?
end

def winner
  if winning_combo = won?
    @board[winning_combo.first]
  end
end

def play
  while !over?
     turn
  end
puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
 end

end
