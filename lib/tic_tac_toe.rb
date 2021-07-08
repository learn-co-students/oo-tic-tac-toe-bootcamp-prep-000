class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
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
  user_input.to_i - 1
end 
  
  def move( index, character)
  @board[index] = character
end
 def position_taken?( location)
  @board[location] != " " && @board[location] != ""
end 

def valid_move?( index)
  index.between?(0,8) && !position_taken?(index)
end
  
  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?( index)
    move( index, current_player())
    display_board()
  else
    turn()
  end
end
  
  def turn_count()
  turn = 0
  @board.each do |square|
    if square != " "
      turn += 1 
    end
  end
  return turn
end
 
 def current_player()
  turn = turn_count()
  if turn == 0 || turn % 2 == 0
    player = "X"
 else 
    player = "O"
  end
return player
end 
  
  def won?()
  WIN_COMBINATIONS.each do |comb|
    if (@board[comb[0]] == "X" && @board[comb[1]] == "X" && @board[comb[2]] =="X") ||
      (@board[comb[0]] =="O" && @board[comb[1]] == "O" && @board[comb[2]] =="O")
      return comb
    end
  end
  return false
end
 
def full?()
 full = @board.all? do |square|
    ["X","O"].include?(square)
  end
  return full
end
  
def draw?()  
  if full?() && !won?()
    return TRUE
  else return false
  end  
end

def over?()
  if full?() || draw?() || won?()
    return TRUE
  else false
  end
end

def winner()
  winner = won?()
  if winner
    return @board[winner[0]]
  else return nil
  end
end

def play()
  
  until over?() do
    turn()
  end  
  
  if won?()
    puts "Congratulations #{winner()}!"
  elsif draw?()
  puts "Cat's Game!"
 end
end
  
  
end