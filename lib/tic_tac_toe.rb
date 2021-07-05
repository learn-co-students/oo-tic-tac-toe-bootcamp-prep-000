class TicTacToe
  
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," ",]
  end
  
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
  
  def input_to_index(user_input)
num = (user_input.to_i - 1)
end
  
  def move(index,player="X")
 @board[index]=player
end

  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end
  
  def valid_move?(index)
  if((index.between?(0,8)) && !(position_taken?(index)))
    true
  else
    false
 end
end
  
  
  def turn()
  puts "Please enter 1-9:"
  number = gets.strip
  index = input_to_index(number)
  if valid_move?(index)
    move(index,current_player())
  else
    turn()
  end
  display_board()
end
  
def turn_count()
 counter =0
 @board.each do |turns|
   if ((turns=="X")||(turns=="O"))
     counter+=1
   end
end
counter
end

  
  def current_player()
  total_turns = turn_count()
    (total_turns.even?) ? "X" : "O"
end
  
  def is_array_empty()
  @board.all? {|c| (c==" ")||(c=="")}
end
  
  
  def won?()
  
 if((is_array_empty()==true)||(@board == nil))
  return false
 else

  WIN_COMBINATIONS.each do |win_combination|
    
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    

     if(((position_1=="X")&&(position_2=="X")&&(position_3=="X"))||((position_1=="O")&&(position_2=="O")&&(position_3=="O")))
      
    return win_combination
    
    else
      
      false
      
    end
  
  end
 end
 false
end
  
  def full?()
    !@board.any? {|index| (index==" ")||(index=="")}
end

  def over?()
  in_progress= false
  if(won?()||draw?()||full?())
 return true
 end
  if full?()==false 
  return false
  end
  if((won?().class==Array)||(draw?()==true)||(full?()==true))
 in_progress=true
 end
  if((full?()==false))
  in_progress= false
  end
return in_progress
end
  
  def winner()
if((won?().class==Array))
  temp_array = won?()
  index = temp_array[0]
  @board[index]
 end
end
  
  def draw?()
 if !won?() && full?()
 return true
 elsif !won?()==false && !full?()
 return false
 else won?()
   return false
end
end
  
  def play()
until over?()
current_player()
turn()
end
if(won?())
  puts "Congratulations #{winner()}!"
else 
  puts "Cat's Game!"
end
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
end