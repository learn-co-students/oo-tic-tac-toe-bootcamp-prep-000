class TicTacToe
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
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
#*********************************************
  def input_to_index(input)
   input.to_i - 1
  end
#********************************************
def move(index, current_player = "X")
  @board[index] = current_player
end
#*********************************************
def position_taken?(index)
  @board[index] != " " && @board[index] != ""
end
#*********************************************
def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end
#********************************************
def turn
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end
#*********************************************
def turn_count
  @board.count{|token| token == "X" || token == "O"}
end
#*********************************************
def current_player
  turn_count % 2 == 0 ? "X" : "O"
end
#*********************************************
def won?
  WIN_COMBINATIONS.detect { |combination|
    @board[combination[0]]==@board[combination[1]] && @board[combination[1]]==@board[combination[2]] && @board[combination[1]]!=" "
  }
end
#*********************************************
def full?
    @board.count {|cell|   cell=="X" || cell=="O"}==9
end
#*********************************************
def draw?
  full? && !won?

end
#*****************************
def over?
 full? || won? || draw?
end
#*********************************************
def winner
if !won?
  return nil
end
return @board[won?[0]]
end
#********************************************
def play
  puts "Welcome to Tic Tac Toe!"
  display_board
  while !over? do
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  end
  if draw?
    puts "Cat's Game!"
  end
end


end
