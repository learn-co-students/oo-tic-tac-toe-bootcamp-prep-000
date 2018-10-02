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
  [2,4,6]]
  
  
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
  
 def move(index, player_token)
    @board[index] = player_token
end
 
 def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end
  
  def turn_count
    turn = 0 
    @board.each do |i|
    if i =="X" || i =="O"
      turn +=1
      end
    end
    return turn
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
WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def full?
 if @board.all? {|position| position =="X" || position =="O"}
   return TRUE
 else 
   return FALSE
end
end
  
def draw? 
  if !won? && full?
    return TRUE
 else
  return 
  FALSE
  end
end  
  
def over?
  if won? || full?|| draw?
       return TRUE
  elsif !won? || !draw?
       return FALSE
  end
end
  
def winner
  win_combo = won?
  if won?
    if @board[win_combo[1]] =="O"
  return "O"
else
  return "X"
end
end
else 
  return nil
end  
  
def play
while !over?  do
  current_player
  turn
end
if won?
  puts "Congratulations #{winner}!"
else
  puts "Cat's Game!"
  end
end  
  
  
end