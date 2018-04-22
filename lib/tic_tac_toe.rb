class TicTacToe
def initialize(board = nil)
  @board = board || Array.new(9, " ")
end


WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[6, 4, 2]
]


def display_board
  puts     " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts     "-----------"
  puts     " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts     "-----------"
  puts     " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def input_to_index(user_input)
  user_input.to_i - 1
end


def move(index, token = "X")
  @board[index] = token
end


def position_taken?(index)
  ! (@board[index] ==  " " || @board[index] == "" || @board[index] == nil)
end


def valid_move?(index)
  (!position_taken?(index) && index.between?(0,8))
end


def turn_count
  @board.count{|token| token == "X" || token == "O"}
end


def current_player
  turn_count % 2 == 0 ? "X" : "O"
end


def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end


def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
  end
end

def full?
  @board.all? do |spaces|
  spaces == "X" || spaces == "O"
 end
end


def draw?
if full? && !won?
  true
 end
end


def over?
  if full? || won? || draw?
    true
   end
  end

  def winner
  if winning_combination = won?
    @board[winning_combination[0]]
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
