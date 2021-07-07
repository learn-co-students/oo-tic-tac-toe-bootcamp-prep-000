class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],[0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]
    ] 
 
 
  def initialize
@board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

end


def display_board()



puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "  
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 


end
def input_to_index(user_input)
  user_input.to_i - 1 
  
 

end 

def move(index,character)
  @board[index] = character 

end 

def position_taken?(index)
  if @board [index] == " " || @board [index] == "" || @board [index] == nil
  return false
  
  elsif @board [index] == "X" || @board [index] == "O"
  return true 
end 
end 

def valid_move?(index)

if index.between?(0,8) && !position_taken?( index)

return true 

end 
end 

def turn_count()
  counter = 0 
  @board.each do |space|
    if space == "X" || space == "O"
      counter +=1
    end 
end
counter 
end 

def current_player()
if turn_count() % 2 == 0 
  "X"
else 
  "O"
  end 
end 

def turn()
  puts "Please enter 1-9:"
  user_input = gets.strip
index = input_to_index(user_input)   
  
  
 if valid_move?(index) 
   move( index, current_player())
    display_board()

else    
   turn() 
   
   
end
end 

def won?()
  WIN_COMBINATIONS.each do |combo| 
    if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
      return combo
     end 

    if @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
      return combo
    end 
  end
  return false 
end

def full?()

@board.all?{|space|  space == "X" || space == "O"}

 
end

def draw?()

 full?() && !won?()
end 

def over?()
 
 draw?() || won?() && full?() || won?() && !full?()
 
end 

def winner()

  combo = won?()
  if won?() && @board[won?()[0]] == "X" 
    return @board[won?()[0]]
   
  elsif won?() && @board[won?()[0]] == "O"     
    return @board[won?()[0]]

  else 
    return nil
  end
end 

def play()
   
while !over?() 
turn()

end
if won?()
  puts "Congratulations #{winner()}!"
  
 elsif draw?()
puts  "Cat's Game!" 
 
end
end
end 

