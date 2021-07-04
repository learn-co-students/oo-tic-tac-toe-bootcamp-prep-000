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

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def input_to_index(user_input)
  user_input = user_input.to_i - 1
end 

def move(index, current_player)
  @board[index] = current_player
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  count = 0
 @board.each do |index|
 if index == "X" || index == "O"
  then count += 1  
end
end
return count
end

def current_player
  if turn_count.even?  
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

# Define your WIN_COMBINATIONS constant
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

def won?
 WIN_COMBINATIONS.each do |combo| 
  if position_taken?(combo[0]) && @board[combo[0]] === @board[combo[1]] && @board[combo[1]] === @board[combo[2]] 
   return combo
end 
end
return false
end 

def full?
  if @board.all? {|token| token == "X" || token == "O"} 
      return true
    end
  return false 
end 

def draw?
if full? && !(won?) 
  true  
else false 
end 
end 

def over?
if draw? || won?
  true
else false 
end 
end 

def winner 
  if won?
    WIN_COMBINATIONS.each do |combo| 
      if position_taken?(combo[0]) && @board[combo[0]] === @board[combo[1]] && @board[combo[1]] === @board[combo[2]] 
    return @board[combo[0]]   
end 
end
end 
end 

def play
   until over?
   turn
end 
  if won?
    puts "Congratulations #{winner}!"
  elsif  draw?
  puts "Cat's Game!"
end 
end
  
end 