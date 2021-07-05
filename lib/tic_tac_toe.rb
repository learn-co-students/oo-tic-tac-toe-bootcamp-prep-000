class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
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
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
  ]
  
  def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, character = "X")
  @board[index] = character
end
  
  def position_taken?(index)
  if  @board[index] == nil || @board[index] == "" || @board[index] == " " 
    return false
  else 
    return true
   end 
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
  
  def won?
WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end

def full?
 if @board.include?(" ")
   return false
 else
   true
 end
 end
 
 def draw?
  if full? && !won?
    return true
  else 
    return false
end
end

def over?
  if won? || full? || draw?
  return true
end
end

def winner
combo = won?
if combo 
  return @board[combo[0]]
end
end


def play
  until over?
  turn
end
if won?
  puts "Congratulations #{winner}!"
elsif draw?
puts "Cat's Game!"
end
end
   
end