class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9," ")
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,8]]
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index
  user_input.to_i - 1
end

def move(index, player="X")
  @board[index] = player
end

def position_taken?
  input_to_index
  @board[input_to_index] == "X" || @board[input_to_index] == "O"
end

def valid_move?
  index.between?(0,8) && !position_taken?
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?
    move(index)
    display_board
  else
    turn
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0? "X" : "O"
  end

  def won?
  WIN_COMBINATIONS.detect do | combination |
    @board[combination[0]] == @board[combination[1]] &&
    @board[combination[1]] == @board[combination[2]] &&
    position_taken?(combination[0])
    end
end

def full?
  @board.all?{|token| token == "X" || token == "O"}
end

def draw?
  full? && !won?
end

def over?
  draw? || won?
end

def winner
  if grand_winner = won?
    @board[grand_winner.first]
  end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner(@board)}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
